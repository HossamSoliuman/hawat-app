import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/action_sheet.dart';
import '../../../core/widgets/actions.dart';
import '../data/trip.dart';
import '../data/trips_providers.dart';

/// "بدء الرحلة الآن؟" → في البحر. From the home row, the + sheet or the trip screen.
Future<bool> startTripFlow(BuildContext context, WidgetRef ref, Trip trip) async {
  final l = context.l10n;
  final started = await showActionSheet(
    context,
    title: l.startConfirmTitle,
    body: l.startConfirmBody(trip.boat?.name ?? ''),
    confirm: l.actionStartTrip,
    run: (key) => ref.read(tripActionsProvider).start(trip.id, idempotencyKey: key),
  );
  if (started && context.mounted) showSnack(context, l.tripStarted);
  return started;
}

/// Cancel with a required reason (a few common ones are one tap away).
Future<bool> cancelTripFlow(BuildContext context, WidgetRef ref, Trip trip) async {
  final cancelled = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    builder: (_) => _CancelSheet(trip: trip),
  );
  if ((cancelled ?? false) && context.mounted) showSnack(context, context.l10n.tripCancelled);
  return cancelled ?? false;
}

class _CancelSheet extends ConsumerStatefulWidget {
  const _CancelSheet({required this.trip});

  final Trip trip;

  @override
  ConsumerState<_CancelSheet> createState() => _CancelSheetState();
}

class _CancelSheetState extends ConsumerState<_CancelSheet> {
  final _reason = TextEditingController();
  final _key = ApiClient.newIdempotencyKey();
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _reason.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l = context.l10n;
    final reason = _reason.text.trim();
    if (reason.isEmpty) {
      setState(() => _error = l.cancelReasonRequired);
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await ref.read(tripActionsProvider).cancel(widget.trip.id, reason, idempotencyKey: _key);
      unawaited(HapticFeedback.lightImpact());
      if (mounted) Navigator.of(context).pop(true);
    } on ValidationException catch (e) {
      setState(() => _error = e.fieldError('reason') ?? e.userMessage(l));
    } on ApiException catch (e) {
      setState(() => _error = e.userMessage(l));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final text = Theme.of(context).textTheme;
    final reasons = [l.reasonWeather, l.reasonBreakdown, l.reasonCrew];

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, Hud.gutter + MediaQuery.viewInsetsOf(context).bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l.cancelTripTitle, style: text.titleMedium),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final r in reasons)
                  ChoiceChip(
                    label: Text(r),
                    selected: _reason.text == r,
                    onSelected: (_) => setState(() {
                      _reason.text = r;
                      _error = null;
                    }),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _reason,
              minLines: 2,
              maxLines: 4,
              maxLength: 500,
              textInputAction: TextInputAction.done,
              onChanged: (_) => setState(() => _error = null),
              decoration: InputDecoration(hintText: l.cancelReasonHint, errorText: _error, counterText: ''),
            ),
            const SizedBox(height: 14),
            PrimaryButton(label: l.cancelTripConfirm, danger: true, busy: _busy, onPressed: _submit),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: _busy ? null : () => Navigator.of(context).pop(false),
              style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(Hud.minTouch)),
              child: Text(l.keepTrip),
            ),
          ],
        ),
      ),
    );
  }
}
