import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/media/avatar_picker.dart';
import '../../../core/theme/tokens.dart';
import '../../../core/widgets/action_sheet.dart';
import '../../../core/widgets/actions.dart';
import '../../../core/widgets/avatar.dart';
import '../../../core/widgets/form_fields.dart';
import '../../../core/widgets/hud_card.dart';
import '../../../core/widgets/ltr_text.dart';
import '../../../core/widgets/section_head.dart';
import '../../../core/widgets/states.dart';
import '../../../core/widgets/status_chip.dart';
import '../data/fleet.dart';
import '../data/fleet_providers.dart';
import 'fleet_ui.dart';

/// A captain or crew member: the photo (tap to change), identity, the iqama
/// and licence with how close they are to ending, and the boat.
class FisherScreen extends ConsumerStatefulWidget {
  const FisherScreen({super.key, required this.kind, required this.id});

  final FisherKind kind;
  final int id;

  @override
  ConsumerState<FisherScreen> createState() => _FisherScreenState();
}

class _FisherScreenState extends ConsumerState<FisherScreen> {
  bool _uploading = false;

  Future<void> _changePhoto(Fisher fisher) async {
    final l = context.l10n;
    final choice = await showPhotoChoices(context, hasPhoto: fisher.avatarUrl != null);
    if (choice == null || !mounted) return;
    final actions = ref.read(fleetActionsProvider);
    setState(() => _uploading = true);
    try {
      if (choice == PhotoChoice.remove) {
        await actions.removeAvatar(widget.kind, fisher.id);
        if (mounted) showSnack(context, l.photoRemoved);
        return;
      }
      final bytes = await pickAvatar(choice);
      if (bytes == null) return;
      await actions.uploadAvatar(widget.kind, fisher.id, bytes);
      if (mounted) showSnack(context, l.photoUpdated);
    } on ValidationException catch (e) {
      if (mounted) showSnack(context, e.fieldError('avatar') ?? e.userMessage(l), error: true);
    } on ApiException catch (e) {
      if (mounted) showSnack(context, e.userMessage(l), error: true);
    } finally {
      if (mounted) setState(() => _uploading = false);
    }
  }

  Future<void> _delete(Fisher fisher) async {
    final l = context.l10n;
    final done = await showActionSheet(
      context,
      title: l.deleteTitle(fisher.name),
      body: widget.kind == FisherKind.captain ? l.deleteCaptainBody : l.deleteBody,
      confirm: l.deleteAction,
      danger: true,
      run: (_) => ref.read(fleetActionsProvider).deleteFisher(widget.kind, fisher.id),
    );
    if (!done || !mounted) return;
    showSnack(context, l.deletedDone);
    popOr(context, Routes.fishers(widget.kind));
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final provider = fisherDetailProvider(widget.kind, widget.id);
    final state = ref.watch(provider);
    final fisher = state.value;
    final crew = widget.kind == FisherKind.crew;

    return Scaffold(
      appBar: AppBar(
        title: Text(crew ? l.crewMemberTitle : l.captainTitle),
        actions: [
          if (fisher != null)
            PopupMenuButton<String>(
              tooltip: l.moreActions,
              icon: const Icon(Icons.more_vert),
              onSelected: (action) =>
                  action == 'edit' ? context.push(Routes.editFisher(widget.kind, widget.id)) : _delete(fisher),
              itemBuilder: (_) => [
                PopupMenuItem(value: 'edit', child: Text(l.editAction)),
                PopupMenuItem(value: 'delete', child: Text(l.deleteAction)),
              ],
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(provider.future),
        child: state.when(
          skipLoadingOnReload: true,
          loading: () => const Skeleton(
            child: Padding(padding: EdgeInsets.all(Hud.gutter), child: SkeletonBox(height: 420)),
          ),
          error: (e, _) => ListView(
            children: [ErrorState(error: e, onRetry: () => ref.invalidate(provider))],
          ),
          data: (fisher) {
            final text = Theme.of(context).textTheme;
            final c = HawatColors.of(context);
            return ListView(
              padding: const EdgeInsets.all(Hud.gutter),
              children: [
                HudCard(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: _uploading ? null : () => _changePhoto(fisher),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            HudAvatar(name: fisher.name, url: fisher.avatarUrl, size: 72),
                            if (_uploading)
                              const SizedBox.square(dimension: 26, child: CircularProgressIndicator(strokeWidth: 2.4)),
                            PositionedDirectional(
                              end: 0,
                              bottom: 0,
                              child: Container(
                                color: c.panel,
                                padding: const EdgeInsets.all(3),
                                child: Icon(Icons.photo_camera_outlined, size: 16, color: c.primary),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(fisher.name, style: text.titleLarge),
                            const SizedBox(height: 4),
                            Text(
                              fisher.isCaptain ? l.captainTitle : (fisher.role?.name ?? l.crewMemberTitle),
                              style: text.bodyMedium,
                            ),
                            const SizedBox(height: 6),
                            StatusChip(
                              label: fisher.status ?? '—',
                              tone: fisher.isActive ? Tone.success : Tone.muted,
                              dense: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Hud.gap),
                _Card(
                  title: l.sectionIdentity,
                  icon: Icons.badge_outlined,
                  rows: [
                    InfoRow(label: l.nationalIdLabel, child: LtrText(fisher.nationalId ?? '—')),
                    InfoRow(label: l.idTypeLabel, value: fisher.idType?.name),
                    InfoRow(label: l.nationalityLabel, value: fisher.nationality),
                    InfoRow(label: l.phoneLabel, child: fisher.phone == null ? null : LtrText(fisher.phone!)),
                    InfoRow(label: l.emailLabel, value: fisher.email),
                    InfoRow(label: l.experienceLabel, value: l.yearsCount(fisher.experienceYears), last: true),
                  ],
                ),
                const SizedBox(height: Hud.gap),
                _Card(
                  title: l.sectionDocuments,
                  icon: Icons.event_note_outlined,
                  rows: [
                    InfoRow(
                      label: l.iqamaIssueLabel,
                      value: fisher.iqamaIssueDate == null ? null : Fmt.date(fisher.iqamaIssueDate!),
                    ),
                    InfoRow(
                      label: l.iqamaExpiryLabel,
                      child: ExpiryValue(date: fisher.iqamaExpiryDate),
                    ),
                    InfoRow(label: l.fishingLicenseLabel, child: LtrText(fisher.licenseNumber ?? '—')),
                    InfoRow(
                      label: l.fieldLicenseDate,
                      value: fisher.licenseDate == null ? null : Fmt.date(fisher.licenseDate!),
                    ),
                    InfoRow(
                      label: l.fieldLicenseExpiry,
                      last: true,
                      child: ExpiryValue(date: fisher.licenseExpiry),
                    ),
                  ],
                ),
                const SizedBox(height: Hud.gap),
                _Card(
                  title: l.sectionAssignment,
                  icon: Icons.directions_boat_outlined,
                  rows: [
                    InfoRow(
                      label: l.fieldBoat,
                      value: l.noBoat,
                      child: fisher.boat?.id == null
                          ? null
                          : InkWell(
                              onTap: () => context.push(Routes.boat(fisher.boat!.id!)),
                              child: Text(
                                fisher.boat!.name ?? '—',
                                style: text.bodyMedium?.copyWith(color: c.primary, fontWeight: FontWeight.w700),
                              ),
                            ),
                    ),
                    InfoRow(label: l.portLabel, value: fisher.port?.name),
                    InfoRow(label: l.tripsLabel, value: Fmt.count(fisher.tripsCount), last: true),
                  ],
                ),
                const SizedBox(height: Hud.gutter),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.title, required this.icon, required this.rows});

  final String title;
  final IconData icon;
  final List<Widget> rows;

  @override
  Widget build(BuildContext context) => HudCard(
    padding: const EdgeInsets.fromLTRB(14, 8, 14, 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHead(title: title, icon: icon),
        ...rows,
      ],
    ),
  );
}
