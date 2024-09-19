import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class WelcomeWidget extends StatelessWidget {
  final String nameString;
  const WelcomeWidget({super.key, required this.nameString});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1B75BC),
      height: 46,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              "Welcome $nameString",
              style: TextStyles(context)
                  .googlePoppinsFontsForText(fontSize: 14, fontWeight: FontWeight.w700, color: const Color(0xFFFFFFFF)),
            ),
          ),
        ],
      ),
    );
  }
}
