import 'package:flutter/material.dart';

import '../theme/tokens.dart';

/// The trip's five steps: مجدولة → في البحر → بانتظار العداد → جارية العد → جاهزة للبيع.
/// Steps before [current] are done, [current] is ringed, the rest wait.
class StepProgress extends StatelessWidget {
  const StepProgress({
    super.key,
    required this.labels,
    required this.current,
    this.allDone = false,
    this.dimmed = false,
  });

  final List<String> labels;
  final int current;

  /// The last step is reached and finished too (sold, counted).
  final bool allDone;

  /// A cancelled trip keeps its bar, faded.
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final text = Theme.of(context).textTheme;
    final n = labels.length;

    final bar = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < n; i++)
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 28,
                  child: Row(
                    children: [
                      Expanded(
                        child: _line(c, visible: i > 0, done: i <= current),
                      ),
                      _dot(c, text, i),
                      Expanded(
                        child: _line(c, visible: i < n - 1, done: i < current || (allDone && i < n - 1)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    labels[i],
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: text.labelSmall?.copyWith(
                      fontSize: 11,
                      color: i <= current ? c.foreground : c.muted,
                      fontWeight: i == current ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );

    return Opacity(opacity: dimmed ? .45 : 1, child: bar);
  }

  Widget _line(HawatColors c, {required bool visible, required bool done}) =>
      Container(height: 2, color: !visible ? Colors.transparent : (done ? c.primary : c.hair));

  Widget _dot(HawatColors c, TextTheme text, int i) {
    final done = i < current || (allDone && i == current);
    final isCurrent = i == current && !allDone;
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: done ? c.primary : c.panel,
        border: Border.all(color: done || isCurrent ? c.primary : c.border, width: isCurrent ? 2 : 1),
        boxShadow: isCurrent ? [BoxShadow(color: c.primary.withValues(alpha: .18), spreadRadius: 3)] : null,
      ),
      alignment: Alignment.center,
      child: done
          ? Icon(Icons.check, size: 15, color: c.onPrimary)
          : Text(
              '${i + 1}',
              style: text.labelSmall?.copyWith(
                color: isCurrent ? c.primary : c.muted,
                fontWeight: FontWeight.w700,
                fontFamily: 'ChakraPetch',
              ),
            ),
    );
  }
}

/// A compact five-segment bar for cards.
class SegmentProgress extends StatelessWidget {
  const SegmentProgress({super.key, required this.current, this.segments = 5, this.allDone = false, this.tone});

  final int current;
  final int segments;
  final bool allDone;
  final Color? tone;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final color = tone ?? c.primary;
    return Row(
      children: [
        for (var i = 0; i < segments; i++) ...[
          if (i > 0) const SizedBox(width: 3),
          Expanded(
            child: Container(
              height: 4,
              color: (allDone ? i <= current : i < current)
                  ? color
                  : (i == current ? color.withValues(alpha: .5) : c.mutedSurface),
            ),
          ),
        ],
      ],
    );
  }
}
