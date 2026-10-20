import 'package:flutter/material.dart';

import '../../../core/l10n.dart';
import '../../../core/theme/tokens.dart';

/// The Hawat word mark, white in dark mode.
class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.height = 48});

  final double height;

  @override
  Widget build(BuildContext context) {
    final dark = HawatColors.of(context).isDark;
    return Image.asset(
      dark ? 'assets/images/logo-white.png' : 'assets/images/logo.png',
      height: height,
      semanticLabel: context.l10n.appName,
    );
  }
}
