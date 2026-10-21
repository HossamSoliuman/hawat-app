import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ar')];

  /// No description provided for @appName.
  ///
  /// In ar, this message translates to:
  /// **'حوات'**
  String get appName;

  /// No description provided for @retry.
  ///
  /// In ar, this message translates to:
  /// **'إعادة المحاولة'**
  String get retry;

  /// No description provided for @cancel.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get cancel;

  /// No description provided for @back.
  ///
  /// In ar, this message translates to:
  /// **'رجوع'**
  String get back;

  /// No description provided for @save.
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get save;

  /// No description provided for @close.
  ///
  /// In ar, this message translates to:
  /// **'إغلاق'**
  String get close;

  /// No description provided for @viewAll.
  ///
  /// In ar, this message translates to:
  /// **'عرض الكل'**
  String get viewAll;

  /// No description provided for @notSet.
  ///
  /// In ar, this message translates to:
  /// **'غير محدد'**
  String get notSet;

  /// No description provided for @searchHint.
  ///
  /// In ar, this message translates to:
  /// **'ابحث…'**
  String get searchHint;

  /// No description provided for @noResults.
  ///
  /// In ar, this message translates to:
  /// **'لا نتائج'**
  String get noResults;

  /// No description provided for @currencySar.
  ///
  /// In ar, this message translates to:
  /// **'ر.س'**
  String get currencySar;

  /// No description provided for @unitKg.
  ///
  /// In ar, this message translates to:
  /// **'كجم'**
  String get unitKg;

  /// No description provided for @amountSar.
  ///
  /// In ar, this message translates to:
  /// **'{amount} ر.س'**
  String amountSar(String amount);

  /// No description provided for @amountKg.
  ///
  /// In ar, this message translates to:
  /// **'{amount} كجم'**
  String amountKg(String amount);

  /// No description provided for @daysCount.
  ///
  /// In ar, this message translates to:
  /// **'{count, plural, =1{يوم واحد} =2{يومان} few{{count} أيام} many{{count} يومًا} other{{count} يوم}}'**
  String daysCount(int count);

  /// No description provided for @hoursValue.
  ///
  /// In ar, this message translates to:
  /// **'{hours} ساعة'**
  String hoursValue(String hours);

  /// No description provided for @tripsCount.
  ///
  /// In ar, this message translates to:
  /// **'{count, plural, =0{لا رحلات} =1{رحلة واحدة} =2{رحلتان} few{{count} رحلات} many{{count} رحلة} other{{count} رحلة}}'**
  String tripsCount(int count);

  /// No description provided for @invoicesCount.
  ///
  /// In ar, this message translates to:
  /// **'{count, plural, =1{فاتورة واحدة} =2{فاتورتان} few{{count} فواتير} many{{count} فاتورة} other{{count} فاتورة}}'**
  String invoicesCount(int count);

  /// No description provided for @todayAt.
  ///
  /// In ar, this message translates to:
  /// **'اليوم {time}'**
  String todayAt(String time);

  /// No description provided for @yesterdayAt.
  ///
  /// In ar, this message translates to:
  /// **'أمس {time}'**
  String yesterdayAt(String time);

  /// No description provided for @errorNetwork.
  ///
  /// In ar, this message translates to:
  /// **'تعذّر الاتصال بالخادم. تحقق من الإنترنت ثم أعد المحاولة.'**
  String get errorNetwork;

  /// No description provided for @errorServer.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ في الخادم. أعد المحاولة بعد قليل.'**
  String get errorServer;

  /// No description provided for @errorNotFound.
  ///
  /// In ar, this message translates to:
  /// **'هذا العنصر لم يعد متاحًا.'**
  String get errorNotFound;

  /// No description provided for @errorForbidden.
  ///
  /// In ar, this message translates to:
  /// **'لا تملك صلاحية هذا الإجراء.'**
  String get errorForbidden;

  /// No description provided for @errorConflict.
  ///
  /// In ar, this message translates to:
  /// **'تغيّر هذا السجل من جهاز آخر. أعد تحميله ثم عدّل.'**
  String get errorConflict;

  /// No description provided for @errorRateLimited.
  ///
  /// In ar, this message translates to:
  /// **'محاولات كثيرة. انتظر دقيقة ثم أعد المحاولة.'**
  String get errorRateLimited;

  /// No description provided for @errorBusy.
  ///
  /// In ar, this message translates to:
  /// **'الطلب السابق ما زال قيد التنفيذ. أعد المحاولة بعد لحظات.'**
  String get errorBusy;

  /// No description provided for @errorUnknown.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ غير متوقع.'**
  String get errorUnknown;

  /// No description provided for @sessionExpired.
  ///
  /// In ar, this message translates to:
  /// **'انتهت جلستك. سجّل الدخول من جديد.'**
  String get sessionExpired;

  /// No description provided for @offlineSaved.
  ///
  /// In ar, this message translates to:
  /// **'غير متصل، تظهر آخر بيانات محفوظة'**
  String get offlineSaved;

  /// No description provided for @offlineSavedAt.
  ///
  /// In ar, this message translates to:
  /// **'غير متصل، آخر تحديث {time}'**
  String offlineSavedAt(String time);

  /// No description provided for @loadMoreFailed.
  ///
  /// In ar, this message translates to:
  /// **'تعذّر تحميل المزيد'**
  String get loadMoreFailed;

  /// No description provided for @reload.
  ///
  /// In ar, this message translates to:
  /// **'إعادة التحميل'**
  String get reload;

  /// No description provided for @updateRequiredTitle.
  ///
  /// In ar, this message translates to:
  /// **'يلزم تحديث التطبيق'**
  String get updateRequiredTitle;

  /// No description provided for @updateRequiredBody.
  ///
  /// In ar, this message translates to:
  /// **'هذه النسخة من حوات لم تعد مدعومة. حدّث التطبيق من المتجر لتتابع عملك.'**
  String get updateRequiredBody;

  /// No description provided for @updateNow.
  ///
  /// In ar, this message translates to:
  /// **'تحديث الآن'**
  String get updateNow;

  /// No description provided for @startupFailedTitle.
  ///
  /// In ar, this message translates to:
  /// **'تعذّر الوصول إلى حوات'**
  String get startupFailedTitle;

  /// No description provided for @stagingBadge.
  ///
  /// In ar, this message translates to:
  /// **'بيئة الاختبار'**
  String get stagingBadge;

  /// No description provided for @loginTitle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get loginTitle;

  /// No description provided for @phoneLabel.
  ///
  /// In ar, this message translates to:
  /// **'رقم الجوال'**
  String get phoneLabel;

  /// No description provided for @phoneHint.
  ///
  /// In ar, this message translates to:
  /// **'05XXXXXXXX'**
  String get phoneHint;

  /// No description provided for @passwordLabel.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get passwordLabel;

  /// No description provided for @showPassword.
  ///
  /// In ar, this message translates to:
  /// **'إظهار كلمة المرور'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In ar, this message translates to:
  /// **'إخفاء كلمة المرور'**
  String get hidePassword;

  /// No description provided for @loginButton.
  ///
  /// In ar, this message translates to:
  /// **'دخول'**
  String get loginButton;

  /// No description provided for @forgotPassword.
  ///
  /// In ar, this message translates to:
  /// **'نسيت كلمة المرور؟'**
  String get forgotPassword;

  /// No description provided for @noAccount.
  ///
  /// In ar, this message translates to:
  /// **'ليس لديك حساب؟'**
  String get noAccount;

  /// No description provided for @requestAccount.
  ///
  /// In ar, this message translates to:
  /// **'اطلب حسابًا'**
  String get requestAccount;

  /// No description provided for @quickLogin.
  ///
  /// In ar, this message translates to:
  /// **'دخول سريع'**
  String get quickLogin;

  /// No description provided for @phoneRequired.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رقم الجوال'**
  String get phoneRequired;

  /// No description provided for @phoneInvalid.
  ///
  /// In ar, this message translates to:
  /// **'رقم الجوال يبدأ بـ 05 ويتكوّن من 10 أرقام'**
  String get phoneInvalid;

  /// No description provided for @passwordRequired.
  ///
  /// In ar, this message translates to:
  /// **'أدخل كلمة المرور'**
  String get passwordRequired;

  /// No description provided for @forgotTitle.
  ///
  /// In ar, this message translates to:
  /// **'نسيت كلمة المرور؟'**
  String get forgotTitle;

  /// No description provided for @forgotBody.
  ///
  /// In ar, this message translates to:
  /// **'تواصل مع الدعم الفني، وسيعيد ضبط كلمة المرور لحسابك.'**
  String get forgotBody;

  /// No description provided for @supportTitle.
  ///
  /// In ar, this message translates to:
  /// **'الدعم الفني'**
  String get supportTitle;

  /// No description provided for @supportBody.
  ///
  /// In ar, this message translates to:
  /// **'فريق حوات جاهز لمساعدتك في أي وقت.'**
  String get supportBody;

  /// No description provided for @callSupport.
  ///
  /// In ar, this message translates to:
  /// **'اتصال'**
  String get callSupport;

  /// No description provided for @whatsappSupport.
  ///
  /// In ar, this message translates to:
  /// **'واتساب'**
  String get whatsappSupport;

  /// No description provided for @gateTitle.
  ///
  /// In ar, this message translates to:
  /// **'التطبيق للملاك حاليًا'**
  String get gateTitle;

  /// No description provided for @gateBody.
  ///
  /// In ar, this message translates to:
  /// **'حسابك مسجّل بدور «{role}». تابع عملك من بوابة حوات على الويب.'**
  String gateBody(String role);

  /// No description provided for @logout.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logout;

  /// No description provided for @logoutConfirmTitle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج من حوات؟'**
  String get logoutConfirmTitle;

  /// No description provided for @logoutConfirmBody.
  ///
  /// In ar, this message translates to:
  /// **'ستحتاج رقم جوالك وكلمة المرور للدخول مرة أخرى.'**
  String get logoutConfirmBody;

  /// No description provided for @navHome.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get navHome;

  /// No description provided for @navTrips.
  ///
  /// In ar, this message translates to:
  /// **'الرحلات'**
  String get navTrips;

  /// No description provided for @navSales.
  ///
  /// In ar, this message translates to:
  /// **'المبيعات'**
  String get navSales;

  /// No description provided for @navMore.
  ///
  /// In ar, this message translates to:
  /// **'المزيد'**
  String get navMore;

  /// No description provided for @navAdd.
  ///
  /// In ar, this message translates to:
  /// **'إجراء جديد'**
  String get navAdd;

  /// No description provided for @quickNewTrip.
  ///
  /// In ar, this message translates to:
  /// **'رحلة جديدة'**
  String get quickNewTrip;

  /// No description provided for @quickStartTrip.
  ///
  /// In ar, this message translates to:
  /// **'بدء رحلة'**
  String get quickStartTrip;

  /// No description provided for @quickSubmitCatch.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل المصيد'**
  String get quickSubmitCatch;

  /// No description provided for @quickNoScheduled.
  ///
  /// In ar, this message translates to:
  /// **'لا رحلات بانتظار الانطلاق'**
  String get quickNoScheduled;

  /// No description provided for @quickNoAtSea.
  ///
  /// In ar, this message translates to:
  /// **'لا رحلات في البحر الآن'**
  String get quickNoAtSea;

  /// No description provided for @quickSell.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل بيع'**
  String get quickSell;

  /// No description provided for @quickConsign.
  ///
  /// In ar, this message translates to:
  /// **'إرسال للدلال'**
  String get quickConsign;

  /// No description provided for @pickTripTitle.
  ///
  /// In ar, this message translates to:
  /// **'اختر الرحلة'**
  String get pickTripTitle;

  /// No description provided for @greetingMorning.
  ///
  /// In ar, this message translates to:
  /// **'صباح الخير، {name}'**
  String greetingMorning(String name);

  /// No description provided for @greetingEvening.
  ///
  /// In ar, this message translates to:
  /// **'مساء الخير، {name}'**
  String greetingEvening(String name);

  /// No description provided for @needsAction.
  ///
  /// In ar, this message translates to:
  /// **'يحتاج إجراءك'**
  String get needsAction;

  /// No description provided for @nothingPending.
  ///
  /// In ar, this message translates to:
  /// **'لا شيء بانتظارك'**
  String get nothingPending;

  /// No description provided for @actionTripsToStart.
  ///
  /// In ar, this message translates to:
  /// **'بانتظار الانطلاق'**
  String get actionTripsToStart;

  /// No description provided for @actionTripsToSell.
  ///
  /// In ar, this message translates to:
  /// **'جاهزة للبيع'**
  String get actionTripsToSell;

  /// No description provided for @actionUnpaid.
  ///
  /// In ar, this message translates to:
  /// **'فواتير لم تُحصَّل'**
  String get actionUnpaid;

  /// No description provided for @startShort.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ'**
  String get startShort;

  /// No description provided for @periodToday.
  ///
  /// In ar, this message translates to:
  /// **'اليوم'**
  String get periodToday;

  /// No description provided for @periodMonth.
  ///
  /// In ar, this message translates to:
  /// **'الشهر'**
  String get periodMonth;

  /// No description provided for @periodYear.
  ///
  /// In ar, this message translates to:
  /// **'السنة'**
  String get periodYear;

  /// No description provided for @statRevenueToday.
  ///
  /// In ar, this message translates to:
  /// **'إيرادات اليوم'**
  String get statRevenueToday;

  /// No description provided for @statRevenueMonth.
  ///
  /// In ar, this message translates to:
  /// **'إيرادات الشهر'**
  String get statRevenueMonth;

  /// No description provided for @statRevenueYear.
  ///
  /// In ar, this message translates to:
  /// **'إيرادات السنة'**
  String get statRevenueYear;

  /// No description provided for @statCatchToday.
  ///
  /// In ar, this message translates to:
  /// **'مصيد اليوم'**
  String get statCatchToday;

  /// No description provided for @statCatchMonth.
  ///
  /// In ar, this message translates to:
  /// **'مصيد الشهر'**
  String get statCatchMonth;

  /// No description provided for @statCatchYear.
  ///
  /// In ar, this message translates to:
  /// **'مصيد السنة'**
  String get statCatchYear;

  /// No description provided for @statActiveBoats.
  ///
  /// In ar, this message translates to:
  /// **'القوارب النشطة'**
  String get statActiveBoats;

  /// No description provided for @pipelineTitle.
  ///
  /// In ar, this message translates to:
  /// **'مسار الرحلات'**
  String get pipelineTitle;

  /// No description provided for @pipeScheduled.
  ///
  /// In ar, this message translates to:
  /// **'مجدولة'**
  String get pipeScheduled;

  /// No description provided for @pipeAtSea.
  ///
  /// In ar, this message translates to:
  /// **'في البحر'**
  String get pipeAtSea;

  /// No description provided for @pipeCounting.
  ///
  /// In ar, this message translates to:
  /// **'عند العداد'**
  String get pipeCounting;

  /// No description provided for @pipeForSale.
  ///
  /// In ar, this message translates to:
  /// **'للبيع'**
  String get pipeForSale;

  /// No description provided for @noActiveTrips.
  ///
  /// In ar, this message translates to:
  /// **'لا رحلات جارية الآن'**
  String get noActiveTrips;

  /// No description provided for @stockTitle.
  ///
  /// In ar, this message translates to:
  /// **'الأسماك المتوفرة'**
  String get stockTitle;

  /// No description provided for @noStock.
  ///
  /// In ar, this message translates to:
  /// **'لا مصيد متاح للبيع بعد'**
  String get noStock;

  /// No description provided for @revenueTitle.
  ///
  /// In ar, this message translates to:
  /// **'الإيرادات'**
  String get revenueTitle;

  /// No description provided for @recentSalesTitle.
  ///
  /// In ar, this message translates to:
  /// **'آخر المبيعات'**
  String get recentSalesTitle;

  /// No description provided for @noSalesYet.
  ///
  /// In ar, this message translates to:
  /// **'لا مبيعات بعد'**
  String get noSalesYet;

  /// No description provided for @phaseScheduled.
  ///
  /// In ar, this message translates to:
  /// **'مجدولة'**
  String get phaseScheduled;

  /// No description provided for @phaseAtSea.
  ///
  /// In ar, this message translates to:
  /// **'في البحر'**
  String get phaseAtSea;

  /// No description provided for @phaseAwaitingCounter.
  ///
  /// In ar, this message translates to:
  /// **'بانتظار العداد'**
  String get phaseAwaitingCounter;

  /// No description provided for @phaseCounting.
  ///
  /// In ar, this message translates to:
  /// **'جارية العد'**
  String get phaseCounting;

  /// No description provided for @phaseForSale.
  ///
  /// In ar, this message translates to:
  /// **'جاهزة للبيع'**
  String get phaseForSale;

  /// No description provided for @phaseSold.
  ///
  /// In ar, this message translates to:
  /// **'مباعة'**
  String get phaseSold;

  /// No description provided for @phaseCounted.
  ///
  /// In ar, this message translates to:
  /// **'اكتمل العد'**
  String get phaseCounted;

  /// No description provided for @phaseCancelled.
  ///
  /// In ar, this message translates to:
  /// **'ملغاة'**
  String get phaseCancelled;

  /// No description provided for @stepScheduled.
  ///
  /// In ar, this message translates to:
  /// **'مجدولة'**
  String get stepScheduled;

  /// No description provided for @stepAtSea.
  ///
  /// In ar, this message translates to:
  /// **'في البحر'**
  String get stepAtSea;

  /// No description provided for @stepAwaitingCounter.
  ///
  /// In ar, this message translates to:
  /// **'بانتظار العداد'**
  String get stepAwaitingCounter;

  /// No description provided for @stepCounting.
  ///
  /// In ar, this message translates to:
  /// **'جارية العد'**
  String get stepCounting;

  /// No description provided for @stepForSale.
  ///
  /// In ar, this message translates to:
  /// **'جاهزة للبيع'**
  String get stepForSale;

  /// No description provided for @actionStartTrip.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ الرحلة'**
  String get actionStartTrip;

  /// No description provided for @actionSubmitCatch.
  ///
  /// In ar, this message translates to:
  /// **'إنهاء الرحلة وتسجيل المصيد'**
  String get actionSubmitCatch;

  /// No description provided for @waitingCounterAt.
  ///
  /// In ar, this message translates to:
  /// **'بانتظار العداد في {port}'**
  String waitingCounterAt(String port);

  /// No description provided for @waitingCounter.
  ///
  /// In ar, this message translates to:
  /// **'بانتظار العداد'**
  String get waitingCounter;

  /// No description provided for @countingNow.
  ///
  /// In ar, this message translates to:
  /// **'العداد يعدّ المصيد الآن'**
  String get countingNow;

  /// No description provided for @availableForSale.
  ///
  /// In ar, this message translates to:
  /// **'المتاح للبيع {amount} كجم'**
  String availableForSale(String amount);

  /// No description provided for @actionSell.
  ///
  /// In ar, this message translates to:
  /// **'بيع لزبون'**
  String get actionSell;

  /// No description provided for @actionConsign.
  ///
  /// In ar, this message translates to:
  /// **'إرسال للدلال'**
  String get actionConsign;

  /// No description provided for @tripsTitle.
  ///
  /// In ar, this message translates to:
  /// **'الرحلات'**
  String get tripsTitle;

  /// No description provided for @tabScheduled.
  ///
  /// In ar, this message translates to:
  /// **'مجدولة'**
  String get tabScheduled;

  /// No description provided for @tabInProgress.
  ///
  /// In ar, this message translates to:
  /// **'جارية'**
  String get tabInProgress;

  /// No description provided for @tabForSale.
  ///
  /// In ar, this message translates to:
  /// **'للبيع'**
  String get tabForSale;

  /// No description provided for @tabDone.
  ///
  /// In ar, this message translates to:
  /// **'مكتملة'**
  String get tabDone;

  /// No description provided for @tabCancelled.
  ///
  /// In ar, this message translates to:
  /// **'ملغاة'**
  String get tabCancelled;

  /// No description provided for @searchTripNumber.
  ///
  /// In ar, this message translates to:
  /// **'ابحث برقم الرحلة'**
  String get searchTripNumber;

  /// No description provided for @allBoats.
  ///
  /// In ar, this message translates to:
  /// **'كل القوارب'**
  String get allBoats;

  /// No description provided for @noTripsScheduled.
  ///
  /// In ar, this message translates to:
  /// **'لا رحلات مجدولة'**
  String get noTripsScheduled;

  /// No description provided for @noTripsInProgress.
  ///
  /// In ar, this message translates to:
  /// **'لا رحلات في البحر أو عند العداد'**
  String get noTripsInProgress;

  /// No description provided for @noTripsForSale.
  ///
  /// In ar, this message translates to:
  /// **'لا رحلات جاهزة للبيع'**
  String get noTripsForSale;

  /// No description provided for @noTripsDone.
  ///
  /// In ar, this message translates to:
  /// **'لا رحلات مكتملة بعد'**
  String get noTripsDone;

  /// No description provided for @noTripsCancelled.
  ///
  /// In ar, this message translates to:
  /// **'لا رحلات ملغاة'**
  String get noTripsCancelled;

  /// No description provided for @noTripsMatch.
  ///
  /// In ar, this message translates to:
  /// **'لا رحلات بهذا الرقم'**
  String get noTripsMatch;

  /// No description provided for @departureLabel.
  ///
  /// In ar, this message translates to:
  /// **'الانطلاق'**
  String get departureLabel;

  /// No description provided for @declaredLabel.
  ///
  /// In ar, this message translates to:
  /// **'المعلن'**
  String get declaredLabel;

  /// No description provided for @countedLabel.
  ///
  /// In ar, this message translates to:
  /// **'المعدود'**
  String get countedLabel;

  /// No description provided for @differenceLabel.
  ///
  /// In ar, this message translates to:
  /// **'الفرق'**
  String get differenceLabel;

  /// No description provided for @sectionTripInfo.
  ///
  /// In ar, this message translates to:
  /// **'بيانات الرحلة'**
  String get sectionTripInfo;

  /// No description provided for @fieldBoat.
  ///
  /// In ar, this message translates to:
  /// **'القارب'**
  String get fieldBoat;

  /// No description provided for @fieldCaptain.
  ///
  /// In ar, this message translates to:
  /// **'الكابتن'**
  String get fieldCaptain;

  /// No description provided for @fieldDeparturePort.
  ///
  /// In ar, this message translates to:
  /// **'ميناء المغادرة'**
  String get fieldDeparturePort;

  /// No description provided for @fieldReturnPort.
  ///
  /// In ar, this message translates to:
  /// **'ميناء العودة'**
  String get fieldReturnPort;

  /// No description provided for @fieldTripType.
  ///
  /// In ar, this message translates to:
  /// **'نوع التصريح'**
  String get fieldTripType;

  /// No description provided for @fieldGear.
  ///
  /// In ar, this message translates to:
  /// **'أداة الصيد'**
  String get fieldGear;

  /// No description provided for @fieldLicense.
  ///
  /// In ar, this message translates to:
  /// **'رقم الرخصة'**
  String get fieldLicense;

  /// No description provided for @fieldCrewCount.
  ///
  /// In ar, this message translates to:
  /// **'عدد الطاقم'**
  String get fieldCrewCount;

  /// No description provided for @fieldPlannedDays.
  ///
  /// In ar, this message translates to:
  /// **'المدة المخططة بالأيام'**
  String get fieldPlannedDays;

  /// No description provided for @fieldPlannedDuration.
  ///
  /// In ar, this message translates to:
  /// **'المدة المخططة'**
  String get fieldPlannedDuration;

  /// No description provided for @fieldDepartureTime.
  ///
  /// In ar, this message translates to:
  /// **'موعد الانطلاق'**
  String get fieldDepartureTime;

  /// No description provided for @fieldStartedAt.
  ///
  /// In ar, this message translates to:
  /// **'انطلقت'**
  String get fieldStartedAt;

  /// No description provided for @fieldReturnedAt.
  ///
  /// In ar, this message translates to:
  /// **'عادت'**
  String get fieldReturnedAt;

  /// No description provided for @fieldDuration.
  ///
  /// In ar, this message translates to:
  /// **'مدة الرحلة'**
  String get fieldDuration;

  /// No description provided for @fieldCounter.
  ///
  /// In ar, this message translates to:
  /// **'العداد'**
  String get fieldCounter;

  /// No description provided for @fieldNotes.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظات'**
  String get fieldNotes;

  /// No description provided for @sectionCatch.
  ///
  /// In ar, this message translates to:
  /// **'المصيد'**
  String get sectionCatch;

  /// No description provided for @noCatchYet.
  ///
  /// In ar, this message translates to:
  /// **'لم يُسجَّل المصيد بعد'**
  String get noCatchYet;

  /// No description provided for @sectionAvailable.
  ///
  /// In ar, this message translates to:
  /// **'المتاح للبيع'**
  String get sectionAvailable;

  /// No description provided for @sectionTripSales.
  ///
  /// In ar, this message translates to:
  /// **'مبيعات الرحلة'**
  String get sectionTripSales;

  /// No description provided for @sectionConsignments.
  ///
  /// In ar, this message translates to:
  /// **'المرسل للدلالين'**
  String get sectionConsignments;

  /// No description provided for @cancelReasonLabel.
  ///
  /// In ar, this message translates to:
  /// **'سبب الإلغاء'**
  String get cancelReasonLabel;

  /// No description provided for @menuEditTrip.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الرحلة'**
  String get menuEditTrip;

  /// No description provided for @menuCancelTrip.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء الرحلة'**
  String get menuCancelTrip;

  /// No description provided for @tripActionsMenu.
  ///
  /// In ar, this message translates to:
  /// **'إجراءات الرحلة'**
  String get tripActionsMenu;

  /// No description provided for @startConfirmTitle.
  ///
  /// In ar, this message translates to:
  /// **'بدء الرحلة الآن؟'**
  String get startConfirmTitle;

  /// No description provided for @startConfirmBody.
  ///
  /// In ar, this message translates to:
  /// **'سيظهر القارب {boat} في البحر من هذه اللحظة.'**
  String startConfirmBody(String boat);

  /// No description provided for @tripStarted.
  ///
  /// In ar, this message translates to:
  /// **'انطلقت الرحلة'**
  String get tripStarted;

  /// No description provided for @cancelTripTitle.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء الرحلة'**
  String get cancelTripTitle;

  /// No description provided for @cancelReasonHint.
  ///
  /// In ar, this message translates to:
  /// **'اكتب سبب الإلغاء'**
  String get cancelReasonHint;

  /// No description provided for @cancelReasonRequired.
  ///
  /// In ar, this message translates to:
  /// **'سبب الإلغاء مطلوب'**
  String get cancelReasonRequired;

  /// No description provided for @reasonWeather.
  ///
  /// In ar, this message translates to:
  /// **'سوء الأحوال الجوية'**
  String get reasonWeather;

  /// No description provided for @reasonBreakdown.
  ///
  /// In ar, this message translates to:
  /// **'عطل في القارب'**
  String get reasonBreakdown;

  /// No description provided for @reasonCrew.
  ///
  /// In ar, this message translates to:
  /// **'نقص في الطاقم'**
  String get reasonCrew;

  /// No description provided for @cancelTripConfirm.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد الإلغاء'**
  String get cancelTripConfirm;

  /// No description provided for @keepTrip.
  ///
  /// In ar, this message translates to:
  /// **'تراجع'**
  String get keepTrip;

  /// No description provided for @tripCancelled.
  ///
  /// In ar, this message translates to:
  /// **'أُلغيت الرحلة'**
  String get tripCancelled;

  /// No description provided for @newTripTitle.
  ///
  /// In ar, this message translates to:
  /// **'رحلة جديدة'**
  String get newTripTitle;

  /// No description provided for @editTripTitle.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الرحلة'**
  String get editTripTitle;

  /// No description provided for @sectionBoatCaptain.
  ///
  /// In ar, this message translates to:
  /// **'القارب والكابتن'**
  String get sectionBoatCaptain;

  /// No description provided for @sectionPortsTime.
  ///
  /// In ar, this message translates to:
  /// **'الموانئ والموعد'**
  String get sectionPortsTime;

  /// No description provided for @sectionPermit.
  ///
  /// In ar, this message translates to:
  /// **'التصريح والأداة'**
  String get sectionPermit;

  /// No description provided for @chooseBoat.
  ///
  /// In ar, this message translates to:
  /// **'اختر القارب'**
  String get chooseBoat;

  /// No description provided for @boatRequired.
  ///
  /// In ar, this message translates to:
  /// **'اختر القارب'**
  String get boatRequired;

  /// No description provided for @captainOfBoat.
  ///
  /// In ar, this message translates to:
  /// **'كابتن القارب'**
  String get captainOfBoat;

  /// No description provided for @noCaptain.
  ///
  /// In ar, this message translates to:
  /// **'بلا كابتن'**
  String get noCaptain;

  /// No description provided for @portOfBoat.
  ///
  /// In ar, this message translates to:
  /// **'ميناء القارب'**
  String get portOfBoat;

  /// No description provided for @sameAsDeparture.
  ///
  /// In ar, this message translates to:
  /// **'ميناء المغادرة نفسه'**
  String get sameAsDeparture;

  /// No description provided for @departureOnStart.
  ///
  /// In ar, this message translates to:
  /// **'يُسجَّل عند بدء الرحلة'**
  String get departureOnStart;

  /// No description provided for @clearValue.
  ///
  /// In ar, this message translates to:
  /// **'مسح'**
  String get clearValue;

  /// No description provided for @saveTrip.
  ///
  /// In ar, this message translates to:
  /// **'حفظ الرحلة'**
  String get saveTrip;

  /// No description provided for @tripCreated.
  ///
  /// In ar, this message translates to:
  /// **'أُنشئت الرحلة'**
  String get tripCreated;

  /// No description provided for @tripSaved.
  ///
  /// In ar, this message translates to:
  /// **'حُفظت التعديلات'**
  String get tripSaved;

  /// No description provided for @setupNotReady.
  ///
  /// In ar, this message translates to:
  /// **'إعداد القارب لم يكتمل'**
  String get setupNotReady;

  /// No description provided for @setupWarnings.
  ///
  /// In ar, this message translates to:
  /// **'تنبيهات القارب'**
  String get setupWarnings;

  /// No description provided for @setupAdvisory.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك إنشاء الرحلة، لكن أكمل إعداد القارب قبل انطلاقه.'**
  String get setupAdvisory;

  /// No description provided for @noBoatsYet.
  ///
  /// In ar, this message translates to:
  /// **'لا قوارب مسجّلة. أضف قاربك من بوابة حوات على الويب أولًا.'**
  String get noBoatsYet;

  /// No description provided for @plannedDaysInvalid.
  ///
  /// In ar, this message translates to:
  /// **'من 1 إلى 90 يومًا'**
  String get plannedDaysInvalid;

  /// No description provided for @crewCountInvalid.
  ///
  /// In ar, this message translates to:
  /// **'عدد صحيح من 0 إلى 200'**
  String get crewCountInvalid;

  /// No description provided for @catchTitle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل المصيد'**
  String get catchTitle;

  /// No description provided for @addSpecies.
  ///
  /// In ar, this message translates to:
  /// **'إضافة صنف'**
  String get addSpecies;

  /// No description provided for @speciesLabel.
  ///
  /// In ar, this message translates to:
  /// **'الصنف'**
  String get speciesLabel;

  /// No description provided for @chooseSpecies.
  ///
  /// In ar, this message translates to:
  /// **'اختر الصنف'**
  String get chooseSpecies;

  /// No description provided for @weightLabel.
  ///
  /// In ar, this message translates to:
  /// **'الوزن بالكيلو'**
  String get weightLabel;

  /// No description provided for @noteLabel.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظة'**
  String get noteLabel;

  /// No description provided for @addNote.
  ///
  /// In ar, this message translates to:
  /// **'إضافة ملاحظة'**
  String get addNote;

  /// No description provided for @removeLine.
  ///
  /// In ar, this message translates to:
  /// **'حذف السطر'**
  String get removeLine;

  /// No description provided for @totalLabel.
  ///
  /// In ar, this message translates to:
  /// **'المجموع'**
  String get totalLabel;

  /// No description provided for @reviewCatch.
  ///
  /// In ar, this message translates to:
  /// **'مراجعة المصيد'**
  String get reviewCatch;

  /// No description provided for @catchSummaryTitle.
  ///
  /// In ar, this message translates to:
  /// **'ملخص المصيد'**
  String get catchSummaryTitle;

  /// No description provided for @catchSummaryNote.
  ///
  /// In ar, this message translates to:
  /// **'بعد التسليم تنتظر الرحلة العداد، ولا يمكن تعديل المصيد.'**
  String get catchSummaryNote;

  /// No description provided for @submitCatch.
  ///
  /// In ar, this message translates to:
  /// **'تسليم المصيد'**
  String get submitCatch;

  /// No description provided for @editCatch.
  ///
  /// In ar, this message translates to:
  /// **'تعديل'**
  String get editCatch;

  /// No description provided for @catchSubmitted.
  ///
  /// In ar, this message translates to:
  /// **'سُلّم المصيد، والرحلة بانتظار العداد'**
  String get catchSubmitted;

  /// No description provided for @lineSpeciesRequired.
  ///
  /// In ar, this message translates to:
  /// **'الصنف مطلوب'**
  String get lineSpeciesRequired;

  /// No description provided for @lineWeightRequired.
  ///
  /// In ar, this message translates to:
  /// **'الوزن مطلوب'**
  String get lineWeightRequired;

  /// No description provided for @lineWeightInvalid.
  ///
  /// In ar, this message translates to:
  /// **'الوزن أكبر من صفر'**
  String get lineWeightInvalid;

  /// No description provided for @catchEmpty.
  ///
  /// In ar, this message translates to:
  /// **'أضف صنفًا واحدًا على الأقل'**
  String get catchEmpty;

  /// No description provided for @speciesLines.
  ///
  /// In ar, this message translates to:
  /// **'{count, plural, =1{سطر واحد} =2{سطران} few{{count} أسطر} many{{count} سطرًا} other{{count} سطر}}'**
  String speciesLines(int count);

  /// No description provided for @catchLogTitle.
  ///
  /// In ar, this message translates to:
  /// **'سجل الصيد'**
  String get catchLogTitle;

  /// No description provided for @tabBySpecies.
  ///
  /// In ar, this message translates to:
  /// **'بالصنف'**
  String get tabBySpecies;

  /// No description provided for @tabLines.
  ///
  /// In ar, this message translates to:
  /// **'السطور'**
  String get tabLines;

  /// No description provided for @totalDeclared.
  ///
  /// In ar, this message translates to:
  /// **'إجمالي المعلن'**
  String get totalDeclared;

  /// No description provided for @totalCounted.
  ///
  /// In ar, this message translates to:
  /// **'إجمالي المعدود'**
  String get totalCounted;

  /// No description provided for @speciesCountLabel.
  ///
  /// In ar, this message translates to:
  /// **'الأصناف'**
  String get speciesCountLabel;

  /// No description provided for @allCaptains.
  ///
  /// In ar, this message translates to:
  /// **'كل الكباتن'**
  String get allCaptains;

  /// No description provided for @noCatchLog.
  ///
  /// In ar, this message translates to:
  /// **'لا مصيد مسجّل بعد'**
  String get noCatchLog;

  /// No description provided for @salesTitle.
  ///
  /// In ar, this message translates to:
  /// **'المبيعات'**
  String get salesTitle;

  /// No description provided for @unpaidOnly.
  ///
  /// In ar, this message translates to:
  /// **'غير المحصّلة'**
  String get unpaidOnly;

  /// No description provided for @searchSales.
  ///
  /// In ar, this message translates to:
  /// **'ابحث بالفاتورة أو الزبون'**
  String get searchSales;

  /// No description provided for @noSalesFound.
  ///
  /// In ar, this message translates to:
  /// **'لا فواتير'**
  String get noSalesFound;

  /// No description provided for @noUnpaidSales.
  ///
  /// In ar, this message translates to:
  /// **'كل الفواتير محصّلة'**
  String get noUnpaidSales;

  /// No description provided for @payPaid.
  ///
  /// In ar, this message translates to:
  /// **'مدفوعة'**
  String get payPaid;

  /// No description provided for @payPartial.
  ///
  /// In ar, this message translates to:
  /// **'مدفوعة جزئيًا'**
  String get payPartial;

  /// No description provided for @payUnpaid.
  ///
  /// In ar, this message translates to:
  /// **'غير مدفوعة'**
  String get payUnpaid;

  /// No description provided for @remainingLabel.
  ///
  /// In ar, this message translates to:
  /// **'المتبقي'**
  String get remainingLabel;

  /// No description provided for @cashCustomer.
  ///
  /// In ar, this message translates to:
  /// **'زبون نقدي'**
  String get cashCustomer;

  /// No description provided for @invoiceTitle.
  ///
  /// In ar, this message translates to:
  /// **'الفاتورة'**
  String get invoiceTitle;

  /// No description provided for @invoiceLines.
  ///
  /// In ar, this message translates to:
  /// **'الأصناف'**
  String get invoiceLines;

  /// No description provided for @subtotalLabel.
  ///
  /// In ar, this message translates to:
  /// **'المجموع'**
  String get subtotalLabel;

  /// No description provided for @discountLabel.
  ///
  /// In ar, this message translates to:
  /// **'الخصم'**
  String get discountLabel;

  /// No description provided for @grandTotalLabel.
  ///
  /// In ar, this message translates to:
  /// **'الإجمالي'**
  String get grandTotalLabel;

  /// No description provided for @paidLabel.
  ///
  /// In ar, this message translates to:
  /// **'المدفوع'**
  String get paidLabel;

  /// No description provided for @paymentMethodLabel.
  ///
  /// In ar, this message translates to:
  /// **'طريقة الدفع'**
  String get paymentMethodLabel;

  /// No description provided for @customerLabel.
  ///
  /// In ar, this message translates to:
  /// **'الزبون'**
  String get customerLabel;

  /// No description provided for @tripLabel.
  ///
  /// In ar, this message translates to:
  /// **'الرحلة'**
  String get tripLabel;

  /// No description provided for @dateLabel.
  ///
  /// In ar, this message translates to:
  /// **'التاريخ'**
  String get dateLabel;

  /// No description provided for @pricePerKg.
  ///
  /// In ar, this message translates to:
  /// **'{price} ر.س للكيلو'**
  String pricePerKg(String price);

  /// No description provided for @openInvoice.
  ///
  /// In ar, this message translates to:
  /// **'عرض الفاتورة'**
  String get openInvoice;

  /// No description provided for @shareInvoice.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة'**
  String get shareInvoice;

  /// No description provided for @shareInvoiceText.
  ///
  /// In ar, this message translates to:
  /// **'فاتورة حوات رقم {number}\n{url}'**
  String shareInvoiceText(String number, String url);

  /// No description provided for @periodFilter.
  ///
  /// In ar, this message translates to:
  /// **'الفترة'**
  String get periodFilter;

  /// No description provided for @totalsInvoices.
  ///
  /// In ar, this message translates to:
  /// **'الفواتير'**
  String get totalsInvoices;

  /// No description provided for @newSaleTitle.
  ///
  /// In ar, this message translates to:
  /// **'بيع لزبون'**
  String get newSaleTitle;

  /// No description provided for @stepCustomer.
  ///
  /// In ar, this message translates to:
  /// **'الزبون'**
  String get stepCustomer;

  /// No description provided for @stepLines.
  ///
  /// In ar, this message translates to:
  /// **'الأصناف'**
  String get stepLines;

  /// No description provided for @stepPayment.
  ///
  /// In ar, this message translates to:
  /// **'الدفع'**
  String get stepPayment;

  /// No description provided for @stepReview.
  ///
  /// In ar, this message translates to:
  /// **'المراجعة'**
  String get stepReview;

  /// No description provided for @chooseCustomer.
  ///
  /// In ar, this message translates to:
  /// **'اختر الزبون'**
  String get chooseCustomer;

  /// No description provided for @newCustomer.
  ///
  /// In ar, this message translates to:
  /// **'زبون جديد'**
  String get newCustomer;

  /// No description provided for @addCustomer.
  ///
  /// In ar, this message translates to:
  /// **'إضافة الزبون'**
  String get addCustomer;

  /// No description provided for @customerAdded.
  ///
  /// In ar, this message translates to:
  /// **'أُضيف الزبون'**
  String get customerAdded;

  /// No description provided for @availableAmount.
  ///
  /// In ar, this message translates to:
  /// **'المتاح: {amount}'**
  String availableAmount(String amount);

  /// No description provided for @pricePerKgLabel.
  ///
  /// In ar, this message translates to:
  /// **'سعر الكيلو'**
  String get pricePerKgLabel;

  /// No description provided for @useAll.
  ///
  /// In ar, this message translates to:
  /// **'الكل'**
  String get useAll;

  /// No description provided for @cappedAt.
  ///
  /// In ar, this message translates to:
  /// **'هذا كل المتاح: {amount}'**
  String cappedAt(String amount);

  /// No description provided for @linePriceRequired.
  ///
  /// In ar, this message translates to:
  /// **'سعر الكيلو مطلوب'**
  String get linePriceRequired;

  /// No description provided for @linePriceInvalid.
  ///
  /// In ar, this message translates to:
  /// **'السعر أكبر من صفر'**
  String get linePriceInvalid;

  /// No description provided for @lineOverAvailable.
  ///
  /// In ar, this message translates to:
  /// **'يتجاوز المتاح ({amount})'**
  String lineOverAvailable(String amount);

  /// No description provided for @paidInFull.
  ///
  /// In ar, this message translates to:
  /// **'مدفوع بالكامل'**
  String get paidInFull;

  /// No description provided for @paidAmountLabel.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ المدفوع'**
  String get paidAmountLabel;

  /// No description provided for @paidAmountRequired.
  ///
  /// In ar, this message translates to:
  /// **'أدخل المبلغ المدفوع'**
  String get paidAmountRequired;

  /// No description provided for @discountTooHigh.
  ///
  /// In ar, this message translates to:
  /// **'الخصم أكبر من المجموع'**
  String get discountTooHigh;

  /// No description provided for @paidTooHigh.
  ///
  /// In ar, this message translates to:
  /// **'المدفوع أكبر من الإجمالي'**
  String get paidTooHigh;

  /// No description provided for @nextStep.
  ///
  /// In ar, this message translates to:
  /// **'التالي'**
  String get nextStep;

  /// No description provided for @finishSale.
  ///
  /// In ar, this message translates to:
  /// **'إنهاء البيع'**
  String get finishSale;

  /// No description provided for @saleCreated.
  ///
  /// In ar, this message translates to:
  /// **'سُجّلت الفاتورة'**
  String get saleCreated;

  /// No description provided for @notSellable.
  ///
  /// In ar, this message translates to:
  /// **'مصيد هذه الرحلة غير متاح للبيع'**
  String get notSellable;

  /// No description provided for @collectPayment.
  ///
  /// In ar, this message translates to:
  /// **'تحصيل'**
  String get collectPayment;

  /// No description provided for @collectTitle.
  ///
  /// In ar, this message translates to:
  /// **'تحصيل دفعة'**
  String get collectTitle;

  /// No description provided for @amountLabel.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ'**
  String get amountLabel;

  /// No description provided for @fullRemaining.
  ///
  /// In ar, this message translates to:
  /// **'المتبقي كاملًا'**
  String get fullRemaining;

  /// No description provided for @amountRequired.
  ///
  /// In ar, this message translates to:
  /// **'أدخل المبلغ'**
  String get amountRequired;

  /// No description provided for @amountTooHigh.
  ///
  /// In ar, this message translates to:
  /// **'أكبر من المتبقي ({amount})'**
  String amountTooHigh(String amount);

  /// No description provided for @recordPayment.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدفعة'**
  String get recordPayment;

  /// No description provided for @paymentRecorded.
  ///
  /// In ar, this message translates to:
  /// **'سُجّلت الدفعة'**
  String get paymentRecorded;

  /// No description provided for @consignTitle.
  ///
  /// In ar, this message translates to:
  /// **'إرسال للدلال'**
  String get consignTitle;

  /// No description provided for @dalalLabel.
  ///
  /// In ar, this message translates to:
  /// **'الدلال'**
  String get dalalLabel;

  /// No description provided for @chooseDalal.
  ///
  /// In ar, this message translates to:
  /// **'اختر الدلال'**
  String get chooseDalal;

  /// No description provided for @dalalRequired.
  ///
  /// In ar, this message translates to:
  /// **'اختر الدلال'**
  String get dalalRequired;

  /// No description provided for @commissionShort.
  ///
  /// In ar, this message translates to:
  /// **'عمولة {pct}'**
  String commissionShort(String pct);

  /// No description provided for @noAgreement.
  ///
  /// In ar, this message translates to:
  /// **'بلا اتفاق'**
  String get noAgreement;

  /// No description provided for @reviewConsign.
  ///
  /// In ar, this message translates to:
  /// **'مراجعة الإرسال'**
  String get reviewConsign;

  /// No description provided for @consignSummaryTitle.
  ///
  /// In ar, this message translates to:
  /// **'ملخص الإرسال'**
  String get consignSummaryTitle;

  /// No description provided for @consignSummaryNote.
  ///
  /// In ar, this message translates to:
  /// **'يخرج الوزن من مخزونك إلى مخزون الدلال، ويبيعه الدلال من دكته.'**
  String get consignSummaryNote;

  /// No description provided for @consignConfirm.
  ///
  /// In ar, this message translates to:
  /// **'إرسال'**
  String get consignConfirm;

  /// No description provided for @consignSent.
  ///
  /// In ar, this message translates to:
  /// **'أُرسل المصيد إلى الدلال'**
  String get consignSent;

  /// No description provided for @consignmentsTitle.
  ///
  /// In ar, this message translates to:
  /// **'الإرسال للدلال'**
  String get consignmentsTitle;

  /// No description provided for @noConsignments.
  ///
  /// In ar, this message translates to:
  /// **'لا إرسال للدلالين بعد'**
  String get noConsignments;

  /// No description provided for @stockScreenTitle.
  ///
  /// In ar, this message translates to:
  /// **'المخزون'**
  String get stockScreenTitle;

  /// No description provided for @totalStock.
  ///
  /// In ar, this message translates to:
  /// **'إجمالي المخزون'**
  String get totalStock;

  /// No description provided for @movementsTitle.
  ///
  /// In ar, this message translates to:
  /// **'حركات الصنف'**
  String get movementsTitle;

  /// No description provided for @allSpecies.
  ///
  /// In ar, this message translates to:
  /// **'كل الأصناف'**
  String get allSpecies;

  /// No description provided for @noMovements.
  ///
  /// In ar, this message translates to:
  /// **'لا حركات بعد'**
  String get noMovements;

  /// No description provided for @balanceAfter.
  ///
  /// In ar, this message translates to:
  /// **'الرصيد {amount}'**
  String balanceAfter(String amount);

  /// No description provided for @dalalsTitle.
  ///
  /// In ar, this message translates to:
  /// **'الدلالون'**
  String get dalalsTitle;

  /// No description provided for @searchDalals.
  ///
  /// In ar, this message translates to:
  /// **'ابحث باسم الدلال'**
  String get searchDalals;

  /// No description provided for @noDalals.
  ///
  /// In ar, this message translates to:
  /// **'لا دلالين مفعّلين'**
  String get noDalals;

  /// No description provided for @agreementAccepted.
  ///
  /// In ar, this message translates to:
  /// **'معتمد'**
  String get agreementAccepted;

  /// No description provided for @agreementPending.
  ///
  /// In ar, this message translates to:
  /// **'بانتظار الرد'**
  String get agreementPending;

  /// No description provided for @agreementRejected.
  ///
  /// In ar, this message translates to:
  /// **'مرفوض'**
  String get agreementRejected;

  /// No description provided for @agreementTerms.
  ///
  /// In ar, this message translates to:
  /// **'عمولة {commission} · أجور {wage}'**
  String agreementTerms(String commission, String wage);

  /// No description provided for @agreementLabel.
  ///
  /// In ar, this message translates to:
  /// **'الاتفاق'**
  String get agreementLabel;

  /// No description provided for @rejectReasonLabel.
  ///
  /// In ar, this message translates to:
  /// **'سبب الرفض'**
  String get rejectReasonLabel;

  /// No description provided for @proposalTitle.
  ///
  /// In ar, this message translates to:
  /// **'طلب التعامل'**
  String get proposalTitle;

  /// No description provided for @commissionLabel.
  ///
  /// In ar, this message translates to:
  /// **'العمولة %'**
  String get commissionLabel;

  /// No description provided for @wageLabel.
  ///
  /// In ar, this message translates to:
  /// **'الأجور %'**
  String get wageLabel;

  /// No description provided for @messageLabel.
  ///
  /// In ar, this message translates to:
  /// **'رسالة'**
  String get messageLabel;

  /// No description provided for @commissionRequired.
  ///
  /// In ar, this message translates to:
  /// **'أدخل العمولة'**
  String get commissionRequired;

  /// No description provided for @pctInvalid.
  ///
  /// In ar, this message translates to:
  /// **'من 0 إلى 100'**
  String get pctInvalid;

  /// No description provided for @sendRequest.
  ///
  /// In ar, this message translates to:
  /// **'إرسال الطلب'**
  String get sendRequest;

  /// No description provided for @updateRequest.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الطلب'**
  String get updateRequest;

  /// No description provided for @resendRequest.
  ///
  /// In ar, this message translates to:
  /// **'إعادة الطلب'**
  String get resendRequest;

  /// No description provided for @requestSent.
  ///
  /// In ar, this message translates to:
  /// **'أُرسل الطلب إلى الدلال'**
  String get requestSent;

  /// No description provided for @callLabel.
  ///
  /// In ar, this message translates to:
  /// **'اتصال'**
  String get callLabel;

  /// No description provided for @moreTitle.
  ///
  /// In ar, this message translates to:
  /// **'المزيد'**
  String get moreTitle;

  /// No description provided for @groupStockCatch.
  ///
  /// In ar, this message translates to:
  /// **'المخزون والصيد'**
  String get groupStockCatch;

  /// No description provided for @groupCatch.
  ///
  /// In ar, this message translates to:
  /// **'الصيد'**
  String get groupCatch;

  /// No description provided for @groupContacts.
  ///
  /// In ar, this message translates to:
  /// **'الجهات'**
  String get groupContacts;

  /// No description provided for @groupAccount.
  ///
  /// In ar, this message translates to:
  /// **'الحساب'**
  String get groupAccount;

  /// No description provided for @profileTitle.
  ///
  /// In ar, this message translates to:
  /// **'الملف الشخصي'**
  String get profileTitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In ar, this message translates to:
  /// **'الإشعارات'**
  String get notificationsTitle;

  /// No description provided for @termsTitle.
  ///
  /// In ar, this message translates to:
  /// **'الشروط والأحكام'**
  String get termsTitle;

  /// No description provided for @privacyTitle.
  ///
  /// In ar, this message translates to:
  /// **'سياسة الخصوصية'**
  String get privacyTitle;

  /// No description provided for @appVersion.
  ///
  /// In ar, this message translates to:
  /// **'الإصدار {version}'**
  String appVersion(String version);

  /// No description provided for @markAllRead.
  ///
  /// In ar, this message translates to:
  /// **'تعليم الكل كمقروء'**
  String get markAllRead;

  /// No description provided for @unreadSection.
  ///
  /// In ar, this message translates to:
  /// **'جديدة'**
  String get unreadSection;

  /// No description provided for @earlierSection.
  ///
  /// In ar, this message translates to:
  /// **'السابقة'**
  String get earlierSection;

  /// No description provided for @noNotifications.
  ///
  /// In ar, this message translates to:
  /// **'لا إشعارات بعد'**
  String get noNotifications;

  /// No description provided for @editProfile.
  ///
  /// In ar, this message translates to:
  /// **'تعديل البيانات'**
  String get editProfile;

  /// No description provided for @nameLabel.
  ///
  /// In ar, this message translates to:
  /// **'الاسم'**
  String get nameLabel;

  /// No description provided for @nameRequired.
  ///
  /// In ar, this message translates to:
  /// **'أدخل الاسم'**
  String get nameRequired;

  /// No description provided for @emailLabel.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get emailLabel;

  /// No description provided for @emailInvalid.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني غير صحيح'**
  String get emailInvalid;

  /// No description provided for @changePassword.
  ///
  /// In ar, this message translates to:
  /// **'تغيير كلمة المرور'**
  String get changePassword;

  /// No description provided for @currentPassword.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور الحالية'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور الجديدة'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور الجديدة'**
  String get confirmPassword;

  /// No description provided for @passwordMin.
  ///
  /// In ar, this message translates to:
  /// **'ثمانية أحرف على الأقل'**
  String get passwordMin;

  /// No description provided for @passwordsMismatch.
  ///
  /// In ar, this message translates to:
  /// **'كلمتا المرور غير متطابقتين'**
  String get passwordsMismatch;

  /// No description provided for @passwordChanged.
  ///
  /// In ar, this message translates to:
  /// **'غُيّرت كلمة المرور، وخرجت أجهزتك الأخرى من الحساب.'**
  String get passwordChanged;

  /// No description provided for @profileSaved.
  ///
  /// In ar, this message translates to:
  /// **'حُفظت بياناتك'**
  String get profileSaved;

  /// No description provided for @changePhoto.
  ///
  /// In ar, this message translates to:
  /// **'تغيير الصورة'**
  String get changePhoto;

  /// No description provided for @removePhoto.
  ///
  /// In ar, this message translates to:
  /// **'إزالة الصورة'**
  String get removePhoto;

  /// No description provided for @pickFromGallery.
  ///
  /// In ar, this message translates to:
  /// **'من المعرض'**
  String get pickFromGallery;

  /// No description provided for @takePhoto.
  ///
  /// In ar, this message translates to:
  /// **'التقاط صورة'**
  String get takePhoto;

  /// No description provided for @photoUpdated.
  ///
  /// In ar, this message translates to:
  /// **'حُدّثت الصورة'**
  String get photoUpdated;

  /// No description provided for @photoRemoved.
  ///
  /// In ar, this message translates to:
  /// **'أُزيلت الصورة'**
  String get photoRemoved;

  /// No description provided for @groupFleet.
  ///
  /// In ar, this message translates to:
  /// **'الأسطول'**
  String get groupFleet;

  /// No description provided for @addAction.
  ///
  /// In ar, this message translates to:
  /// **'إضافة'**
  String get addAction;

  /// No description provided for @editAction.
  ///
  /// In ar, this message translates to:
  /// **'تعديل'**
  String get editAction;

  /// No description provided for @deleteAction.
  ///
  /// In ar, this message translates to:
  /// **'حذف'**
  String get deleteAction;

  /// No description provided for @moreActions.
  ///
  /// In ar, this message translates to:
  /// **'إجراءات'**
  String get moreActions;

  /// No description provided for @savedDone.
  ///
  /// In ar, this message translates to:
  /// **'حُفظ'**
  String get savedDone;

  /// No description provided for @deletedDone.
  ///
  /// In ar, this message translates to:
  /// **'حُذف'**
  String get deletedDone;

  /// No description provided for @deleteTitle.
  ///
  /// In ar, this message translates to:
  /// **'حذف {name}؟'**
  String deleteTitle(String name);

  /// No description provided for @deleteBody.
  ///
  /// In ar, this message translates to:
  /// **'لا يمكن التراجع عن الحذف.'**
  String get deleteBody;

  /// No description provided for @statusLabel.
  ///
  /// In ar, this message translates to:
  /// **'الحالة'**
  String get statusLabel;

  /// No description provided for @allStatuses.
  ///
  /// In ar, this message translates to:
  /// **'كل الحالات'**
  String get allStatuses;

  /// No description provided for @expired.
  ///
  /// In ar, this message translates to:
  /// **'منتهية'**
  String get expired;

  /// No description provided for @expiringSoon.
  ///
  /// In ar, this message translates to:
  /// **'تنتهي قريبًا'**
  String get expiringSoon;

  /// No description provided for @overdue.
  ///
  /// In ar, this message translates to:
  /// **'متأخر'**
  String get overdue;

  /// No description provided for @expiryBeforeStart.
  ///
  /// In ar, this message translates to:
  /// **'الانتهاء لا يسبق البداية'**
  String get expiryBeforeStart;

  /// No description provided for @dateRequired.
  ///
  /// In ar, this message translates to:
  /// **'اختر التاريخ'**
  String get dateRequired;

  /// No description provided for @portLabel.
  ///
  /// In ar, this message translates to:
  /// **'الميناء'**
  String get portLabel;

  /// No description provided for @choosePort.
  ///
  /// In ar, this message translates to:
  /// **'اختر الميناء'**
  String get choosePort;

  /// No description provided for @portRequired.
  ///
  /// In ar, this message translates to:
  /// **'الميناء مطلوب'**
  String get portRequired;

  /// No description provided for @noBoat.
  ///
  /// In ar, this message translates to:
  /// **'بلا قارب'**
  String get noBoat;

  /// No description provided for @tripsLabel.
  ///
  /// In ar, this message translates to:
  /// **'الرحلات'**
  String get tripsLabel;

  /// No description provided for @totalCatchLabel.
  ///
  /// In ar, this message translates to:
  /// **'إجمالي المصيد'**
  String get totalCatchLabel;

  /// No description provided for @sectionIdentity.
  ///
  /// In ar, this message translates to:
  /// **'التعريف'**
  String get sectionIdentity;

  /// No description provided for @sectionSpecs.
  ///
  /// In ar, this message translates to:
  /// **'المواصفات'**
  String get sectionSpecs;

  /// No description provided for @sectionLicense.
  ///
  /// In ar, this message translates to:
  /// **'الرخصة'**
  String get sectionLicense;

  /// No description provided for @sectionDocuments.
  ///
  /// In ar, this message translates to:
  /// **'الإقامة والرخصة'**
  String get sectionDocuments;

  /// No description provided for @sectionAssignment.
  ///
  /// In ar, this message translates to:
  /// **'القارب والميناء'**
  String get sectionAssignment;

  /// No description provided for @sectionContact.
  ///
  /// In ar, this message translates to:
  /// **'البيانات'**
  String get sectionContact;

  /// No description provided for @meters.
  ///
  /// In ar, this message translates to:
  /// **'{value} م'**
  String meters(String value);

  /// No description provided for @tons.
  ///
  /// In ar, this message translates to:
  /// **'{value} طن'**
  String tons(String value);

  /// No description provided for @yearsCount.
  ///
  /// In ar, this message translates to:
  /// **'{count, plural, =0{لا خبرة مسجّلة} =1{سنة واحدة} =2{سنتان} few{{count} سنوات} many{{count} سنة} other{{count} سنة}}'**
  String yearsCount(int count);

  /// No description provided for @boatsTitle.
  ///
  /// In ar, this message translates to:
  /// **'القوارب'**
  String get boatsTitle;

  /// No description provided for @boatTitle.
  ///
  /// In ar, this message translates to:
  /// **'القارب'**
  String get boatTitle;

  /// No description provided for @newBoat.
  ///
  /// In ar, this message translates to:
  /// **'قارب جديد'**
  String get newBoat;

  /// No description provided for @editBoat.
  ///
  /// In ar, this message translates to:
  /// **'تعديل القارب'**
  String get editBoat;

  /// No description provided for @searchBoats.
  ///
  /// In ar, this message translates to:
  /// **'ابحث بالاسم أو رقم القارب'**
  String get searchBoats;

  /// No description provided for @noBoats.
  ///
  /// In ar, this message translates to:
  /// **'لا قوارب بعد'**
  String get noBoats;

  /// No description provided for @boatNameLabel.
  ///
  /// In ar, this message translates to:
  /// **'اسم القارب'**
  String get boatNameLabel;

  /// No description provided for @boatNumberLabel.
  ///
  /// In ar, this message translates to:
  /// **'رقم القارب'**
  String get boatNumberLabel;

  /// No description provided for @boatNumberRequired.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رقم القارب'**
  String get boatNumberRequired;

  /// No description provided for @fieldNameEn.
  ///
  /// In ar, this message translates to:
  /// **'الاسم بالإنجليزية'**
  String get fieldNameEn;

  /// No description provided for @fieldCategory.
  ///
  /// In ar, this message translates to:
  /// **'الفئة'**
  String get fieldCategory;

  /// No description provided for @fieldBoatType.
  ///
  /// In ar, this message translates to:
  /// **'النوع'**
  String get fieldBoatType;

  /// No description provided for @fieldLength.
  ///
  /// In ar, this message translates to:
  /// **'الطول (م)'**
  String get fieldLength;

  /// No description provided for @fieldWidth.
  ///
  /// In ar, this message translates to:
  /// **'العرض (م)'**
  String get fieldWidth;

  /// No description provided for @fieldCapacity.
  ///
  /// In ar, this message translates to:
  /// **'الحمولة (طن)'**
  String get fieldCapacity;

  /// No description provided for @fieldCrewCapacity.
  ///
  /// In ar, this message translates to:
  /// **'سعة الطاقم'**
  String get fieldCrewCapacity;

  /// No description provided for @fieldColor.
  ///
  /// In ar, this message translates to:
  /// **'اللون'**
  String get fieldColor;

  /// No description provided for @fieldHull.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهيكل'**
  String get fieldHull;

  /// No description provided for @fieldBodyType.
  ///
  /// In ar, this message translates to:
  /// **'نوع البدن'**
  String get fieldBodyType;

  /// No description provided for @fieldSerial.
  ///
  /// In ar, this message translates to:
  /// **'الرقم التسلسلي'**
  String get fieldSerial;

  /// No description provided for @fieldEngineType.
  ///
  /// In ar, this message translates to:
  /// **'نوع المحرك'**
  String get fieldEngineType;

  /// No description provided for @fieldEnginePower.
  ///
  /// In ar, this message translates to:
  /// **'قوة المحرك'**
  String get fieldEnginePower;

  /// No description provided for @fieldEngineStatus.
  ///
  /// In ar, this message translates to:
  /// **'حالة المحرك'**
  String get fieldEngineStatus;

  /// No description provided for @fieldCallSign.
  ///
  /// In ar, this message translates to:
  /// **'رمز النداء'**
  String get fieldCallSign;

  /// No description provided for @fieldNextInspection.
  ///
  /// In ar, this message translates to:
  /// **'الفحص القادم'**
  String get fieldNextInspection;

  /// No description provided for @fieldLicenseType.
  ///
  /// In ar, this message translates to:
  /// **'نوع الرخصة'**
  String get fieldLicenseType;

  /// No description provided for @fieldLicenseStatus.
  ///
  /// In ar, this message translates to:
  /// **'حالة الرخصة'**
  String get fieldLicenseStatus;

  /// No description provided for @fieldLicenseProcess.
  ///
  /// In ar, this message translates to:
  /// **'إجراء الترخيص'**
  String get fieldLicenseProcess;

  /// No description provided for @fieldLicenseArea.
  ///
  /// In ar, this message translates to:
  /// **'منطقة الترخيص'**
  String get fieldLicenseArea;

  /// No description provided for @fieldLicenseDate.
  ///
  /// In ar, this message translates to:
  /// **'بداية الرخصة'**
  String get fieldLicenseDate;

  /// No description provided for @fieldLicenseExpiry.
  ///
  /// In ar, this message translates to:
  /// **'انتهاء الرخصة'**
  String get fieldLicenseExpiry;

  /// No description provided for @statusSetByTrips.
  ///
  /// In ar, this message translates to:
  /// **'تتغيّر الحالة حين تنتهي الرحلة.'**
  String get statusSetByTrips;

  /// No description provided for @noSpecs.
  ///
  /// In ar, this message translates to:
  /// **'لا مواصفات مسجّلة'**
  String get noSpecs;

  /// No description provided for @deleteBoatBody.
  ///
  /// In ar, this message translates to:
  /// **'لا يُحذف قارب له رحلات. لا يمكن التراجع عن الحذف.'**
  String get deleteBoatBody;

  /// No description provided for @readinessTitle.
  ///
  /// In ar, this message translates to:
  /// **'جاهزية القارب'**
  String get readinessTitle;

  /// No description provided for @boatReady.
  ///
  /// In ar, this message translates to:
  /// **'القارب جاهز للرحلات'**
  String get boatReady;

  /// No description provided for @setupReady.
  ///
  /// In ar, this message translates to:
  /// **'جاهز'**
  String get setupReady;

  /// No description provided for @setupMissingCount.
  ///
  /// In ar, this message translates to:
  /// **'{count, plural, =1{ينقصه شيء} =2{ينقصه شيئان} few{ينقصه {count} أشياء} other{ينقصه {count} شيئًا}}'**
  String setupMissingCount(int count);

  /// No description provided for @setupWarningsCount.
  ///
  /// In ar, this message translates to:
  /// **'{count, plural, =1{تنبيه واحد} =2{تنبيهان} few{{count} تنبيهات} other{{count} تنبيهًا}}'**
  String setupWarningsCount(int count);

  /// No description provided for @fixAssignCaptain.
  ///
  /// In ar, this message translates to:
  /// **'إسناد كابتن'**
  String get fixAssignCaptain;

  /// No description provided for @fixOpenCaptain.
  ///
  /// In ar, this message translates to:
  /// **'عرض الكابتن'**
  String get fixOpenCaptain;

  /// No description provided for @fixAddCrew.
  ///
  /// In ar, this message translates to:
  /// **'إضافة طاقم'**
  String get fixAddCrew;

  /// No description provided for @fixReviewCrew.
  ///
  /// In ar, this message translates to:
  /// **'مراجعة الطاقم'**
  String get fixReviewCrew;

  /// No description provided for @fixRenewLicense.
  ///
  /// In ar, this message translates to:
  /// **'تحديث الرخصة'**
  String get fixRenewLicense;

  /// No description provided for @fixEditBoat.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الحالة'**
  String get fixEditBoat;

  /// No description provided for @captainsTitle.
  ///
  /// In ar, this message translates to:
  /// **'الكباتن'**
  String get captainsTitle;

  /// No description provided for @captainTitle.
  ///
  /// In ar, this message translates to:
  /// **'كابتن'**
  String get captainTitle;

  /// No description provided for @newCaptain.
  ///
  /// In ar, this message translates to:
  /// **'كابتن جديد'**
  String get newCaptain;

  /// No description provided for @editCaptain.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الكابتن'**
  String get editCaptain;

  /// No description provided for @crewTitle.
  ///
  /// In ar, this message translates to:
  /// **'الطاقم'**
  String get crewTitle;

  /// No description provided for @crewMemberTitle.
  ///
  /// In ar, this message translates to:
  /// **'فرد طاقم'**
  String get crewMemberTitle;

  /// No description provided for @newCrewMember.
  ///
  /// In ar, this message translates to:
  /// **'فرد طاقم جديد'**
  String get newCrewMember;

  /// No description provided for @editCrewMember.
  ///
  /// In ar, this message translates to:
  /// **'تعديل فرد الطاقم'**
  String get editCrewMember;

  /// No description provided for @searchFishers.
  ///
  /// In ar, this message translates to:
  /// **'ابحث بالاسم أو الجوال أو الهوية'**
  String get searchFishers;

  /// No description provided for @noCaptains.
  ///
  /// In ar, this message translates to:
  /// **'لا كباتن بعد'**
  String get noCaptains;

  /// No description provided for @noCrew.
  ///
  /// In ar, this message translates to:
  /// **'لا طاقم بعد'**
  String get noCrew;

  /// No description provided for @nationalIdLabel.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهوية'**
  String get nationalIdLabel;

  /// No description provided for @nationalIdRequired.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رقم الهوية'**
  String get nationalIdRequired;

  /// No description provided for @idTypeLabel.
  ///
  /// In ar, this message translates to:
  /// **'نوع الهوية'**
  String get idTypeLabel;

  /// No description provided for @nationalityLabel.
  ///
  /// In ar, this message translates to:
  /// **'الجنسية'**
  String get nationalityLabel;

  /// No description provided for @experienceLabel.
  ///
  /// In ar, this message translates to:
  /// **'سنوات الخبرة'**
  String get experienceLabel;

  /// No description provided for @crewRoleLabel.
  ///
  /// In ar, this message translates to:
  /// **'المهمة'**
  String get crewRoleLabel;

  /// No description provided for @iqamaIssueLabel.
  ///
  /// In ar, this message translates to:
  /// **'بداية الإقامة'**
  String get iqamaIssueLabel;

  /// No description provided for @iqamaExpiryLabel.
  ///
  /// In ar, this message translates to:
  /// **'انتهاء الإقامة'**
  String get iqamaExpiryLabel;

  /// No description provided for @fishingLicenseLabel.
  ///
  /// In ar, this message translates to:
  /// **'رقم رخصة الصيد'**
  String get fishingLicenseLabel;

  /// No description provided for @portOrBoatRequired.
  ///
  /// In ar, this message translates to:
  /// **'اختر القارب أو الميناء'**
  String get portOrBoatRequired;

  /// No description provided for @documentExpired.
  ///
  /// In ar, this message translates to:
  /// **'وثيقة منتهية'**
  String get documentExpired;

  /// No description provided for @deleteCaptainBody.
  ///
  /// In ar, this message translates to:
  /// **'يُرفع عن قاربه، ويبقى اسمه على رحلاته السابقة. لا يمكن التراجع عن الحذف.'**
  String get deleteCaptainBody;

  /// No description provided for @maintenanceTitle.
  ///
  /// In ar, this message translates to:
  /// **'الصيانة'**
  String get maintenanceTitle;

  /// No description provided for @newMaintenance.
  ///
  /// In ar, this message translates to:
  /// **'صيانة جديدة'**
  String get newMaintenance;

  /// No description provided for @editMaintenance.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الصيانة'**
  String get editMaintenance;

  /// No description provided for @noMaintenance.
  ///
  /// In ar, this message translates to:
  /// **'لا صيانة مسجّلة'**
  String get noMaintenance;

  /// No description provided for @maintenanceTypeLabel.
  ///
  /// In ar, this message translates to:
  /// **'نوع الصيانة'**
  String get maintenanceTypeLabel;

  /// No description provided for @technicianLabel.
  ///
  /// In ar, this message translates to:
  /// **'الفني أو الورشة'**
  String get technicianLabel;

  /// No description provided for @estimatedCostLabel.
  ///
  /// In ar, this message translates to:
  /// **'التكلفة المتوقعة'**
  String get estimatedCostLabel;

  /// No description provided for @actualCostLabel.
  ///
  /// In ar, this message translates to:
  /// **'التكلفة الفعلية'**
  String get actualCostLabel;

  /// No description provided for @descriptionLabel.
  ///
  /// In ar, this message translates to:
  /// **'الوصف'**
  String get descriptionLabel;

  /// No description provided for @maintenanceExpenseHint.
  ///
  /// In ar, this message translates to:
  /// **'حين تُحفظ مكتملة بتكلفة تُسجَّل مصروفًا على القارب.'**
  String get maintenanceExpenseHint;

  /// No description provided for @maintenanceExpensePosted.
  ///
  /// In ar, this message translates to:
  /// **'سُجّلت مصروفًا'**
  String get maintenanceExpensePosted;

  /// No description provided for @deleteMaintenanceTitle.
  ///
  /// In ar, this message translates to:
  /// **'حذف سجل الصيانة؟'**
  String get deleteMaintenanceTitle;

  /// No description provided for @customersTitle.
  ///
  /// In ar, this message translates to:
  /// **'العملاء'**
  String get customersTitle;

  /// No description provided for @vendorsTitle.
  ///
  /// In ar, this message translates to:
  /// **'الموردون'**
  String get vendorsTitle;

  /// No description provided for @employeesTitle.
  ///
  /// In ar, this message translates to:
  /// **'الموظفون'**
  String get employeesTitle;

  /// No description provided for @editCustomer.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الزبون'**
  String get editCustomer;

  /// No description provided for @newVendor.
  ///
  /// In ar, this message translates to:
  /// **'مورد جديد'**
  String get newVendor;

  /// No description provided for @editVendor.
  ///
  /// In ar, this message translates to:
  /// **'تعديل المورد'**
  String get editVendor;

  /// No description provided for @newEmployee.
  ///
  /// In ar, this message translates to:
  /// **'موظف جديد'**
  String get newEmployee;

  /// No description provided for @editEmployee.
  ///
  /// In ar, this message translates to:
  /// **'تعديل الموظف'**
  String get editEmployee;

  /// No description provided for @searchContacts.
  ///
  /// In ar, this message translates to:
  /// **'ابحث بالاسم أو الجوال'**
  String get searchContacts;

  /// No description provided for @noCustomers.
  ///
  /// In ar, this message translates to:
  /// **'لا عملاء بعد'**
  String get noCustomers;

  /// No description provided for @noVendors.
  ///
  /// In ar, this message translates to:
  /// **'لا موردين بعد'**
  String get noVendors;

  /// No description provided for @noEmployees.
  ///
  /// In ar, this message translates to:
  /// **'لا موظفين بعد'**
  String get noEmployees;

  /// No description provided for @customerTypeLabel.
  ///
  /// In ar, this message translates to:
  /// **'نوع الزبون'**
  String get customerTypeLabel;

  /// No description provided for @jobTitleLabel.
  ///
  /// In ar, this message translates to:
  /// **'المسمى الوظيفي'**
  String get jobTitleLabel;

  /// No description provided for @idNumberLabel.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهوية'**
  String get idNumberLabel;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
