import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class NormalText extends StatelessWidget {
  final String normalString;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  const NormalText({super.key, required this.normalString, this.fontSize, this.fontWeight, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 0),
      child: Text(
        normalString,
        maxLines: 3,
        style: TextStyles(context)
            .googlePoppinsFontsForButtonText(color:textColor?? const Color(0xFF000000), fontWeight:fontWeight?? FontWeight.w700, fontSize: fontSize ?? 11),
      ),
    );
  }
}
