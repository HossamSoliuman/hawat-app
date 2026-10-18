import 'package:flutter/material.dart';

import '../theme/tokens.dart';

/// The HUD surface: a soft solid panel, a 1px hairline and four corner
/// brackets. Sharp corners, no shadow. Nested cards pass `brackets: false`.
class HudCard extends StatelessWidget {
  const HudCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
    this.onTap,
    this.brackets = true,
    this.color,
    this.borderColor,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final bool brackets;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    Widget content = Padding(padding: padding, child: child);
    if (onTap != null) {
      content = InkWell(onTap: onTap, child: content);
    }
    return CustomPaint(
      foregroundPainter: brackets ? BracketPainter(c.bracket) : null,
      child: Material(
        color: color ?? c.panel,
        shape: Border.all(color: borderColor ?? c.hair),
        clipBehavior: Clip.antiAlias,
        child: content,
      ),
    );
  }
}

/// Eight short bars, two at each corner, drawn over the hairline.
class BracketPainter extends CustomPainter {
  const BracketPainter(this.color, {this.length = Hud.bracketLength, this.thickness = Hud.bracketThickness});

  final Color color;
  final double length;
  final double thickness;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final w = size.width;
    final h = size.height;
    final l = length.clamp(0, w / 2).toDouble();
    final t = thickness;
    for (final rect in [
      Rect.fromLTWH(0, 0, l, t),
      Rect.fromLTWH(0, 0, t, l),
      Rect.fromLTWH(w - l, 0, l, t),
      Rect.fromLTWH(w - t, 0, t, l),
      Rect.fromLTWH(0, h - t, l, t),
      Rect.fromLTWH(0, h - l, t, l),
      Rect.fromLTWH(w - l, h - t, l, t),
      Rect.fromLTWH(w - t, h - l, t, l),
    ]) {
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(BracketPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.length != length || oldDelegate.thickness != thickness;
}
