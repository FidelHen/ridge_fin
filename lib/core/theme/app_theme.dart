import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: AppColors.brandColor,
        surface: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      fontFamily: GoogleFonts.inter().fontFamily,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      splashFactory: NoSplash.splashFactory,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.primaryTextColor,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          color: AppColors.primaryTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style:
            ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: AppColors.primaryTextColor,
              backgroundColor: AppColors.brandColor,
              splashFactory: NoSplash.splashFactory,
              overlayColor: AppColors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              textStyle: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ).copyWith(
              elevation: WidgetStateProperty.resolveWith<double>((states) {
                if (states.contains(WidgetState.pressed)) {
                  return 1;
                }
                return 0;
              }),
            ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          overlayColor: AppColors.transparent,
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(splashFactory: NoSplash.splashFactory, overlayColor: AppColors.transparent),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.textFieldBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.brandColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.negative,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.negative,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        hintStyle: GoogleFonts.inter(
          color: AppColors.secondary,
          fontSize: 14,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColors.textFieldBackground,
            width: 1,
          ),
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.brandColor,
        foregroundColor: Colors.white,
        elevation: 2,
        splashColor: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.textFieldBackground,
        thickness: 1,
        space: 1,
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryTextColor,
      ),
    );
  }
}
