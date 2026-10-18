import 'package:flutter/material.dart';

/// The tone of a stat tile, chip or status: the web portal's `data-tone`.
enum Tone { primary, info, success, warning, danger, muted }

/// HUD design tokens, the same values as the web portal's
/// `resources/views/partials/styles.blade.php`, adapted to touch.
@immutable
class HawatColors extends ThemeExtension<HawatColors> {
  const HawatColors({
    required this.background,
    required this.panel,
    required this.foreground,
    required this.muted,
    required this.mutedSurface,
    required this.border,
    required this.hair,
    required this.primary,
    required this.onPrimary,
    required this.info,
    required this.success,
    required this.warning,
    required this.danger,
    required this.bracket,
    required this.toneWash,
    required this.toneEdge,
  });

  /// Page background, a few steps darker than the cards on it.
  final Color background;

  /// Card surface: soft and solid, so text on it always reads.
  final Color panel;
  final Color foreground;

  /// Secondary text.
  final Color muted;

  /// Neutral fill for inputs, skeletons and idle chips.
  final Color mutedSurface;
  final Color border;

  /// The 1px hairline under the corner brackets.
  final Color hair;
  final Color primary;
  final Color onPrimary;
  final Color info;
  final Color success;
  final Color warning;
  final Color danger;

  /// Corner bracket color.
  final Color bracket;

  /// How much of a tone washes a stat tile, and how strong its border is.
  final double toneWash;
  final double toneEdge;

  static HawatColors of(BuildContext context) => Theme.of(context).extension<HawatColors>()!;

  static final light = HawatColors(
    background: const Color(0xFFF0F3F7),
    panel: Color.alphaBlend(Colors.white.withValues(alpha: .94), const Color(0xFFF0F3F7)),
    foreground: const Color(0xFF141E29),
    muted: const Color(0xFF5C6A7A),
    mutedSurface: const Color(0xFFE9EDF2),
    border: const Color(0xFFC9D0D9),
    hair: const Color(0xFFC9D0D9).withValues(alpha: .75),
    primary: const Color(0xFF085F87),
    onPrimary: Colors.white,
    info: const Color(0xFF0B81B7),
    success: const Color(0xFF208866),
    warning: const Color(0xFFD77709),
    danger: const Color(0xFFE31C37),
    bracket: const Color(0xFF085F87).withValues(alpha: .45),
    toneWash: .06,
    toneEdge: .30,
  );

  static final dark = HawatColors(
    background: const Color(0xFF0A131F),
    panel: Color.alphaBlend(const Color(0xFF14202E).withValues(alpha: .9), const Color(0xFF0A131F)),
    foreground: const Color(0xFFEEF4FB),
    muted: const Color(0xFF97A7BA),
    mutedSurface: const Color(0xFF1C2A3B),
    border: const Color(0xFF304055),
    hair: const Color(0xFFEDF1F5).withValues(alpha: .16),
    primary: const Color(0xFF71A7E5),
    onPrimary: const Color(0xFF0A131F),
    info: _hsl(199, .85, .62),
    success: _hsl(160, .58, .52),
    warning: _hsl(38, .90, .60),
    danger: _hsl(352, .85, .66),
    bracket: const Color(0xFFEDF1F5).withValues(alpha: .42),
    toneWash: .08,
    toneEdge: .34,
  );

  static Color _hsl(double h, double s, double l) => HSLColor.fromAHSL(1, h, s, l).toColor();

  Color tone(Tone tone) => switch (tone) {
    Tone.primary => primary,
    Tone.info => info,
    Tone.success => success,
    Tone.warning => warning,
    Tone.danger => danger,
    Tone.muted => muted,
  };

  bool get isDark => background.computeLuminance() < .2;

  /// Text in a tone (chips, badges): darker than the tone itself on light
  /// surfaces and lighter on dark ones, so it keeps a readable contrast.
  Color toneText(Tone t) => isDark
      ? switch (t) {
          Tone.primary => primary,
          Tone.info => _hsl(199, .85, .70),
          Tone.success => _hsl(160, .60, .62),
          Tone.warning => _hsl(38, .90, .66),
          Tone.danger => _hsl(352, .85, .70),
          Tone.muted => muted,
        }
      : switch (t) {
          Tone.primary => primary,
          Tone.info => const Color(0xFF0369A1),
          Tone.success => const Color(0xFF0F7A5A),
          Tone.warning => const Color(0xFFB45309),
          Tone.danger => const Color(0xFFC81E3F),
          Tone.muted => muted,
        };

  /// A tone's light wash laid over the card surface.
  Color washOf(Tone t) => Color.alphaBlend(tone(t).withValues(alpha: toneWash), panel);

  Color edgeOf(Tone t) => tone(t).withValues(alpha: toneEdge);

  @override
  HawatColors copyWith({
    Color? background,
    Color? panel,
    Color? foreground,
    Color? muted,
    Color? mutedSurface,
    Color? border,
    Color? hair,
    Color? primary,
    Color? onPrimary,
    Color? info,
    Color? success,
    Color? warning,
    Color? danger,
    Color? bracket,
    double? toneWash,
    double? toneEdge,
  }) {
    return HawatColors(
      background: background ?? this.background,
      panel: panel ?? this.panel,
      foreground: foreground ?? this.foreground,
      muted: muted ?? this.muted,
      mutedSurface: mutedSurface ?? this.mutedSurface,
      border: border ?? this.border,
      hair: hair ?? this.hair,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      info: info ?? this.info,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      bracket: bracket ?? this.bracket,
      toneWash: toneWash ?? this.toneWash,
      toneEdge: toneEdge ?? this.toneEdge,
    );
  }

  @override
  HawatColors lerp(HawatColors? other, double t) {
    if (other == null) return this;
    return HawatColors(
      background: Color.lerp(background, other.background, t)!,
      panel: Color.lerp(panel, other.panel, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      mutedSurface: Color.lerp(mutedSurface, other.mutedSurface, t)!,
      border: Color.lerp(border, other.border, t)!,
      hair: Color.lerp(hair, other.hair, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      info: Color.lerp(info, other.info, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      bracket: Color.lerp(bracket, other.bracket, t)!,
      toneWash: toneWash + (other.toneWash - toneWash) * t,
      toneEdge: toneEdge + (other.toneEdge - toneEdge) * t,
    );
  }
}

/// Spacing and sizes shared by every screen.
abstract final class Hud {
  static const gap = 14.0;
  static const gutter = 16.0;
  static const statRadius = 10.0;
  static const bracketLength = 11.0;
  static const bracketThickness = 1.5;
  static const minTouch = 48.0;
  static const primaryButtonHeight = 52.0;
  static const fast = Duration(milliseconds: 160);
  static const medium = Duration(milliseconds: 200);
}
