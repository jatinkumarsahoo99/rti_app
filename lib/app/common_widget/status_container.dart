import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class StatusContainer extends StatelessWidget {
  final Color statusBackgroundColor;
  final Color? statusTextColor;
  final String statusText;
  const StatusContainer({super.key, required this.statusBackgroundColor, required this.statusText, this.statusTextColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: statusBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        statusText,
        style: TextStyles(context)
            .googlePoppinsFontsForButtonText(color: statusTextColor??Colors.black.withOpacity(0.3),fontWeight:FontWeight.w600,fontSize: 10),
      ),
    );
  }
}
