import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_theme.dart';

class TextStyles {
  late final BuildContext context;

  TextStyles(this.context);

  TextStyle getTitleStyle() {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 24,
          color: AppTheme.primaryTextColor,
        );
  }

  TextStyle getDescriptionStyle() {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: AppTheme.secondaryTextColor,
        );
  }

  TextStyle getRegularStyle() {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 16,
          color: AppTheme.primaryTextColor,
        );
  }

  TextStyle getBoldStyle() {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 14,
          color: AppTheme.primaryTextColor,
        );
  }

  TextStyle googleRubikFontsForHeading({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSize ?? 20, color: const Color(0xFF202020)));
  }

  TextStyle googleRubikFontsForHeading2({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSize ?? 20, color: const Color(0xFF515E66)));
  }

  TextStyle googlePoppinsFontsForText({double? fontSize, FontWeight? fontWeight,Color? color}) {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSize ?? 20, color: color??const Color(0xFF808080)));
  }

  TextStyle googleRubikFontsForText4({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSize ?? 20, color: const Color(0xFF040415)));
  }

  TextStyle googleRubikFontsForDialog({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSize ?? 20, color: AppColors.primaryColor));
  }

  TextStyle googleRubikFontsForSecondaryText({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(fontWeight: fontWeight ?? FontWeight.w500, fontSize: fontSize ?? 12, color: const Color(0xFF404040)));
  }

  TextStyle googleRubikFontsForSecondaryText9({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(fontWeight: fontWeight ?? FontWeight.w500, fontSize: fontSize ?? 12, color: const Color(0xFF000000)));
  }

  TextStyle googlePoppinsFontsForButtonText({double? fontSize, FontWeight? fontWeight,Color? color}) {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(fontWeight: fontWeight ?? FontWeight.w400, fontSize: fontSize ?? 16, color: color?? const Color(0xFFFFFFFF)));
  }

  TextStyle googleRubikFontsForText2({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontSize ?? 16,
            color: const Color(0xFF2CBFD3),
            decoration: TextDecoration.underline,
            decorationColor: const Color(0xFF2CBFD3)));
  }

  TextStyle googleRubikFontsForText3({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontSize ?? 16,
            color: const Color(0xFF2CBFD3),
            decorationColor: const Color(0xFF2CBFD3)));
  }

  TextStyle googleRubikFontsForText5({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontSize ?? 16,
            color: const Color(0xFF43CC7B),
            decorationColor: const Color(0xFF43CC7B)));
  }
}
