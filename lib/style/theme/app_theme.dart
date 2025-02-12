import 'package:flutter/material.dart';
import 'package:restaurant_app/style/colors/colors.dart';
import 'package:restaurant_app/style/typography/app_text_styles.dart';

class AppTheme {
  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      headlineSmall: AppTextStyles.headlineSmall,
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,
      bodyLarge: AppTextStyles.bodyLargeBold,
      bodyMedium: AppTextStyles.bodyLargeMedium,
      bodySmall: AppTextStyles.bodyLargeRegular,
      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium,
      labelSmall: AppTextStyles.labelSmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
        toolbarTextStyle: _textTheme.titleLarge, backgroundColor: Colors.brown);
  }

  static ThemeData get lightTheme {
    return ThemeData(
        colorSchemeSeed: AppColor.brown.color,
        brightness: Brightness.light,
        textTheme: _textTheme,
        useMaterial3: true,
        appBarTheme: _appBarTheme,
        scaffoldBackgroundColor: Colors.brown[100]);
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: AppColor.brown.color,
      brightness: Brightness.dark,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }
}
