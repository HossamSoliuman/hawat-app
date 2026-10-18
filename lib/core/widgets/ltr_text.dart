import 'package:flutter/material.dart';

import '../format/format.dart';

/// A left-to-right value (trip number `TR-2026-0007`, invoice `26-09-000001`,
/// phone, a negative number) isolated so it never reverses inside Arabic text.
class LtrText extends StatelessWidget {
  const LtrText(this.value, {super.key, this.style, this.textAlign, this.maxLines, this.overflow});

  final String value;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) => Text(
    Fmt.ltr(value),
    style: (style ?? DefaultTextStyle.of(context).style).copyWith(
      fontFeatures: const [FontFeature.tabularFigures()],
    ),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );
}
