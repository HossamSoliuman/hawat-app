import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tokens.dart';

/// The HUD look on touch: sharp corners, hairlines, flat solid surfaces, no shadows.
abstract final class HawatTheme {
  static const fontFamily = 'ChakraPetch';

  /// Chakra Petch has no Arabic glyphs, so Arabic falls through to Tajawal.
  static const fontFallback = ['Tajawal'];

  static ThemeData light() => _build(HawatColors.light, Brightness.light);

  static ThemeData dark() => _build(HawatColors.dark, Brightness.dark);

  static ThemeData _build(HawatColors c, Brightness brightness) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: c.primary,
      onPrimary: c.onPrimary,
      secondary: c.info,
      onSecondary: Colors.white,
      error: c.danger,
      onError: Colors.white,
      surface: c.panel,
      onSurface: c.foreground,
      onSurfaceVariant: c.muted,
      surfaceContainerHighest: c.mutedSurface,
      surfaceContainerHigh: c.mutedSurface,
      surfaceContainer: c.panel,
      surfaceContainerLow: c.panel,
      surfaceContainerLowest: c.panel,
      outline: c.border,
      outlineVariant: c.hair,
    );

    final text = _textTheme(c);
    const sharp = RoundedRectangleBorder();

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.background,
      canvasColor: c.background,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFallback,
      textTheme: text,
      extensions: [c],
      splashFactory: InkRipple.splashFactory,
      dividerTheme: DividerThemeData(color: c.hair, thickness: 1, space: 1),
      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        surfaceTintColor: Colors.transparent,
        foregroundColor: c.foreground,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleSpacing: Hud.gutter,
        titleTextStyle: text.titleLarge,
        systemOverlayStyle: brightness == Brightness.light
            ? SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent)
            : SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
        shape: Border(bottom: BorderSide(color: c.hair)),
      ),
      cardTheme: CardThemeData(
        color: c.panel,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(side: BorderSide(color: c.hair)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: c.primary,
          foregroundColor: c.onPrimary,
          disabledBackgroundColor: c.mutedSurface,
          disabledForegroundColor: c.muted,
          minimumSize: const Size(64, Hud.minTouch),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          shape: sharp,
          textStyle: text.labelLarge,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: c.foreground,
          minimumSize: const Size(64, Hud.minTouch),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          side: BorderSide(color: c.border),
          shape: sharp,
          textStyle: text.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: c.primary,
          minimumSize: const Size(48, Hud.minTouch),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: sharp,
          textStyle: text.labelLarge,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: c.foreground,
          minimumSize: const Size(Hud.minTouch, Hud.minTouch),
          shape: sharp,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.panel,
        isDense: false,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        hintStyle: text.bodyMedium?.copyWith(color: c.muted.withValues(alpha: .8)),
        labelStyle: text.bodyMedium?.copyWith(color: c.muted),
        floatingLabelStyle: text.bodyMedium?.copyWith(color: c.primary, fontWeight: FontWeight.w600),
        errorStyle: text.bodySmall?.copyWith(color: c.danger, height: 1.35),
        errorMaxLines: 3,
        border: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: c.border)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: c.border)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: c.primary, width: 1.5)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: c.danger)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: c.danger, width: 1.5)),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: c.hair)),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.panel,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: c.panel,
        elevation: 0,
        modalElevation: 0,
        shape: Border(top: BorderSide(color: c.hair)),
        showDragHandle: true,
        dragHandleColor: c.border,
        dragHandleSize: const Size(36, 3),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: c.panel,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(side: BorderSide(color: c.hair)),
        titleTextStyle: text.titleMedium,
        contentTextStyle: text.bodyMedium,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: c.foreground,
        contentTextStyle: text.bodyMedium?.copyWith(color: c.background, fontWeight: FontWeight.w600),
        actionTextColor: brightness == Brightness.light ? const Color(0xFF8CC3EF) : c.primary.withValues(alpha: 1),
        shape: const RoundedRectangleBorder(),
        elevation: 0,
        insetPadding: const EdgeInsets.fromLTRB(Hud.gutter, 0, Hud.gutter, 12),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: c.foreground,
        unselectedLabelColor: c.muted,
        labelStyle: text.labelLarge,
        unselectedLabelStyle: text.labelLarge?.copyWith(fontWeight: FontWeight.w500),
        indicatorColor: c.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: UnderlineTabIndicator(borderSide: BorderSide(color: c.primary, width: 2.5)),
        dividerColor: c.hair,
        overlayColor: WidgetStatePropertyAll(c.primary.withValues(alpha: .06)),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: c.panel,
        selectedColor: c.primary.withValues(alpha: .12),
        side: BorderSide(color: c.border),
        shape: const RoundedRectangleBorder(),
        labelStyle: text.labelMedium,
        showCheckmark: false,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: c.muted,
        textColor: c.foreground,
        titleTextStyle: text.bodyLarge,
        minVerticalPadding: 12,
        contentPadding: const EdgeInsets.symmetric(horizontal: Hud.gutter),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: c.primary, linearTrackColor: c.mutedSurface),
      popupMenuTheme: PopupMenuThemeData(
        color: c.panel,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(side: BorderSide(color: c.border)),
        textStyle: text.bodyLarge,
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: c.panel,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(side: BorderSide(color: c.hair)),
        headerBackgroundColor: c.primary,
        headerForegroundColor: c.onPrimary,
        dayShape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: c.panel,
        shape: RoundedRectangleBorder(side: BorderSide(color: c.hair)),
        hourMinuteShape: const RoundedRectangleBorder(),
        dayPeriodShape: const RoundedRectangleBorder(),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  static TextTheme _textTheme(HawatColors c) {
    TextStyle s(double size, FontWeight weight, {Color? color, double height = 1.4}) => TextStyle(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFallback,
      fontSize: size,
      fontWeight: weight,
      height: height,
      color: color ?? c.foreground,
      leadingDistribution: TextLeadingDistribution.even,
    );

    return TextTheme(
      displaySmall: s(26, FontWeight.w700, height: 1.2),
      headlineSmall: s(22, FontWeight.w700, height: 1.25),
      titleLarge: s(18, FontWeight.w700, height: 1.3),
      titleMedium: s(16, FontWeight.w700),
      titleSmall: s(14, FontWeight.w700),
      bodyLarge: s(15, FontWeight.w500),
      bodyMedium: s(14, FontWeight.w400),
      bodySmall: s(12.5, FontWeight.w400, color: c.muted),
      labelLarge: s(15, FontWeight.w700, height: 1.2),
      labelMedium: s(13, FontWeight.w600, height: 1.25),
      labelSmall: s(11.5, FontWeight.w600, height: 1.25),
    );
  }
}
