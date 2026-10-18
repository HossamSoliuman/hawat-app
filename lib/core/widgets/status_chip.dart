import 'package:flutter/material.dart';

import '../theme/tokens.dart';

/// A status badge: tone border, a light tone fill and a small square dot.
class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.label, this.tone = Tone.muted, this.dense = false});

  final String label;
  final Tone tone;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final color = c.toneText(tone);
    final base = c.tone(tone);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dense ? 6 : 8, vertical: dense ? 2 : 3),
      decoration: BoxDecoration(
        color: base.withValues(alpha: tone == Tone.muted ? .10 : .09),
        border: Border.all(color: base.withValues(alpha: .38)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 5, height: 5, color: color),
          const SizedBox(width: 5),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

/// A small count next to a title (pending rows, tab badges).
class CountBadge extends StatelessWidget {
  const CountBadge({super.key, required this.count, this.tone = Tone.primary});

  final int count;
  final Tone tone;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    return Container(
      constraints: const BoxConstraints(minWidth: 22),
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      color: c.tone(tone),
      child: Text(
        '$count',
        style: Theme.of(context).textTheme.labelSmall
            ?.copyWith(color: c.isDark ? c.background : Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}
