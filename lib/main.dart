import 'package:evently/core/constants/app_routes.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/ui/initial_flow/view/setup_view.dart';
import 'package:evently/ui/main_layout/main_layout_view.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Localization setup
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
      themeMode: themeProvider.currentMode,

      // Initial route setup
      initialRoute: AppRoutes.mainLayoutView,
      routes: {
        AppRoutes.setupView: (context) => const SetupView(),
        AppRoutes.mainLayoutView: (context) => const MainLayoutView(),
      },
    );
  }
}
