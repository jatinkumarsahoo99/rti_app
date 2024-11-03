import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class WelcomeWidget extends StatelessWidget {
  final String nameString;
  final VoidCallback? drawerCallBack;
  const WelcomeWidget({super.key, required this.nameString,this.drawerCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1B75BC),
      height: 46,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (drawerCallBack !=null)?  GestureDetector(
            onTap: (){
              drawerCallBack?.call();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                width: 35.0, // Radius * 2
                height: 35.0, // Radius * 2
                decoration:  const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://i.pngimg.me/thumb/f/720/c3f2c592f9.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ):Container(),
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
