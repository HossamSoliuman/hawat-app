// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'حوات';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get cancel => 'إلغاء';

  @override
  String get back => 'رجوع';

  @override
  String get save => 'حفظ';

  @override
  String get close => 'إغلاق';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get notSet => 'غير محدد';

  @override
  String get searchHint => 'ابحث…';

  @override
  String get noResults => 'لا نتائج';

  @override
  String get currencySar => 'ر.س';

  @override
  String get unitKg => 'كجم';

  @override
  String amountSar(String amount) {
    return '$amount ر.س';
  }

  @override
  String amountKg(String amount) {
    return '$amount كجم';
  }

  @override
  String daysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count يوم',
      many: '$count يومًا',
      few: '$count أيام',
      two: 'يومان',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String hoursValue(String hours) {
    return '$hours ساعة';
  }

  @override
  String tripsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رحلة',
      many: '$count رحلة',
      few: '$count رحلات',
      two: 'رحلتان',
      one: 'رحلة واحدة',
      zero: 'لا رحلات',
    );
    return '$_temp0';
  }

  @override
  String invoicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count فاتورة',
      many: '$count فاتورة',
      few: '$count فواتير',
      two: 'فاتورتان',
      one: 'فاتورة واحدة',
    );
    return '$_temp0';
  }

  @override
  String todayAt(String time) {
    return 'اليوم $time';
  }

  @override
  String yesterdayAt(String time) {
    return 'أمس $time';
  }

  @override
  String get errorNetwork => 'تعذّر الاتصال بالخادم. تحقق من الإنترنت ثم أعد المحاولة.';

  @override
  String get errorServer => 'حدث خطأ في الخادم. أعد المحاولة بعد قليل.';

  @override
  String get errorNotFound => 'هذا العنصر لم يعد متاحًا.';

  @override
  String get errorForbidden => 'لا تملك صلاحية هذا الإجراء.';

  @override
  String get errorConflict => 'تغيّر هذا السجل من جهاز آخر. أعد تحميله ثم عدّل.';

  @override
  String get errorRateLimited => 'محاولات كثيرة. انتظر دقيقة ثم أعد المحاولة.';

  @override
  String get errorBusy => 'الطلب السابق ما زال قيد التنفيذ. أعد المحاولة بعد لحظات.';

  @override
  String get errorUnknown => 'حدث خطأ غير متوقع.';

  @override
  String get sessionExpired => 'انتهت جلستك. سجّل الدخول من جديد.';

  @override
  String get offlineSaved => 'غير متصل، تظهر آخر بيانات محفوظة';

  @override
  String offlineSavedAt(String time) {
    return 'غير متصل، آخر تحديث $time';
  }

  @override
  String get loadMoreFailed => 'تعذّر تحميل المزيد';

  @override
  String get reload => 'إعادة التحميل';

  @override
  String get updateRequiredTitle => 'يلزم تحديث التطبيق';

  @override
  String get updateRequiredBody => 'هذه النسخة من حوات لم تعد مدعومة. حدّث التطبيق من المتجر لتتابع عملك.';

  @override
  String get updateNow => 'تحديث الآن';

  @override
  String get startupFailedTitle => 'تعذّر الوصول إلى حوات';

  @override
  String get stagingBadge => 'بيئة الاختبار';

  @override
  String get loginTitle => 'تسجيل الدخول';

  @override
  String get phoneLabel => 'رقم الجوال';

  @override
  String get phoneHint => '05XXXXXXXX';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get showPassword => 'إظهار كلمة المرور';

  @override
  String get hidePassword => 'إخفاء كلمة المرور';

  @override
  String get loginButton => 'دخول';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get noAccount => 'ليس لديك حساب؟';

  @override
  String get requestAccount => 'اطلب حسابًا';

  @override
  String get quickLogin => 'دخول سريع';

  @override
  String get phoneRequired => 'أدخل رقم الجوال';

  @override
  String get phoneInvalid => 'رقم الجوال يبدأ بـ 05 ويتكوّن من 10 أرقام';

  @override
  String get passwordRequired => 'أدخل كلمة المرور';

  @override
  String get forgotTitle => 'نسيت كلمة المرور؟';

  @override
  String get forgotBody => 'تواصل مع الدعم الفني، وسيعيد ضبط كلمة المرور لحسابك.';

  @override
  String get supportTitle => 'الدعم الفني';

  @override
  String get supportBody => 'فريق حوات جاهز لمساعدتك في أي وقت.';

  @override
  String get callSupport => 'اتصال';

  @override
  String get whatsappSupport => 'واتساب';

  @override
  String get gateTitle => 'التطبيق للملاك حاليًا';

  @override
  String gateBody(String role) {
    return 'حسابك مسجّل بدور «$role». تابع عملك من بوابة حوات على الويب.';
  }

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get logoutConfirmTitle => 'تسجيل الخروج من حوات؟';

  @override
  String get logoutConfirmBody => 'ستحتاج رقم جوالك وكلمة المرور للدخول مرة أخرى.';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navTrips => 'الرحلات';

  @override
  String get navSales => 'المبيعات';

  @override
  String get navMore => 'المزيد';

  @override
  String get navAdd => 'إجراء جديد';

  @override
  String get quickNewTrip => 'رحلة جديدة';

  @override
  String get quickStartTrip => 'بدء رحلة';

  @override
  String get quickSubmitCatch => 'تسجيل المصيد';

  @override
  String get quickNoScheduled => 'لا رحلات بانتظار الانطلاق';

  @override
  String get quickNoAtSea => 'لا رحلات في البحر الآن';

  @override
  String get quickSell => 'تسجيل بيع';

  @override
  String get quickConsign => 'إرسال للدلال';

  @override
  String get pickTripTitle => 'اختر الرحلة';

  @override
  String greetingMorning(String name) {
    return 'صباح الخير، $name';
  }

  @override
  String greetingEvening(String name) {
    return 'مساء الخير، $name';
  }

  @override
  String get needsAction => 'يحتاج إجراءك';

  @override
  String get nothingPending => 'لا شيء بانتظارك';

  @override
  String get actionTripsToStart => 'بانتظار الانطلاق';

  @override
  String get actionTripsToSell => 'جاهزة للبيع';

  @override
  String get actionUnpaid => 'فواتير لم تُحصَّل';

  @override
  String get startShort => 'ابدأ';

  @override
  String get periodToday => 'اليوم';

  @override
  String get periodMonth => 'الشهر';

  @override
  String get periodYear => 'السنة';

  @override
  String get statRevenueToday => 'إيرادات اليوم';

  @override
  String get statRevenueMonth => 'إيرادات الشهر';

  @override
  String get statRevenueYear => 'إيرادات السنة';

  @override
  String get statCatchToday => 'مصيد اليوم';

  @override
  String get statCatchMonth => 'مصيد الشهر';

  @override
  String get statCatchYear => 'مصيد السنة';

  @override
  String get statActiveBoats => 'القوارب النشطة';

  @override
  String get pipelineTitle => 'مسار الرحلات';

  @override
  String get pipeScheduled => 'مجدولة';

  @override
  String get pipeAtSea => 'في البحر';

  @override
  String get pipeCounting => 'عند العداد';

  @override
  String get pipeForSale => 'للبيع';

  @override
  String get noActiveTrips => 'لا رحلات جارية الآن';

  @override
  String get stockTitle => 'الأسماك المتوفرة';

  @override
  String get noStock => 'لا مصيد متاح للبيع بعد';

  @override
  String get revenueTitle => 'الإيرادات';

  @override
  String get recentSalesTitle => 'آخر المبيعات';

  @override
  String get noSalesYet => 'لا مبيعات بعد';

  @override
  String get phaseScheduled => 'مجدولة';

  @override
  String get phaseAtSea => 'في البحر';

  @override
  String get phaseAwaitingCounter => 'بانتظار العداد';

  @override
  String get phaseCounting => 'جارية العد';

  @override
  String get phaseForSale => 'جاهزة للبيع';

  @override
  String get phaseSold => 'مباعة';

  @override
  String get phaseCounted => 'اكتمل العد';

  @override
  String get phaseCancelled => 'ملغاة';

  @override
  String get stepScheduled => 'مجدولة';

  @override
  String get stepAtSea => 'في البحر';

  @override
  String get stepAwaitingCounter => 'بانتظار العداد';

  @override
  String get stepCounting => 'جارية العد';

  @override
  String get stepForSale => 'جاهزة للبيع';

  @override
  String get actionStartTrip => 'ابدأ الرحلة';

  @override
  String get actionSubmitCatch => 'إنهاء الرحلة وتسجيل المصيد';

  @override
  String waitingCounterAt(String port) {
    return 'بانتظار العداد في $port';
  }

  @override
  String get waitingCounter => 'بانتظار العداد';

  @override
  String get countingNow => 'العداد يعدّ المصيد الآن';

  @override
  String availableForSale(String amount) {
    return 'المتاح للبيع $amount كجم';
  }

  @override
  String get actionSell => 'بيع لزبون';

  @override
  String get actionConsign => 'إرسال للدلال';

  @override
  String get tripsTitle => 'الرحلات';

  @override
  String get tabScheduled => 'مجدولة';

  @override
  String get tabInProgress => 'جارية';

  @override
  String get tabForSale => 'للبيع';

  @override
  String get tabDone => 'مكتملة';

  @override
  String get tabCancelled => 'ملغاة';

  @override
  String get searchTripNumber => 'ابحث برقم الرحلة';

  @override
  String get allBoats => 'كل القوارب';

  @override
  String get noTripsScheduled => 'لا رحلات مجدولة';

  @override
  String get noTripsInProgress => 'لا رحلات في البحر أو عند العداد';

  @override
  String get noTripsForSale => 'لا رحلات جاهزة للبيع';

  @override
  String get noTripsDone => 'لا رحلات مكتملة بعد';

  @override
  String get noTripsCancelled => 'لا رحلات ملغاة';

  @override
  String get noTripsMatch => 'لا رحلات بهذا الرقم';

  @override
  String get departureLabel => 'الانطلاق';

  @override
  String get declaredLabel => 'المعلن';

  @override
  String get countedLabel => 'المعدود';

  @override
  String get differenceLabel => 'الفرق';

  @override
  String get sectionTripInfo => 'بيانات الرحلة';

  @override
  String get fieldBoat => 'القارب';

  @override
  String get fieldCaptain => 'الكابتن';

  @override
  String get fieldDeparturePort => 'ميناء المغادرة';

  @override
  String get fieldReturnPort => 'ميناء العودة';

  @override
  String get fieldTripType => 'نوع التصريح';

  @override
  String get fieldGear => 'أداة الصيد';

  @override
  String get fieldLicense => 'رقم الرخصة';

  @override
  String get fieldCrewCount => 'عدد الطاقم';

  @override
  String get fieldPlannedDays => 'المدة المخططة بالأيام';

  @override
  String get fieldPlannedDuration => 'المدة المخططة';

  @override
  String get fieldDepartureTime => 'موعد الانطلاق';

  @override
  String get fieldStartedAt => 'انطلقت';

  @override
  String get fieldReturnedAt => 'عادت';

  @override
  String get fieldDuration => 'مدة الرحلة';

  @override
  String get fieldCounter => 'العداد';

  @override
  String get fieldNotes => 'ملاحظات';

  @override
  String get sectionCatch => 'المصيد';

  @override
  String get noCatchYet => 'لم يُسجَّل المصيد بعد';

  @override
  String get sectionAvailable => 'المتاح للبيع';

  @override
  String get sectionTripSales => 'مبيعات الرحلة';

  @override
  String get sectionConsignments => 'المرسل للدلالين';

  @override
  String get cancelReasonLabel => 'سبب الإلغاء';

  @override
  String get menuEditTrip => 'تعديل الرحلة';

  @override
  String get menuCancelTrip => 'إلغاء الرحلة';

  @override
  String get tripActionsMenu => 'إجراءات الرحلة';

  @override
  String get startConfirmTitle => 'بدء الرحلة الآن؟';

  @override
  String startConfirmBody(String boat) {
    return 'سيظهر القارب $boat في البحر من هذه اللحظة.';
  }

  @override
  String get tripStarted => 'انطلقت الرحلة';

  @override
  String get cancelTripTitle => 'إلغاء الرحلة';

  @override
  String get cancelReasonHint => 'اكتب سبب الإلغاء';

  @override
  String get cancelReasonRequired => 'سبب الإلغاء مطلوب';

  @override
  String get reasonWeather => 'سوء الأحوال الجوية';

  @override
  String get reasonBreakdown => 'عطل في القارب';

  @override
  String get reasonCrew => 'نقص في الطاقم';

  @override
  String get cancelTripConfirm => 'تأكيد الإلغاء';

  @override
  String get keepTrip => 'تراجع';

  @override
  String get tripCancelled => 'أُلغيت الرحلة';

  @override
  String get newTripTitle => 'رحلة جديدة';

  @override
  String get editTripTitle => 'تعديل الرحلة';

  @override
  String get sectionBoatCaptain => 'القارب والكابتن';

  @override
  String get sectionPortsTime => 'الموانئ والموعد';

  @override
  String get sectionPermit => 'التصريح والأداة';

  @override
  String get chooseBoat => 'اختر القارب';

  @override
  String get boatRequired => 'اختر القارب';

  @override
  String get captainOfBoat => 'كابتن القارب';

  @override
  String get noCaptain => 'بلا كابتن';

  @override
  String get portOfBoat => 'ميناء القارب';

  @override
  String get sameAsDeparture => 'ميناء المغادرة نفسه';

  @override
  String get departureOnStart => 'يُسجَّل عند بدء الرحلة';

  @override
  String get clearValue => 'مسح';

  @override
  String get saveTrip => 'حفظ الرحلة';

  @override
  String get tripCreated => 'أُنشئت الرحلة';

  @override
  String get tripSaved => 'حُفظت التعديلات';

  @override
  String get setupNotReady => 'إعداد القارب لم يكتمل';

  @override
  String get setupWarnings => 'تنبيهات القارب';

  @override
  String get setupAdvisory => 'يمكنك إنشاء الرحلة، لكن أكمل إعداد القارب قبل انطلاقه.';

  @override
  String get noBoatsYet => 'لا قوارب مسجّلة. أضف قاربك من بوابة حوات على الويب أولًا.';

  @override
  String get plannedDaysInvalid => 'من 1 إلى 90 يومًا';

  @override
  String get crewCountInvalid => 'عدد صحيح من 0 إلى 200';

  @override
  String get catchTitle => 'تسجيل المصيد';

  @override
  String get addSpecies => 'إضافة صنف';

  @override
  String get speciesLabel => 'الصنف';

  @override
  String get chooseSpecies => 'اختر الصنف';

  @override
  String get weightLabel => 'الوزن بالكيلو';

  @override
  String get noteLabel => 'ملاحظة';

  @override
  String get addNote => 'إضافة ملاحظة';

  @override
  String get removeLine => 'حذف السطر';

  @override
  String get totalLabel => 'المجموع';

  @override
  String get reviewCatch => 'مراجعة المصيد';

  @override
  String get catchSummaryTitle => 'ملخص المصيد';

  @override
  String get catchSummaryNote => 'بعد التسليم تنتظر الرحلة العداد، ولا يمكن تعديل المصيد.';

  @override
  String get submitCatch => 'تسليم المصيد';

  @override
  String get editCatch => 'تعديل';

  @override
  String get catchSubmitted => 'سُلّم المصيد، والرحلة بانتظار العداد';

  @override
  String get lineSpeciesRequired => 'الصنف مطلوب';

  @override
  String get lineWeightRequired => 'الوزن مطلوب';

  @override
  String get lineWeightInvalid => 'الوزن أكبر من صفر';

  @override
  String get catchEmpty => 'أضف صنفًا واحدًا على الأقل';

  @override
  String speciesLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سطر',
      many: '$count سطرًا',
      few: '$count أسطر',
      two: 'سطران',
      one: 'سطر واحد',
    );
    return '$_temp0';
  }

  @override
  String get catchLogTitle => 'سجل الصيد';

  @override
  String get tabBySpecies => 'بالصنف';

  @override
  String get tabLines => 'السطور';

  @override
  String get totalDeclared => 'إجمالي المعلن';

  @override
  String get totalCounted => 'إجمالي المعدود';

  @override
  String get speciesCountLabel => 'الأصناف';

  @override
  String get allCaptains => 'كل الكباتن';

  @override
  String get noCatchLog => 'لا مصيد مسجّل بعد';

  @override
  String get salesTitle => 'المبيعات';

  @override
  String get unpaidOnly => 'غير المحصّلة';

  @override
  String get searchSales => 'ابحث بالفاتورة أو الزبون';

  @override
  String get noSalesFound => 'لا فواتير';

  @override
  String get noUnpaidSales => 'كل الفواتير محصّلة';

  @override
  String get payPaid => 'مدفوعة';

  @override
  String get payPartial => 'مدفوعة جزئيًا';

  @override
  String get payUnpaid => 'غير مدفوعة';

  @override
  String get remainingLabel => 'المتبقي';

  @override
  String get cashCustomer => 'زبون نقدي';

  @override
  String get invoiceTitle => 'الفاتورة';

  @override
  String get invoiceLines => 'الأصناف';

  @override
  String get subtotalLabel => 'المجموع';

  @override
  String get discountLabel => 'الخصم';

  @override
  String get grandTotalLabel => 'الإجمالي';

  @override
  String get paidLabel => 'المدفوع';

  @override
  String get paymentMethodLabel => 'طريقة الدفع';

  @override
  String get customerLabel => 'الزبون';

  @override
  String get tripLabel => 'الرحلة';

  @override
  String get dateLabel => 'التاريخ';

  @override
  String pricePerKg(String price) {
    return '$price ر.س للكيلو';
  }

  @override
  String get openInvoice => 'عرض الفاتورة';

  @override
  String get shareInvoice => 'مشاركة';

  @override
  String shareInvoiceText(String number, String url) {
    return 'فاتورة حوات رقم $number\n$url';
  }

  @override
  String get periodFilter => 'الفترة';

  @override
  String get totalsInvoices => 'الفواتير';

  @override
  String get newSaleTitle => 'بيع لزبون';

  @override
  String get stepCustomer => 'الزبون';

  @override
  String get stepLines => 'الأصناف';

  @override
  String get stepPayment => 'الدفع';

  @override
  String get stepReview => 'المراجعة';

  @override
  String get chooseCustomer => 'اختر الزبون';

  @override
  String get newCustomer => 'زبون جديد';

  @override
  String get addCustomer => 'إضافة الزبون';

  @override
  String get customerAdded => 'أُضيف الزبون';

  @override
  String availableAmount(String amount) {
    return 'المتاح: $amount';
  }

  @override
  String get pricePerKgLabel => 'سعر الكيلو';

  @override
  String get useAll => 'الكل';

  @override
  String cappedAt(String amount) {
    return 'هذا كل المتاح: $amount';
  }

  @override
  String get linePriceRequired => 'سعر الكيلو مطلوب';

  @override
  String get linePriceInvalid => 'السعر أكبر من صفر';

  @override
  String lineOverAvailable(String amount) {
    return 'يتجاوز المتاح ($amount)';
  }

  @override
  String get paidInFull => 'مدفوع بالكامل';

  @override
  String get paidAmountLabel => 'المبلغ المدفوع';

  @override
  String get paidAmountRequired => 'أدخل المبلغ المدفوع';

  @override
  String get discountTooHigh => 'الخصم أكبر من المجموع';

  @override
  String get paidTooHigh => 'المدفوع أكبر من الإجمالي';

  @override
  String get nextStep => 'التالي';

  @override
  String get finishSale => 'إنهاء البيع';

  @override
  String get saleCreated => 'سُجّلت الفاتورة';

  @override
  String get notSellable => 'مصيد هذه الرحلة غير متاح للبيع';

  @override
  String get collectPayment => 'تحصيل';

  @override
  String get collectTitle => 'تحصيل دفعة';

  @override
  String get amountLabel => 'المبلغ';

  @override
  String get fullRemaining => 'المتبقي كاملًا';

  @override
  String get amountRequired => 'أدخل المبلغ';

  @override
  String amountTooHigh(String amount) {
    return 'أكبر من المتبقي ($amount)';
  }

  @override
  String get recordPayment => 'تسجيل الدفعة';

  @override
  String get paymentRecorded => 'سُجّلت الدفعة';

  @override
  String get consignTitle => 'إرسال للدلال';

  @override
  String get dalalLabel => 'الدلال';

  @override
  String get chooseDalal => 'اختر الدلال';

  @override
  String get dalalRequired => 'اختر الدلال';

  @override
  String commissionShort(String pct) {
    return 'عمولة $pct';
  }

  @override
  String get noAgreement => 'بلا اتفاق';

  @override
  String get reviewConsign => 'مراجعة الإرسال';

  @override
  String get consignSummaryTitle => 'ملخص الإرسال';

  @override
  String get consignSummaryNote => 'يخرج الوزن من مخزونك إلى مخزون الدلال، ويبيعه الدلال من دكته.';

  @override
  String get consignConfirm => 'إرسال';

  @override
  String get consignSent => 'أُرسل المصيد إلى الدلال';

  @override
  String get consignmentsTitle => 'الإرسال للدلال';

  @override
  String get noConsignments => 'لا إرسال للدلالين بعد';

  @override
  String get stockScreenTitle => 'المخزون';

  @override
  String get totalStock => 'إجمالي المخزون';

  @override
  String get movementsTitle => 'حركات الصنف';

  @override
  String get allSpecies => 'كل الأصناف';

  @override
  String get noMovements => 'لا حركات بعد';

  @override
  String balanceAfter(String amount) {
    return 'الرصيد $amount';
  }

  @override
  String get dalalsTitle => 'الدلالون';

  @override
  String get searchDalals => 'ابحث باسم الدلال';

  @override
  String get noDalals => 'لا دلالين مفعّلين';

  @override
  String get agreementAccepted => 'معتمد';

  @override
  String get agreementPending => 'بانتظار الرد';

  @override
  String get agreementRejected => 'مرفوض';

  @override
  String agreementTerms(String commission, String wage) {
    return 'عمولة $commission · أجور $wage';
  }

  @override
  String get agreementLabel => 'الاتفاق';

  @override
  String get rejectReasonLabel => 'سبب الرفض';

  @override
  String get proposalTitle => 'طلب التعامل';

  @override
  String get commissionLabel => 'العمولة %';

  @override
  String get wageLabel => 'الأجور %';

  @override
  String get messageLabel => 'رسالة';

  @override
  String get commissionRequired => 'أدخل العمولة';

  @override
  String get pctInvalid => 'من 0 إلى 100';

  @override
  String get sendRequest => 'إرسال الطلب';

  @override
  String get updateRequest => 'تعديل الطلب';

  @override
  String get resendRequest => 'إعادة الطلب';

  @override
  String get requestSent => 'أُرسل الطلب إلى الدلال';

  @override
  String get callLabel => 'اتصال';

  @override
  String get moreTitle => 'المزيد';

  @override
  String get groupStockCatch => 'المخزون والصيد';

  @override
  String get groupCatch => 'الصيد';

  @override
  String get groupContacts => 'الجهات';

  @override
  String get groupAccount => 'الحساب';

  @override
  String get profileTitle => 'الملف الشخصي';

  @override
  String get notificationsTitle => 'الإشعارات';

  @override
  String get termsTitle => 'الشروط والأحكام';

  @override
  String get privacyTitle => 'سياسة الخصوصية';

  @override
  String appVersion(String version) {
    return 'الإصدار $version';
  }

  @override
  String get markAllRead => 'تعليم الكل كمقروء';

  @override
  String get unreadSection => 'جديدة';

  @override
  String get earlierSection => 'السابقة';

  @override
  String get noNotifications => 'لا إشعارات بعد';

  @override
  String get editProfile => 'تعديل البيانات';

  @override
  String get nameLabel => 'الاسم';

  @override
  String get nameRequired => 'أدخل الاسم';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get emailInvalid => 'البريد الإلكتروني غير صحيح';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get currentPassword => 'كلمة المرور الحالية';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور الجديدة';

  @override
  String get passwordMin => 'ثمانية أحرف على الأقل';

  @override
  String get passwordsMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get passwordChanged => 'غُيّرت كلمة المرور، وخرجت أجهزتك الأخرى من الحساب.';

  @override
  String get profileSaved => 'حُفظت بياناتك';

  @override
  String get changePhoto => 'تغيير الصورة';

  @override
  String get removePhoto => 'إزالة الصورة';

  @override
  String get pickFromGallery => 'من المعرض';

  @override
  String get takePhoto => 'التقاط صورة';

  @override
  String get photoUpdated => 'حُدّثت الصورة';

  @override
  String get photoRemoved => 'أُزيلت الصورة';
}
