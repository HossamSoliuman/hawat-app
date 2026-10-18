import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import 'ltr_text.dart';

/// A stat card, the only rounded element: a light tone wash, a tone border
/// and a 3px bar on the start edge. Label and icon on top, the value below.
class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.unit,
    this.tone = Tone.primary,
    this.onTap,
  });

  final String label;
  final String value;
  final String? unit;
  final IconData icon;
  final Tone tone;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final radius = BorderRadius.circular(Hud.statRadius);

    return Material(
      color: c.washOf(tone),
      shape: RoundedRectangleBorder(borderRadius: radius, side: BorderSide(color: c.edgeOf(tone))),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            PositionedDirectional(
              start: 0,
              top: 14,
              bottom: 14,
              child: Container(width: 3, color: c.tone(tone)),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          label,
                          style: text.labelMedium?.copyWith(fontSize: 13.5, fontWeight: FontWeight.w700),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ToneIcon(icon: icon, tone: tone),
                    ],
                  ),
                  const SizedBox(height: 12),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        LtrText(value, style: text.headlineSmall?.copyWith(fontSize: 23, height: 1.1)),
                        if (unit != null) ...[
                          const SizedBox(width: 5),
                          Text(unit!, style: text.labelMedium?.copyWith(color: c.muted)),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The small square icon box of a stat card or a section head.
class ToneIcon extends StatelessWidget {
  const ToneIcon({super.key, required this.icon, this.tone = Tone.primary, this.size = 24, this.iconSize = 14});

  final IconData icon;
  final Tone tone;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final color = c.tone(tone);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        border: Border.all(color: color.withValues(alpha: .4)),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: iconSize, color: c.toneText(tone)),
    );
  }
}
