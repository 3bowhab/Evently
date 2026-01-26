// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get personalizeYourExperience => 'خصص تجربتك';

  @override
  String get chooseYourPreferred =>
      'اختر السمة واللغة المفضلة لديك لتبدأ بتجربة مريحة ومصممة خصيصًا لتناسب أسلوبك.';

  @override
  String get language => 'اللغة';

  @override
  String get home => 'الصفحة الرئيسية';

  @override
  String get favorite => 'المفضلة';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get logout => 'تسجيل الخروج';
}
