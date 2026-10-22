import 'package:flutter/widgets.dart';

import '../l10n/app_localizations.dart';
import 'format/format.dart';

export '../l10n/app_localizations.dart';

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension AmountStrings on AppLocalizations {
  /// "5,215 ر.س", the number isolated so a sign never jumps sides in RTL.
  String sar(num value) => amountSar(Fmt.ltr(Fmt.money(value)));

  /// "33,995 ر.س": a headline sum, rounded to the riyal.
  String sarWhole(num value) => amountSar(Fmt.ltr(Fmt.wholeMoney(value)));

  /// "158.5 كجم".
  String kg(num value) => amountKg(Fmt.ltr(Fmt.kg(value)));

  /// "20 دقيقة" / "ساعتين" / "3 أيام": the largest whole unit, at least a minute.
  String duration(Duration elapsed) {
    if (elapsed.inDays >= 1) return durationDays(elapsed.inDays);
    if (elapsed.inHours >= 1) return durationHours(elapsed.inHours);
    return durationMinutes(elapsed.inMinutes < 1 ? 1 : elapsed.inMinutes);
  }

  /// "منذ ساعتين".
  String since(Duration elapsed) => sinceDuration(duration(elapsed));

  /// "اليوم 6:30 م" / "أمس 6:30 م" / "غدًا 6:30 م" / "18 أكتوبر، 6:30 م".
  String when(DateTime value, {DateTime? now}) {
    final local = value.toLocal();
    final today = now ?? DateTime.now();
    final startOfToday = DateTime(today.year, today.month, today.day);
    final day = DateTime(local.year, local.month, local.day);
    final time = Fmt.ltr(Fmt.time(local));
    if (day == startOfToday) return todayAt(time);
    if (day == startOfToday.subtract(const Duration(days: 1))) return yesterdayAt(time);
    if (day == DateTime(today.year, today.month, today.day + 1)) return tomorrowAt(time);
    return Fmt.dateTime(local, now: today);
  }
}
