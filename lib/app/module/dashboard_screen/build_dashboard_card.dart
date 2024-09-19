import 'package:flutter/material.dart';

import '../../app_theme/text_styles.dart';

class BuildDashboardCard extends StatelessWidget {
  final String title;
  final String count;
  final String description;
  const BuildDashboardCard({super.key, required this.title, required this.count, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: const Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  16.0,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles(context)
                  .googlePoppinsFontsForText(fontSize: 12, fontWeight: FontWeight.w400, color: const Color(0xFF000000)),
            ),
            const SizedBox(height: 10),
            Text(
              count,
              style: TextStyles(context)
                  .googlePoppinsFontsForText(fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xFF000000)),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyles(context)
                  .googlePoppinsFontsForText(fontSize: 10, fontWeight: FontWeight.w400, color: const Color(0xFF000000)),
            ),
          ],
        ),
      ),
    );
  }
}
