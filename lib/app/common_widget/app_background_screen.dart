import 'package:flutter/material.dart';

import '../app_theme/app_colors.dart';

class AppBackgroundScreen extends StatelessWidget {
  final List<Widget> child;
  final bool isTopImageVisible;
  const AppBackgroundScreen({super.key, required this.child, this.isTopImageVisible = false});

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
                  child: isTopImageVisible
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.077,
                            ),
                            Image.asset(
                              'assets/images/blur_bg.png',
                              height: size.height * 0.13,
                            ),
                          ],
                        )
                      : null,
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
