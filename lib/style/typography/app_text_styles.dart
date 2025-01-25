import 'package:flutter/widgets.dart';

class AppTextStyles {
  static const TextStyle _primary = TextStyle(
    fontFamily: 'Raleway'
  );

  static const TextStyle _secondary = TextStyle(
    fontFamily: 'Cabin'
  );

  /// displayLarge
  static TextStyle displayLarge = _primary.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    height: 1.11,
  );

  /// displayMedium
  static TextStyle displayMedium = _primary.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.w600,
    height: 1.17,
  );

  /// displaySmall
  static TextStyle displaySmall = _primary.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    height: 1.25,
  );

  /// headlineLarge
  static TextStyle headlineLarge = _primary.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  /// headlineMedium
  static TextStyle headlineMedium = _primary.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  /// headlineMedium
  static TextStyle headlineSmall = _primary.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.0,
  );

  /// titleLarge
  static TextStyle titleLarge = _secondary.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 1.2,

  );

  /// titleMedium
  static TextStyle titleMedium = _secondary.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.2,

  );

  /// titleSmall
  static TextStyle titleSmall = _secondary.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.2,

  );

  /// bodyLargeBold
  static TextStyle bodyLargeBold = _secondary.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.56,
  );

  /// bodyLargeMedium
  static TextStyle bodyLargeMedium = _secondary.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.56,
  );

  /// bodyLargeRegular
  static TextStyle bodyLargeRegular = _secondary.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    height: 1.56,
  );

  /// labelLarge
  static TextStyle labelLarge = _secondary.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.71,

  );

  /// labelMedium
  static TextStyle labelMedium = _secondary.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    height: 1.4,

  );

  /// labelSmall
  static TextStyle labelSmall = _secondary.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w100,
    height: 1.2,

  );
}