import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/format/format.dart';
import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';
import '../data/dashboard.dart';

/// Six months of revenue as bars: one series in the primary hue, so no legend
/// (the section title names it), the current month solid and the rest faded;
/// recessive grid; a tap shows the month's amount.
class RevenueChart extends StatelessWidget {
  const RevenueChart({super.key, required this.points});

  final List<RevenuePoint> points;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final l = context.l10n;
    final text = Theme.of(context).textTheme;
    final maxValue = points.fold<double>(0, (m, p) => p.total > m ? p.total : m);
    final top = maxValue <= 0 ? 1000.0 : _niceCeiling(maxValue);
    final axis = text.labelSmall?.copyWith(color: c.muted, fontWeight: FontWeight.w500, fontSize: 10.5);

    return SizedBox(
      height: 190,
      child: Directionality(
        // Time runs left to right on a chart, in Arabic too.
        textDirection: TextDirection.ltr,
        child: BarChart(
          BarChartData(
            maxY: top,
            minY: 0,
            alignment: BarChartAlignment.spaceAround,
            borderData: FlBorderData(
              show: true,
              border: Border(bottom: BorderSide(color: c.border)),
            ),
            gridData: FlGridData(
              drawVerticalLine: false,
              horizontalInterval: top / 4,
              getDrawingHorizontalLine: (_) => FlLine(color: c.hair, strokeWidth: 1, dashArray: [3, 4]),
            ),
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(),
              rightTitles: const AxisTitles(),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 38,
                  interval: top / 4,
                  getTitlesWidget: (value, meta) => value == 0 || value > top
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Text(_compact(value), style: axis, textAlign: TextAlign.right),
                        ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 26,
                  getTitlesWidget: (value, meta) {
                    final i = value.toInt();
                    if (i < 0 || i >= points.length) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(Fmt.monthName(points[i].month), style: axis),
                    );
                  },
                ),
              ),
            ),
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                getTooltipColor: (_) => c.foreground,
                tooltipBorderRadius: BorderRadius.zero,
                tooltipPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                getTooltipItem: (group, _, rod, _) => BarTooltipItem(
                  '${Fmt.monthName(points[group.x].month)}\n',
                  text.labelSmall!.copyWith(color: c.background.withValues(alpha: .75)),
                  children: [
                    TextSpan(
                      text: l.sar(rod.toY),
                      style: text.labelMedium!.copyWith(color: c.background),
                    ),
                  ],
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            barGroups: [
              for (var i = 0; i < points.length; i++)
                BarChartGroupData(
                  x: i,
                  barRods: [
                    BarChartRodData(
                      toY: points[i].total,
                      width: 20,
                      color: i == points.length - 1 ? c.primary : c.primary.withValues(alpha: .4),
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// A round top split into four round steps: 4,500 → 6,000 (1.5K a line).
  static double _niceCeiling(double value) {
    final rawStep = value / 4;
    var magnitude = 1.0;
    while (magnitude * 10 <= rawStep) {
      magnitude *= 10;
    }
    const multiples = [1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0, 8.0, 10.0];
    final step = multiples.map((m) => m * magnitude).firstWhere((s) => s >= rawStep, orElse: () => magnitude * 10);
    return step * 4;
  }

  static String _compact(double value) {
    if (value >= 1000000) return '${Fmt.kg(value / 1000000)}M';
    if (value >= 1000) return '${Fmt.kg(value / 1000)}K';
    return Fmt.count(value);
  }
}
