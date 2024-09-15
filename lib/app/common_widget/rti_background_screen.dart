import 'package:flutter/material.dart';

import '../app_theme/app_colors.dart';

class RtiBackgroundScreen extends StatelessWidget {
  final List<Widget> child;
  const RtiBackgroundScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: AppColors.scaffoldBackgroundColor,
                ),
              ),
              Image.asset(
                'assets/images/blur_bg.png',
                height: size.height * 0.13,
              ),
            ],
          ),
          ...child
        ],
      ),
    );
  }
}
