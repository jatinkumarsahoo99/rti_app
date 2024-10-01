import 'package:flutter/material.dart';

import '../app_theme/app_colors.dart';
import '../app_theme/text_styles.dart';

class AppTextField extends StatelessWidget {
  final String? titleText;
  final int? maxLength;
  final String hintText;
  final String? errorText;
  final bool isObscureText, isAllowTopTitleView;
  final bool? enable;
  final bool? readOnly;
  final EdgeInsetsGeometry padding;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final double? pad;
  final double? height;
  final double? radius;
  final BuildContext? contextNew;

  const AppTextField(
      {super.key,
      this.hintText = '',
      this.isObscureText = false,
      this.padding = const EdgeInsets.only(bottom: 0, right: 0, top: 0, left: 0),
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.isAllowTopTitleView = true,
      this.errorText,
      this.titleText = '',
      this.controller,
      this.maxLength,
      this.pad = 16,
      this.radius = 10,
      this.contextNew,
      this.height = 50,
      this.enable = true,
      this.readOnly = false,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: height ?? 80,
        child: Center(
          child: TextField(
            controller: controller,
            maxLines: null,
            readOnly: readOnly??false,
            enabled: enable,
            onChanged: onChanged,
            maxLength: maxLength ?? 50,
            expands: true,
            style: TextStyles(context).googlePoppinsFontsForText(fontWeight: FontWeight.w400, fontSize: 13,color: const Color.fromRGBO(0, 0, 0, 0.8)),
            obscureText: isObscureText,
            cursorColor: Theme.of(context).primaryColor,
            textAlign:TextAlign.left ,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                errorText: null,
                counterText: "",
                // isDense: true,
                // suffixIcon:  Icon(Icons.calendar_month,color: AppColors.primaryColor,),
                // border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyles(context).googlePoppinsFontsForText(fontWeight: FontWeight.w400, fontSize: 13,color: const Color.fromRGBO(0, 0, 0, 0.8)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius ?? 100),
                    borderSide: const BorderSide(color: Color(0xFFF4F6F9), width: 0.04)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius ?? 100),
                    borderSide: const BorderSide(color: Color(0xFFF4F6F9), width: 0.04)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius ?? 100),
                    borderSide: const BorderSide(color: Color(0xFFF4F6F9), width: 0.04)),
                fillColor: AppColors.whiteColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                filled: true),
            keyboardType: keyboardType,
          ),
        ),
      ),
    );
  }
}
