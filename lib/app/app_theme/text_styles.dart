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



  TextStyle googlePoppinsFontsForText({double? fontSize, FontWeight? fontWeight,Color? color}) {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSize ?? 20, color: color??const Color(0xFF808080)));
  }

  TextStyle googleRubikFontsForText4({double? fontSize, FontWeight? fontWeight,Color ? color}) {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSize ?? 20, color: const Color(0xFF040415)));
  }

  TextStyle googleRubikFontsForDialog({double? fontSize, FontWeight? fontWeight,Color ? color}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSize ?? 20, color: color?? AppColors.primaryColor));
  }

  TextStyle googleRubikFontsForSecondaryText({double? fontSize, FontWeight? fontWeight,Color ? color}) {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(fontWeight: fontWeight ?? FontWeight.w500, fontSize: fontSize ?? 12, color: const Color(0xFF404040)));
  }

  TextStyle googlePoppinsFontsForButtonText({double? fontSize, FontWeight? fontWeight,Color? color}) {
    return GoogleFonts.poppins(
        textStyle:
            TextStyle(fontWeight: fontWeight ?? FontWeight.w400, fontSize: fontSize ?? 16, color: color?? const Color(0xFFFFFFFF)));
  }
}
