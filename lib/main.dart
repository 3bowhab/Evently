import 'package:evently/core/constants/app_routes.dart';
import 'package:evently/core/responsive/responsive_config.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/services/prefs_service.dart';
import 'package:evently/ui/auth_flow/view/login_view.dart';
import 'package:evently/ui/auth_flow/view/register_view.dart';
import 'package:evently/ui/initial_flow/view/onboardings_view.dart';
import 'package:evently/ui/initial_flow/view/setup_view.dart';
import 'package:evently/ui/main_layout/main_layout_view.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool seenIntro = await PrefsService.hasSeenIntro();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<LanguageProvider>(create: (_) => LanguageProvider()),
      ],
      child: MyApp(seenIntro: seenIntro),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool seenIntro;

  const MyApp({super.key, required this.seenIntro});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    ResponsiveConfig.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      

      // Localization setup
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.currentLanguage),

      // dynamic font based on locale
      builder: (context, child) {
        final lang = languageProvider.currentLanguage;

        return Theme(
          data: Theme.of(context).copyWith(
            textTheme: lang == 'ar'
                ? GoogleFonts.cairoTextTheme(Theme.of(context).textTheme)
                : GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          child: child!,
        );
      },

      // Theme setup
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // themeMode: themeProvider.currentMode,
      themeMode: ThemeMode.dark,

      // Initial route setup
      initialRoute: seenIntro ? AppRoutes.loginView : AppRoutes.setupView,
      routes: {
        AppRoutes.setupView: (context) => const SetupView(),
        AppRoutes.mainLayoutView: (context) => const MainLayoutView(),
        AppRoutes.onboardingsView: (context) => const OnboardingsView(),
        AppRoutes.loginView: (context) => const LoginView(),
        AppRoutes.registerView: (context) => const RegisterView(),
      },
    );
  }
}
