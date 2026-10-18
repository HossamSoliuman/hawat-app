import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// Display formats: Western digits everywhere (as on the web portal), Arabic
/// month names, `ر.س` and `كجم` added by the strings, never by these helpers.
abstract final class Fmt {
  static final _money = NumberFormat('#,##0.##', 'en_US');
  static final _kg = NumberFormat('#,##0.#', 'en_US');
  static final _int = NumberFormat('#,##0', 'en_US');

  /// 5215 → "5,215", 5215.5 → "5,215.5".
  static String money(num value) => _money.format(value);

  static String kg(num value) => _kg.format(value);

  static String count(num value) => _int.format(value);

  /// Wraps a left-to-right value (trip or invoice number, phone, date with
  /// digits) in a Unicode isolate so it keeps its order inside Arabic text.
  static String ltr(String value) => '$_lri$value$_pdi';

  static final _lri = String.fromCharCode(0x2066);
  static final _pdi = String.fromCharCode(0x2069);

  /// Server text mixes Arabic with trip numbers, invoice numbers and dates
  /// (`TR-2026-0007`, `26-09-000001`, `2026-10-18`); each one is isolated so
  /// it never reverses after Arabic words.
  static String isolateCodes(String text) => text.replaceAllMapped(_codes, (m) => ltr(m[0]!));

  static final _codes = RegExp(r'[A-Z]{2,3}-\d{4}-\d{3,}|\d{2}-\d{2}-\d{4,}|\d{4}-\d{2}-\d{2}');

  /// "18 أكتوبر 2026".
  static String date(DateTime value) => DateFormat('d MMMM y', 'ar').format(value.toLocal());

  /// "18 أكتوبر".
  static String dayMonth(DateTime value) => DateFormat('d MMMM', 'ar').format(value.toLocal());

  /// "6:30 م".
  static String time(DateTime value) => DateFormat('h:mm a', 'ar').format(value.toLocal());

  /// "18 أكتوبر، 6:30 م", without the year when it is this year.
  static String dateTime(DateTime value, {DateTime? now}) {
    final local = value.toLocal();
    final today = now ?? DateTime.now();
    final day = local.year == today.year ? dayMonth(local) : date(local);
    return '$day، ${time(local)}';
  }

  /// Short month name for chart axes: "2026-09" → "سبتمبر".
  static String monthName(String yearMonth) {
    final parts = yearMonth.split('-');
    if (parts.length != 2) return yearMonth;
    final date = DateTime(int.tryParse(parts[0]) ?? 2000, int.tryParse(parts[1]) ?? 1);
    return DateFormat('MMMM', 'ar').format(date);
  }

  /// Initials for an avatar placeholder: "محمود الزهراني" → "مز" (the "ال"
  /// article is skipped, as people write initials by hand).
  static String initials(String name) {
    final words = name.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
    if (words.isEmpty) return '';
    String first(String word) {
      final body = word.startsWith('ال') && word.length > 3 ? word.substring(2) : word;
      return String.fromCharCode(body.runes.first);
    }

    if (words.length == 1) return first(words.first);
    return '${first(words.first)}${first(words.last)}';
  }

  /// The first name for a greeting.
  static String firstName(String name) => name.trim().split(RegExp(r'\s+')).first;
}

/// Saudi mobile numbers as the server stores them: `05XXXXXXXX`.
abstract final class Phone {
  static final _valid = RegExp(r'^05\d{8}$');

  static bool isValid(String value) => _valid.hasMatch(value);

  /// Arabic-Indic digits to Western, `+9665…` / `9665…` / `5…` to `05…`.
  static String normalize(String input) {
    var digits = toWesternDigits(input).replaceAll(RegExp(r'\D'), '');
    if (digits.startsWith('00966')) digits = digits.substring(5);
    if (digits.startsWith('966')) digits = digits.substring(3);
    if (digits.startsWith('5')) digits = '0$digits';
    return digits.length > 10 ? digits.substring(0, 10) : digits;
  }

  static String toWesternDigits(String input) {
    const eastern = '٠١٢٣٤٥٦٧٨٩';
    const persian = '۰۱۲۳۴۵۶۷۸۹';
    final out = StringBuffer();
    for (final char in input.split('')) {
      final e = eastern.indexOf(char);
      final p = persian.indexOf(char);
      out.write(e >= 0 ? '$e' : (p >= 0 ? '$p' : char));
    }
    return out.toString();
  }
}

/// Normalizes a phone number while it is typed.
class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final normalized = Phone.normalize(newValue.text);
    return TextEditingValue(text: normalized, selection: TextSelection.collapsed(offset: normalized.length));
  }
}

/// Decimal input (kg, money): Western digits, one decimal point, at most two decimals.
class DecimalInputFormatter extends TextInputFormatter {
  DecimalInputFormatter({this.decimals = 2});

  final int decimals;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = Phone.toWesternDigits(newValue.text).replaceAll('٫', '.').replaceAll(',', '.');
    text = text.replaceAll(RegExp(r'[^0-9.]'), '');
    final firstDot = text.indexOf('.');
    if (firstDot >= 0) {
      final whole = text.substring(0, firstDot);
      var fraction = text.substring(firstDot + 1).replaceAll('.', '');
      if (fraction.length > decimals) fraction = fraction.substring(0, decimals);
      text = '${whole.isEmpty ? '0' : whole}.$fraction';
    }
    if (text == newValue.text) return newValue;
    return TextEditingValue(text: text, selection: TextSelection.collapsed(offset: text.length));
  }
}

/// Whole numbers only, Arabic-Indic digits accepted.
class IntegerInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = Phone.toWesternDigits(newValue.text).replaceAll(RegExp(r'\D'), '');
    if (text == newValue.text) return newValue;
    return TextEditingValue(text: text, selection: TextSelection.collapsed(offset: text.length));
  }
}
