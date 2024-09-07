import 'package:flutter/material.dart';
import 'package:product_app/core/theme/colors.dart';
import 'package:product_app/core/theme/text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,

    // accentColor: AppColors.accentColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      headlineSmall: AppTextStyles.headlineSmall,
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium,
      labelSmall: AppTextStyles.labelSmall,
    ),
    // appBarTheme: const AppBarTheme(
    //   // backgroundColor: AppColors.primaryColor,
    //   titleTextStyle: AppTextStyles.titleLarge,
    // ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
    useMaterial3: true,
  ).copyWith(
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary: AppColors.accentColor,
        ),
  );
}
