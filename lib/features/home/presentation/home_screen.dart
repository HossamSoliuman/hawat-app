import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/nav_requests.dart';
import '../../../app/router.dart';
import '../../../core/auth/session.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/providers.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/section_head.dart';
import '../../../core/widgets/states.dart';
import '../../lookups/data/lookups_repository.dart';
import '../../notifications/data/notifications_providers.dart';
import '../../sales/data/sale.dart';
import '../../sales/presentation/collect_sheet.dart';
import '../../trips/data/trip.dart';
import '../../trips/presentation/trip_actions_ui.dart';
import '../data/dashboard.dart';
import '../data/dashboard_providers.dart';

/// A departure this far past its time is late.
const _lateAfter = Duration(hours: 1);

/// Counted catch waiting this long turns amber: fish does not wait.
const _staleCatch = Duration(days: 2);

/// An invoice unpaid this long turns amber.
const _staleInvoice = Duration(days: 7);

/// الرئيسية, built around the boats and the money: where each boat is and its
/// next move, then the catch to sell and the money to collect, then the
/// period's figures and the stock. Renders the saved copy at once and
/// refreshes behind it.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final period = ref.watch(homePeriodProvider);
    final provider = dashboardControllerProvider(period);
    final state = ref.watch(provider);
    final data = state.value;
    final now = ref.watch(clockProvider)();

    Future<void> refresh() async {
      ref
        ..invalidate(unreadCountProvider)
        ..invalidate(ownerBoatsProvider);
      await ref.read(provider.notifier).refresh();
    }

    // A server before API 1.10.0 sends no fleet: the boats list stands in.
    final dashboard = data?.dashboard;
    final boats = dashboard != null && dashboard.fleet == null ? ref.watch(ownerBoatsProvider).value : null;
    final fleet = dashboard?.fleet ?? (boats == null ? null : dashboard!.fleetFrom(boats));

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: refresh,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _TopBar(now: now)),
              if (data?.refreshError != null)
                SliverToBoxAdapter(
                  child: OfflineBanner(savedAt: data!.savedAt, onRetry: refresh),
                ),
              if (data != null) ...[
                SliverToBoxAdapter(
                  child: _Fleet(boats: fleet, now: now),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(Hud.gutter, Hud.gap, Hud.gutter, Hud.gutter),
                  sliver: SliverList.list(children: _sections(data.dashboard, period, now)),
                ),
              ] else if (state.hasError)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: ErrorState(error: state.error!, onRetry: () => ref.invalidate(provider)),
                )
              else
                const SliverToBoxAdapter(child: _HomeSkeleton()),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _sections(Dashboard d, DashboardPeriod period, DateTime now) {
    const gap = SizedBox(height: Hud.gap);
    return [
      _NeedsAction(dashboard: d, now: now),
      gap,
      _Money(dashboard: d, period: period),
      gap,
      _Stock(lines: d.stock, tripsToSell: d.catchToSell),
    ];
  }
}

class _TopBar extends ConsumerWidget {
  const _TopBar({required this.now});

  final DateTime now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final user = ref.watch(currentUserProvider);
    final unread = ref.watch(unreadCountProvider).value ?? 0;
    final name = Fmt.firstName(user?.name ?? '');
    final greeting = now.hour < 12 ? l.greetingMorning(name) : l.greetingEvening(name);

    return Padding(
      padding: const EdgeInsets.fromLTRB(Hud.gutter, 12, Hud.gutter, 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              greeting,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 19),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 12),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                tooltip: l.notificationsTitle,
                onPressed: () => context.push(Routes.notifications),
                style: IconButton.styleFrom(
                  backgroundColor: c.panel,
                  side: BorderSide(color: c.border),
                  fixedSize: const Size.square(42),
                ),
                icon: const Icon(Icons.notifications_outlined, size: 21),
              ),
              if (unread > 0)
                PositionedDirectional(
                  top: -6,
                  end: -6,
                  child: IgnorePointer(
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 20),
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: c.danger,
                        border: Border.all(color: c.background, width: 2),
                      ),
                      child: Text(
                        unread > 99 ? '99+' : '$unread',
                        style: Theme.of(context).textTheme.labelSmall
                            ?.copyWith(color: Colors.white, fontSize: 10.5, fontWeight: FontWeight.w800, height: 1),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// الأسطول: one card per boat with where it is, for how long, and its one
/// next move. Late and overdue boats come first.
class _Fleet extends StatelessWidget {
  const _Fleet({required this.boats, required this.now});

  /// Null while the boats list loads (a server before API 1.10.0).
  final List<FleetBoat>? boats;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final boats = this.boats;
    if (boats == null) {
      return const Skeleton(
        child: Padding(
          padding: EdgeInsets.fromLTRB(Hud.gutter, 42, Hud.gutter, 0),
          child: Row(
            children: [
              Expanded(child: SkeletonBox(height: 130)),
              SizedBox(width: 10),
              Expanded(child: SkeletonBox(height: 130)),
            ],
          ),
        ),
      );
    }
    final views = [for (final (i, boat) in boats.indexed) (i, _BoatView.of(boat, now, l))]
      ..sort((a, b) => a.$2.rank != b.$2.rank ? a.$2.rank.compareTo(b.$2.rank) : a.$1.compareTo(b.$1));
    final cards = [for (final (_, view) in views) _BoatCard(view: view)];

    Widget row(List<Widget> children) => IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final (i, child) in children.indexed) ...[if (i > 0) const SizedBox(width: 10), child],
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Hud.gutter),
          child: SectionHead(
            title: l.fleetTitle,
            action: boats.isEmpty ? null : l.viewAll,
            onAction: () => context.push(Routes.boats),
          ),
        ),
        const SizedBox(height: 4),
        if (boats.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Hud.gutter),
            child: _EmptyFleet(),
          )
        else if (cards.length <= 2)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Hud.gutter),
            child: row([for (final card in cards) Expanded(child: card)]),
          )
        else
          // Two cards and a third peeking, so the strip reads as one that scrolls.
          LayoutBuilder(
            builder: (context, constraints) {
              final width = (constraints.maxWidth - Hud.gutter - 20) / 2.3;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: Hud.gutter),
                child: row([for (final card in cards) SizedBox(width: width, child: card)]),
              );
            },
          ),
      ],
    );
  }
}

/// ابدأ a scheduled trip, سجّل المصيد of one at sea, ابدأ رحلة (the trip
/// form on this boat) for a boat in port.
enum _Verb { start, logCatch, newTrip }

/// What a boat card says: its state in a tone, how long or until when, a
/// bar of the planned days at sea, and the one button for its next move.
class _BoatView {
  const _BoatView({
    required this.boat,
    required this.tone,
    required this.state,
    required this.rank,
    this.detail,
    this.progress,
    this.verb,
  });

  final FleetBoat boat;
  final Tone tone;
  final String state;
  final String? detail;
  final double? progress;
  final _Verb? verb;

  /// Late and overdue first, then what waits on the owner, then the rest.
  final int rank;

  factory _BoatView.of(FleetBoat boat, DateTime now, AppLocalizations l) {
    final trip = boat.trip;
    if (trip == null) {
      return switch (boat.status) {
        'في البحر' => _BoatView(boat: boat, tone: Tone.info, state: l.phaseAtSea, rank: 2),
        'صيانة' => _BoatView(boat: boat, tone: Tone.muted, state: l.boatInMaintenance, rank: 5),
        'غير نشط' => _BoatView(boat: boat, tone: Tone.muted, state: l.boatInactive, rank: 5),
        _ => _BoatView(boat: boat, tone: Tone.muted, state: l.boatInPort, verb: _Verb.newTrip, rank: 4),
      };
    }
    switch (trip.phase) {
      case TripPhase.scheduled:
        final at = trip.departureTime;
        if (at != null && now.difference(at) > _lateAfter) {
          return _BoatView(
            boat: boat,
            tone: Tone.danger,
            state: l.boatLate,
            detail: l.since(now.difference(at)),
            verb: _Verb.start,
            rank: 0,
          );
        }
        return _BoatView(
          boat: boat,
          tone: Tone.primary,
          state: l.phaseScheduled,
          detail: at == null ? trip.captain?.name : l.boatDeparts(l.when(at, now: now)),
          verb: _Verb.start,
          rank: 1,
        );
      case TripPhase.atSea:
        final started = trip.startedAt ?? trip.departureTime;
        final planned = trip.plannedDays;
        if (started != null && planned != null && planned > 0) {
          final out = now.difference(started);
          final day = out.inDays + 1;
          final overdue = day > planned;
          return _BoatView(
            boat: boat,
            tone: overdue ? Tone.danger : Tone.info,
            state: overdue ? l.boatOverdue : l.phaseAtSea,
            detail: l.boatAtSeaDay(day, planned),
            progress: (out.inMinutes / (planned * Duration.minutesPerDay)).clamp(0.0, 1.0),
            verb: _Verb.logCatch,
            rank: overdue ? 0 : 2,
          );
        }
        return _BoatView(
          boat: boat,
          tone: Tone.info,
          state: l.phaseAtSea,
          detail: started == null ? null : l.since(now.difference(started)),
          verb: _Verb.logCatch,
          rank: 2,
        );
      case TripPhase.awaitingCounter || TripPhase.counting:
        final counting = trip.phase == TripPhase.counting;
        final since = counting ? trip.receivedAt : (trip.catchSubmittedAt ?? trip.returnTime);
        // Back in port with its catch at the counter: free for its next trip.
        return _BoatView(
          boat: boat,
          tone: Tone.muted,
          state: counting ? l.boatCounting : l.boatAtCounter,
          detail: since == null ? trip.countingPort : l.since(now.difference(since)),
          verb: _Verb.newTrip,
          rank: 3,
        );
      case TripPhase.forSale || TripPhase.sold || TripPhase.counted || TripPhase.cancelled:
        return _BoatView(boat: boat, tone: Tone.muted, state: l.boatInPort, verb: _Verb.newTrip, rank: 4);
    }
  }
}

class _BoatCard extends ConsumerWidget {
  const _BoatCard({required this.view});

  final _BoatView view;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final trip = view.boat.trip;
    final urgent = view.tone == Tone.danger;
    final quiet = view.tone == Tone.muted;
    final buttonStyle = ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(0, 36)),
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
      textStyle: WidgetStatePropertyAll(text.labelMedium?.copyWith(fontWeight: FontWeight.w700)),
    );

    final Widget? button = switch (view.verb) {
      _Verb.start => FilledButton.icon(
        onPressed: () => startTripFlow(context, ref, trip!),
        style: buttonStyle.merge(
          urgent ? FilledButton.styleFrom(backgroundColor: c.danger, foregroundColor: Colors.white) : null,
        ),
        icon: const Icon(Icons.play_arrow_rounded, size: 18),
        label: Text(l.startShort),
      ),
      _Verb.logCatch => OutlinedButton(
        onPressed: () => context.push(Routes.submitCatch(trip!.id)),
        style: buttonStyle.merge(
          OutlinedButton.styleFrom(
            foregroundColor: c.toneText(urgent ? Tone.danger : Tone.primary),
            side: BorderSide(color: urgent ? c.danger : c.primary),
          ),
        ),
        child: _OneLine(l.logCatchShort),
      ),
      _Verb.newTrip => OutlinedButton(
        onPressed: () => context.push(Routes.newTripFor(view.boat.id)),
        style: buttonStyle.merge(
          OutlinedButton.styleFrom(
            foregroundColor: c.toneText(Tone.primary),
            side: BorderSide(color: c.primary),
          ),
        ),
        child: _OneLine(l.startNewTrip),
      ),
      null => null,
    };

    return Material(
      color: urgent ? c.washOf(Tone.danger) : c.panel,
      shape: Border(top: BorderSide(color: quiet ? c.border : c.tone(view.tone), width: 3)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push(trip != null ? Routes.trip(trip.id) : Routes.boat(view.boat.id)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                view.boat.name,
                style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                view.state,
                style: text.labelMedium?.copyWith(color: c.toneText(view.tone), fontWeight: FontWeight.w700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (view.detail != null)
                Text(view.detail!, style: text.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
              if (view.progress case final progress?) ...[
                const SizedBox(height: 8),
                Container(
                  height: 4,
                  color: c.mutedSurface,
                  alignment: AlignmentDirectional.centerStart,
                  child: FractionallySizedBox(
                    widthFactor: progress < .04 ? .04 : progress,
                    child: Container(color: c.tone(view.tone)),
                  ),
                ),
              ],
              if (button != null) ...[const Spacer(), const SizedBox(height: 10), button],
            ],
          ),
        ),
      ),
    );
  }
}

/// A button label that shrinks before it wraps, on a narrow card or large text.
class _OneLine extends StatelessWidget {
  const _OneLine(this.label);

  final String label;

  @override
  Widget build(BuildContext context) => FittedBox(fit: BoxFit.scaleDown, child: Text(label, maxLines: 1));
}

class _EmptyFleet extends StatelessWidget {
  const _EmptyFleet();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    return HudCard(
      brackets: false,
      padding: const EdgeInsetsDirectional.fromSTEB(14, 6, 6, 6),
      child: Row(
        children: [
          Icon(Icons.sailing_outlined, color: c.muted, size: 20),
          const SizedBox(width: 10),
          Expanded(child: Text(l.fleetEmpty, style: Theme.of(context).textTheme.bodyMedium)),
          TextButton(onPressed: () => context.push(Routes.newBoat), child: Text(l.newBoat)),
        ],
      ),
    );
  }
}

/// يحتاج إجراءك: catch to sell (the oldest count first) and money to collect
/// (the oldest invoice first), each with its button. The boats and their
/// trips live in the fleet above, so nothing here repeats them.
class _NeedsAction extends ConsumerWidget {
  const _NeedsAction({required this.dashboard, required this.now});

  final Dashboard dashboard;
  final DateTime now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final items = dashboard.actionItems;
    final toSell = dashboard.catchToSell.take(3).toList();
    final toCollect = dashboard.debts.take(3).toList();
    final sellCount = items.tripsToSell > toSell.length ? items.tripsToSell : toSell.length;
    final collectCount = items.unpaidSales > toCollect.length ? items.unpaidSales : toCollect.length;

    if (sellCount == 0 && collectCount == 0) {
      return HudCard(
        brackets: false,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Icon(Icons.task_alt, color: c.toneText(Tone.success), size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                l.nothingPending,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      );
    }

    return HudCard(
      brackets: false,
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(title: l.needsAction),
          if (sellCount > 0) ...[
            _GroupHead(
              title: l.toSellTitle,
              count: sellCount,
              onAll: sellCount > toSell.length ? () => openTrips(context, ref, TripStage.forSale) : null,
            ),
            for (final trip in toSell) _SellRow(trip: trip, now: now),
          ],
          if (collectCount > 0) ...[
            _GroupHead(
              title: l.toCollectTitle,
              count: collectCount,
              amount: l.sarWhole(items.unpaidTotal),
              onAll: () => openSales(context, ref, unpaidOnly: true),
            ),
            for (final sale in toCollect) _CollectRow(sale: sale, now: now),
          ],
        ],
      ),
    );
  }
}

/// A group's title and count; the total due in amber; "عرض الكل" when the
/// list holds more than the rows shown.
class _GroupHead extends StatelessWidget {
  const _GroupHead({required this.title, required this.count, this.amount, this.onAll});

  final String title;
  final int count;
  final String? amount;
  final VoidCallback? onAll;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return Container(
      constraints: const BoxConstraints(minHeight: 40),
      padding: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: c.hair)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: '  ${Fmt.ltr(Fmt.count(count))}'),
                ],
              ),
              style: text.labelLarge?.copyWith(color: c.muted),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (amount != null)
            Text(
              amount!,
              style: text.labelMedium?.copyWith(color: c.toneText(Tone.warning), fontWeight: FontWeight.w700),
            ),
          if (onAll != null)
            TextButton(
              onPressed: onAll,
              style: TextButton.styleFrom(
                minimumSize: const Size(48, 36),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                textStyle: text.labelMedium,
              ),
              child: Text(l.viewAll),
            ),
        ],
      ),
    );
  }
}

/// Counted catch on land: the boat, the kg left and how long since the count, and بيع.
class _SellRow extends StatelessWidget {
  const _SellRow({required this.trip, required this.now});

  final Trip trip;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final kg = trip.availableKg;
    final age = trip.countedAt == null ? null : now.difference(trip.countedAt!);
    final stale = age != null && age >= _staleCatch;

    return _TaskRow(
      onTap: () => context.push(Routes.trip(trip.id)),
      title: trip.boat?.name ?? Fmt.ltr(trip.tripNumber),
      detail: [
        if (kg > 0) TextSpan(text: l.leftKg(l.kg(kg))),
        if (age != null)
          TextSpan(
            text: l.since(age),
            style: stale ? TextStyle(color: c.toneText(Tone.warning), fontWeight: FontWeight.w700) : null,
          ),
      ],
      actions: [
        OutlinedButton(
          onPressed: () => context.push(Routes.newSale(trip.id)),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(0, 36),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            foregroundColor: c.toneText(Tone.primary),
            side: BorderSide(color: c.primary),
            textStyle: text.labelMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          child: Text(l.sellShort),
        ),
      ],
    );
  }
}

/// An unpaid invoice: the customer, what is left and how long ago it was
/// sold, a WhatsApp reminder when the customer has a phone, and حصّل.
class _CollectRow extends StatelessWidget {
  const _CollectRow({required this.sale, required this.now});

  final Sale sale;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final age = sale.soldAt == null ? null : now.difference(sale.soldAt!);
    final stale = age != null && age >= _staleInvoice;
    final reminder = _reminder(l);

    Future<void> remind() async {
      final ok = await launchUrl(reminder!, mode: LaunchMode.externalApplication);
      if (!ok && context.mounted) showSnack(context, l.errorUnknown, error: true);
    }

    return _TaskRow(
      onTap: () => context.push(Routes.sale(sale.id)),
      title: sale.customer?.name ?? l.cashCustomer,
      detail: [
        TextSpan(
          text: l.leftSar(l.sar(sale.remaining)),
          style: TextStyle(color: c.toneText(Tone.warning), fontWeight: FontWeight.w700),
        ),
        if (age != null)
          TextSpan(
            text: l.since(age),
            style: stale ? TextStyle(color: c.toneText(Tone.warning), fontWeight: FontWeight.w700) : null,
          ),
      ],
      actions: [
        if (reminder != null)
          IconButton(
            tooltip: l.remindWhatsapp,
            onPressed: remind,
            style: IconButton.styleFrom(foregroundColor: c.toneText(Tone.success)),
            icon: const Icon(Icons.chat_outlined, size: 20),
          ),
        OutlinedButton(
          onPressed: () => showCollectSheet(context, sale),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(0, 36),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            textStyle: text.labelMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          child: Text(l.collectShort),
        ),
      ],
    );
  }

  /// wa.me with the customer's number and a polite note of what is left.
  Uri? _reminder(AppLocalizations l) {
    final phone = Phone.normalize(sale.customer?.phone ?? '');
    if (!Phone.isValid(phone)) return null;
    final message = l.reminderMessage(sale.customer?.name ?? '', l.sar(sale.remaining), Fmt.ltr(sale.invoiceNumber));
    return Uri.https('wa.me', '/966${phone.substring(1)}', {'text': message});
  }
}

/// A task: what (bold) and its details on the start, its buttons on the end.
class _TaskRow extends StatelessWidget {
  const _TaskRow({required this.onTap, required this.title, required this.detail, required this.actions});

  final VoidCallback onTap;
  final String title;
  final List<TextSpan> detail;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final spans = <TextSpan>[
      for (final (i, span) in detail.indexed) ...[if (i > 0) const TextSpan(text: ' · '), span],
    ];
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (spans.isNotEmpty)
                    Text.rich(
                      TextSpan(children: spans),
                      style: text.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            ...actions,
          ],
        ),
      ),
    );
  }
}

/// The period's money: revenue in whole riyals, against the same span of the
/// period before, split into collected and still due; the catch, and six
/// months of revenue as a small bar trend. The period switch sits on the
/// label it changes.
class _Money extends StatelessWidget {
  const _Money({required this.dashboard, required this.period});

  final Dashboard dashboard;
  final DashboardPeriod period;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final kpis = dashboard.kpis;
    final rule = c.edgeOf(Tone.primary).withValues(alpha: .35);
    final (revenueLabel, catchLabel, versus) = switch (period) {
      DashboardPeriod.today => (l.statRevenueToday, l.statCatchToday, l.vsYesterday),
      DashboardPeriod.month => (l.statRevenueMonth, l.statCatchMonth, l.vsLastMonth),
      DashboardPeriod.year => (l.statRevenueYear, l.statCatchYear, l.vsLastYear),
    };

    return HudCard(
      color: c.washOf(Tone.primary),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  revenueLabel,
                  style: text.titleSmall?.copyWith(color: c.muted),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 10),
              _PeriodSwitch(period: period),
            ],
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                LtrText(Fmt.wholeMoney(kpis.revenue), style: text.displaySmall?.copyWith(fontSize: 30, height: 1.1)),
                const SizedBox(width: 8),
                Text(l.currencySar, style: text.titleSmall?.copyWith(color: c.muted)),
              ],
            ),
          ),
          if (kpis.previousRevenue case final before? when before > 0) ...[
            const SizedBox(height: 4),
            _Change(now: kpis.revenue, before: before, versus: versus),
          ],
          if ((kpis.collected, kpis.uncollected) case (final paid?, final due?) when kpis.revenue > 0) ...[
            const SizedBox(height: 12),
            _CollectedBar(collected: paid, uncollected: due),
          ],
          const SizedBox(height: 12),
          Divider(color: rule),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _MiniStat(
                    icon: Icons.set_meal_outlined,
                    label: catchLabel,
                    value: Fmt.kg(kpis.catchKg),
                    unit: l.unitKg,
                  ),
                ),
                VerticalDivider(width: 29, indent: 12, endIndent: 12, color: rule),
                Expanded(child: _Trend(points: dashboard.revenueByMonth)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// "▲ 12% عن الشهر الماضي": up in green, down in red, level in grey.
class _Change extends StatelessWidget {
  const _Change({required this.now, required this.before, required this.versus});

  final double now;
  final double before;
  final String versus;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final pct = ((now - before) / before * 100).round();
    final (icon, tone) = pct > 0
        ? (Icons.arrow_upward_rounded, Tone.success)
        : pct < 0
        ? (Icons.arrow_downward_rounded, Tone.danger)
        : (Icons.remove_rounded, Tone.muted);
    final color = c.toneText(tone);
    return Row(
      children: [
        Icon(icon, size: 15, color: color),
        const SizedBox(width: 3),
        Text(
          Fmt.pct(pct.abs()),
          style: text.labelMedium?.copyWith(color: color, fontWeight: FontWeight.w700),
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            versus,
            style: text.labelMedium?.copyWith(color: c.muted),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// The period's revenue in two parts: collected (green) and still due (amber).
class _CollectedBar extends StatelessWidget {
  const _CollectedBar({required this.collected, required this.uncollected});

  final double collected;
  final double uncollected;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final total = collected + uncollected;
    int part(double value) => value <= 0 ? 0 : ((value / total) * 1000).round().clamp(1, 1000);
    final paid = part(collected);
    final due = part(uncollected);

    Widget legend(String label, double amount, Tone tone) => Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '$label '),
          TextSpan(
            text: l.sarWhole(amount),
            style: TextStyle(color: c.toneText(tone), fontWeight: FontWeight.w700),
          ),
        ],
      ),
      style: text.labelMedium?.copyWith(color: c.muted),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (paid > 0)
                Expanded(
                  flex: paid,
                  child: ColoredBox(color: c.success),
                ),
              if (paid > 0 && due > 0) const SizedBox(width: 2),
              if (due > 0)
                Expanded(
                  flex: due,
                  child: ColoredBox(color: c.warning),
                ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: legend(l.collectedLabel, collected, Tone.success)),
            if (uncollected > 0) ...[
              const SizedBox(width: 12),
              Flexible(child: legend(l.uncollectedLabel, uncollected, Tone.warning)),
            ],
          ],
        ),
      ],
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.icon, required this.label, required this.value, this.unit});

  final IconData icon;
  final String label;
  final String value;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StatLabel(icon: icon, label: label),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                LtrText(value, style: text.titleLarge?.copyWith(fontSize: 18, height: 1.15)),
                if (unit != null) ...[
                  const SizedBox(width: 5),
                  Text(unit!, style: text.labelMedium?.copyWith(color: c.muted)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatLabel extends StatelessWidget {
  const _StatLabel({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    return Row(
      children: [
        Icon(icon, size: 15, color: c.muted),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(color: c.muted),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// Six months of revenue as small bars, oldest on the left as on any time
/// axis, the current month solid.
class _Trend extends StatelessWidget {
  const _Trend({required this.points});

  final List<RevenuePoint> points;

  static const _height = 30.0;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final top = points.fold<double>(0, (m, p) => p.total > m ? p.total : m);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _StatLabel(icon: Icons.bar_chart, label: l.lastSixMonths),
          const SizedBox(height: 8),
          Semantics(
            label: [for (final p in points) '${Fmt.monthName(p.month)} ${l.sarWhole(p.total)}'].join('، '),
            child: ExcludeSemantics(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: SizedBox(
                  height: _height,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (final (i, p) in points.indexed) ...[
                        if (i > 0) const SizedBox(width: 4),
                        Expanded(
                          child: Container(
                            height: top <= 0 ? 2 : (p.total / top * _height).clamp(2.0, _height),
                            color: i == points.length - 1 ? c.primary : c.primary.withValues(alpha: .35),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PeriodSwitch extends ConsumerWidget {
  const _PeriodSwitch({required this.period});

  final DashboardPeriod period;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final labels = {
      DashboardPeriod.today: l.periodToday,
      DashboardPeriod.month: l.periodMonth,
      DashboardPeriod.year: l.periodYear,
    };

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: c.panel,
        border: Border.all(color: c.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final entry in labels.entries)
            Semantics(
              selected: entry.key == period,
              button: true,
              child: InkWell(
                onTap: () => ref.read(homePeriodProvider.notifier).select(entry.key),
                child: AnimatedContainer(
                  duration: Hud.fast,
                  constraints: const BoxConstraints(minHeight: 30, minWidth: 44),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  color: entry.key == period ? c.primary : Colors.transparent,
                  child: Text(
                    entry.value,
                    style: text.labelMedium?.copyWith(
                      color: entry.key == period ? c.onPrimary : c.muted,
                      fontWeight: entry.key == period ? FontWeight.w700 : FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// الأسماك المتوفرة: one line per species, its kg on a bar against the
/// largest, and بيع when a trip waiting to be sold carries it.
class _Stock extends StatelessWidget {
  const _Stock({required this.lines, required this.tripsToSell});

  final List<StockLine> lines;
  final List<Trip> tripsToSell;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final shown = [...lines]..sort((a, b) => b.weightKg.compareTo(a.weightKg));
    final top = shown.take(5).toList();
    final max = top.isEmpty ? 1.0 : top.first.weightKg;

    List<Trip> carrying(int speciesId) => [
      for (final trip in tripsToSell)
        if (trip.availableLines.any((line) => line.speciesId == speciesId && line.availableKg > 0)) trip,
    ];

    return HudCard(
      brackets: false,
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHead(
            title: l.stockTitle,
            action: top.isEmpty ? null : l.viewAll,
            onAction: () => context.push(Routes.stock),
          ),
          if (top.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(l.noStock, style: text.bodyMedium?.copyWith(color: c.muted)),
            ),
          for (final line in top)
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      line.species ?? '—',
                      style: text.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 6,
                      color: c.mutedSurface,
                      alignment: AlignmentDirectional.centerStart,
                      child: FractionallySizedBox(
                        widthFactor: max <= 0 ? 0 : (line.weightKg / max).clamp(.02, 1),
                        child: Container(color: c.primary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 84,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(l.kg(line.weightKg), style: text.labelMedium?.copyWith(fontWeight: FontWeight.w700)),
                    ),
                  ),
                  SizedBox(
                    width: 52,
                    child: switch (carrying(line.speciesId)) {
                      final trips when trips.isNotEmpty => TextButton(
                        onPressed: () => _sell(context, line, trips),
                        style: TextButton.styleFrom(
                          minimumSize: const Size(44, 36),
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          textStyle: text.labelMedium?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        child: Text(l.sellShort),
                      ),
                      _ => null,
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  /// The sale wizard on the one trip that carries the species, or on the one picked.
  Future<void> _sell(BuildContext context, StockLine line, List<Trip> trips) async {
    final trip = trips.length == 1 ? trips.single : await _pickTrip(context, line, trips);
    if (trip == null || !context.mounted) return;
    await context.push(Routes.newSale(trip.id, speciesId: line.speciesId));
  }

  Future<Trip?> _pickTrip(BuildContext context, StockLine line, List<Trip> trips) => showModalBottomSheet<Trip>(
    context: context,
    builder: (context) {
      final l = context.l10n;
      final c = HawatColors.of(context);
      final text = Theme.of(context).textTheme;
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, 8),
              child: Text(l.pickTripTitle, style: text.titleMedium),
            ),
            for (final trip in trips)
              InkWell(
                onTap: () => Navigator.of(context).pop(trip),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: Hud.gutter, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: c.hair)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              trip.boat?.name ?? Fmt.ltr(trip.tripNumber),
                              style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            LtrText(trip.tripNumber, style: text.bodySmall),
                          ],
                        ),
                      ),
                      Text(
                        l.kg(trip.availableLines.firstWhere((a) => a.speciesId == line.speciesId).availableKg),
                        style: text.labelMedium?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
    },
  );
}

class _HomeSkeleton extends StatelessWidget {
  const _HomeSkeleton();

  @override
  Widget build(BuildContext context) => const Skeleton(
    child: Padding(
      padding: EdgeInsets.fromLTRB(Hud.gutter, 12, Hud.gutter, Hud.gutter),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: SkeletonBox(height: 130)),
              SizedBox(width: 10),
              Expanded(child: SkeletonBox(height: 130)),
            ],
          ),
          SizedBox(height: Hud.gap),
          SkeletonBox(height: 220),
          SizedBox(height: Hud.gap),
          SkeletonBox(height: 230),
          SizedBox(height: Hud.gap),
          SkeletonBox(height: 170),
        ],
      ),
    ),
  );
}
