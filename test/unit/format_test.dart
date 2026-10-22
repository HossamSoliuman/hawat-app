import 'package:flutter_test/flutter_test.dart';
import 'package:hawat_app/core/format/format.dart';
import 'package:hawat_app/core/l10n.dart';

import '../helpers/harness.dart';

void main() {
  setUpAll(setUpFormatting);

  group('phone', () {
    test('every way people type a Saudi mobile becomes 05XXXXXXXX', () {
      expect(Phone.normalize('0500000101'), '0500000101');
      expect(Phone.normalize('+966 50 000 0101'), '0500000101');
      expect(Phone.normalize('00966500000101'), '0500000101');
      expect(Phone.normalize('500000101'), '0500000101');
      expect(Phone.normalize('٠٥٠٠٠٠٠١٠١'), '0500000101');
      expect(Phone.isValid('0500000101'), isTrue);
      expect(Phone.isValid('0400000101'), isFalse);
    });
  });

  group('numbers and dates', () {
    test('Western digits with thousands separators', () {
      expect(Fmt.money(5215), '5,215');
      expect(Fmt.money(5215.5), '5,215.5');
      expect(Fmt.kg(158.25), '158.3');
    });

    test('Arabic month names keep Western digits', () {
      final date = DateTime(2026, 10, 18, 18, 30);
      expect(Fmt.date(date), '18 أكتوبر 2026');
      expect(Fmt.time(date), '6:30 م');
      expect(Fmt.monthName('2026-09'), 'سبتمبر');
    });

    test('today and yesterday are said in words', () {
      final now = DateTime(2026, 10, 18, 20);
      expect(ar.when(DateTime(2026, 10, 18, 9, 5), now: now), contains('اليوم'));
      expect(ar.when(DateTime(2026, 10, 17, 9, 5), now: now), contains('أمس'));
      expect(ar.when(DateTime(2026, 10, 19, 9, 5), now: now), contains('غدًا'));
      expect(ar.when(DateTime(2026, 9, 2, 9, 5), now: now), startsWith('2 سبتمبر'));
    });

    test('trip and invoice numbers are isolated inside Arabic text', () {
      final text = Fmt.isolateCodes('انطلقت الرحلة TR-2026-0007 والفاتورة 26-09-000001');
      expect(text, contains(Fmt.ltr('TR-2026-0007')));
      expect(text, contains(Fmt.ltr('26-09-000001')));
    });

    test('amounts read naturally', () {
      expect(ar.sar(1300), '${Fmt.ltr('1,300')} ر.س');
      expect(ar.kg(160.5), '${Fmt.ltr('160.5')} كجم');
    });

    test('headline sums drop the halalas', () {
      expect(Fmt.wholeMoney(33994.5), '33,995');
      expect(Fmt.wholeMoney(29392.25), '29,392');
      expect(ar.sarWhole(48250), '${Fmt.ltr('48,250')} ر.س');
    });

    test('how long ago, in the largest whole unit', () {
      expect(ar.since(const Duration(seconds: 20)), 'منذ دقيقة');
      expect(ar.since(const Duration(minutes: 20)), 'منذ 20 دقيقة');
      expect(ar.since(const Duration(hours: 2, minutes: 50)), 'منذ ساعتين');
      expect(ar.since(const Duration(hours: 5)), 'منذ 5 ساعات');
      expect(ar.since(const Duration(days: 1, hours: 23)), 'منذ يوم');
      expect(ar.since(const Duration(days: 3)), 'منذ 3 أيام');
      expect(ar.since(const Duration(days: 12)), 'منذ 12 يومًا');
    });
  });

  test('Arabic plurals agree with the number', () {
    expect(ar.daysCount(1), 'يوم واحد');
    expect(ar.daysCount(2), 'يومان');
    expect(ar.daysCount(3), '3 أيام');
    expect(ar.daysCount(14), '14 يومًا');
    expect(ar.tripsCount(1), 'رحلة واحدة');
    expect(ar.tripsCount(2), 'رحلتان');
    expect(ar.tripsCount(5), '5 رحلات');
    expect(ar.tripsCount(25), '25 رحلة');
  });

  test('initials skip the Arabic article', () {
    expect(Fmt.initials('محمود الزهراني'), 'مز');
    expect(Fmt.initials('سالم'), 'س');
    expect(Fmt.firstName('محمود الزهراني'), 'محمود');
  });
}
