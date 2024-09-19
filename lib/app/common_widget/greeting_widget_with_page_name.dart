import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';
import '../utils/core_utility.dart';

class GreetingWidgetWithPageName extends StatelessWidget {
  final String pageName;
  const GreetingWidgetWithPageName({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            pageName,
            style: TextStyles(context)
                .googlePoppinsFontsForText(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF000000)),
          ),
          Text(
            CoreUtility.getGreeting(),
            style: TextStyles(context)
                .googlePoppinsFontsForText(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF000000)),
          )
        ],
      ),
    );
  }
}
