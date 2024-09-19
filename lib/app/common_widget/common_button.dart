import 'package:flutter/material.dart';
import 'package:rti_telangana/app/common_widget/tap_effect.dart';

import '../app_theme/text_styles.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final String? buttonText;
  final Widget? buttonTextWidget;
  final Color? textColor, backgroundColor;
  final bool? isClickable;
  final double radius;
  final double? height;
  final double? textFontSize;
  final FontWeight? fontWeight;
  final double? width;
  final bool isIcon;
  final IconData? icon;
  const CommonButton(
      {super.key,
      this.onTap,
      this.buttonText,
      this.buttonTextWidget,
      this.textColor = Colors.white,
      this.backgroundColor,
      this.padding,
      this.isClickable = true,
      this.radius = 8,
      this.height = 60,
      this.width,
      this.icon = Icons.arrow_forward,
      this.isIcon = false, this.textFontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: TapEffect(
        isClickable: isClickable!,
        onClick: onTap ?? () {},
        child: SizedBox(
          height: height ?? 60,
          width: width,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            color: backgroundColor ?? Theme.of(context).primaryColor,
            shadowColor: Colors.black12.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.2,
            ),
            child: (isIcon)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buttonTextWidget ??
                          Text(
                            buttonText ?? "",
                            style: TextStyles(context)
                                .googlePoppinsFontsForButtonText(color: textColor??Colors.black,fontWeight: fontWeight??FontWeight.w600,fontSize:textFontSize?? 18),
                          ),
                      Icon(
                        icon,
                        color: Colors.white,
                        size: 15,
                      )
                    ],
                  )
                : Center(
                    child: buttonTextWidget ??
                        Text(
                          buttonText ?? "",
                          style: TextStyles(context).googlePoppinsFontsForButtonText(color: textColor??Colors.black,fontWeight:fontWeight?? FontWeight.w600,fontSize: textFontSize??18),
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}
