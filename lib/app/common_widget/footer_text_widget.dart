import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class FooterTextWidget extends StatelessWidget {
  final String? text;
  final String? highlightedText;
  final VoidCallback onTap;
  const FooterTextWidget({super.key, this.text, this.highlightedText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: text ?? "Already Have An Account? ",
        style: TextStyles(context)
            .googlePoppinsFontsForText(fontSize: 16, fontWeight: FontWeight.w400, color: const Color.fromRGBO(0, 0, 0, 0.8)),
        children: <InlineSpan>[
          TextSpan(
              text: highlightedText ?? "Sign In",
              style: TextStyles(context).googlePoppinsFontsForText(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.blue),
              recognizer: TapGestureRecognizer()..onTap = onTap)
        ]));
  }
}
