import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class HeaderText extends StatelessWidget {
  final String headerText;
  final double? fontSize;
  final EdgeInsets? padding;
  const HeaderText({super.key, required this.headerText, this.fontSize, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding??const EdgeInsets.symmetric(vertical: 7.0,horizontal: 0),
      child: Text(
        headerText,
        style: TextStyles(context)
            .googlePoppinsFontsForButtonText(color: const Color(0xFF000000), fontWeight: FontWeight.w700, fontSize: fontSize ?? 11),
      ),
    );
  }
}

class RTIDynamicTextSizeWidget extends StatelessWidget {
  final String text;
  final double minFontSize;
  final double maxFontSize;

  const RTIDynamicTextSizeWidget({
    super.key,
    required this.text,
    required this.minFontSize,
    required this.maxFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double availableWidth = constraints.maxWidth;
        double fontSize = maxFontSize;

        if (availableWidth < text.length * maxFontSize) {
          fontSize = availableWidth / text.length;
          if (fontSize < minFontSize) {
            fontSize = minFontSize;
          }
        }

        return Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: fontSize),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}
