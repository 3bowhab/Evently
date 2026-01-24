import 'package:evently/core/constants/app_routes.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/initial_flow/view/setup_view.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Localization setup
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale('en'),

      // dynamic font based on locale
      builder: (context, child) {
        final lang = Localizations.localeOf(context).languageCode;

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
      themeMode: ThemeMode.dark,

      // Initial route setup
      initialRoute: AppRoutes.setupView,
      routes: {
        AppRoutes.setupView: (context) => const SetupView(),
      },
    );
  }
}