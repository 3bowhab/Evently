import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.main,
      onPrimary: AppColors.white,
      secondary: AppColors.secText,
      onSecondary: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.stroke,
      error: AppColors.red,
      onError: AppColors.white,
      tertiary: AppColors.main,
      secondaryContainer: AppColors.background,
      primaryFixed: AppColors.disabled,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headlineLarge.copyWith(
        color: AppColors.mainText,
      ),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(
        color: AppColors.mainText,
      ),
      headlineSmall: AppTextStyles.headlineSmall.copyWith(
        color: AppColors.mainText,
      ),
      labelLarge: AppTextStyles.labelLarge.copyWith(
        color: AppColors.main,
      ),
      titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.mainText),
      titleMedium: AppTextStyles.titleMedium.copyWith(
        color: AppColors.mainText,
      ),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.white),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.secText),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.secText),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.mainText),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.main,
      foregroundColor: AppColors.white,
      shape: CircleBorder(),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.main,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      indicator: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.main),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.white,
      elevation: 0,
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            color: AppColors.main,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          );
        }
        return const TextStyle(
          color: AppColors.disabled,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.main, size: 28);
        }
        return const IconThemeData(color: AppColors.disabled, size: 28);
      }),
    ),
  );

  // Dark Theme
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.mainDarkMode,
      onPrimary: AppColors.white,
      secondary: AppColors.secTextDarkMode,
      onSecondary: AppColors.white,
      surface: AppColors.inputs,
      onSurface: AppColors.strokeDarkMode,
      error: AppColors.red,
      onError: AppColors.white,
      tertiary: AppColors.white,
      secondaryContainer: AppColors.backgroundDarkMode,
      primaryFixed: AppColors.disabled
    ),
    scaffoldBackgroundColor: AppColors.backgroundDarkMode,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDarkMode,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headlineLarge.copyWith(
        color: AppColors.white,
      ),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(
        color: AppColors.white,
      ),
      headlineSmall: AppTextStyles.headlineSmall.copyWith(
        color: AppColors.white,
      ),
      titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.white),
      titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.white),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.secTextDarkMode,
      ),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.secTextDarkMode,
      ),
      bodySmall: AppTextStyles.bodySmall.copyWith(
        color: AppColors.secTextDarkMode,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainDarkMode,
      foregroundColor: AppColors.white,
      shape: CircleBorder(),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.mainDarkMode,
      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: AppColors.white),
      indicator: BoxDecoration(
        color: AppColors.mainDarkMode,
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.white),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.backgroundDarkMode,
      elevation: 0,
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            color: AppColors.mainDarkMode,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          );
        }
        return const TextStyle(
          color: AppColors.disabled,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.mainDarkMode, size: 28);
        }
        return const IconThemeData(color: AppColors.disabled, size: 28);
      }),
    ),
  );
}
