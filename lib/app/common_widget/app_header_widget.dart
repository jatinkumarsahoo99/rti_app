import 'package:flutter/material.dart';

class AppHeaderWidget extends StatelessWidget {
  const AppHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 3),
      child: SizedBox(
        height:size.height*0.2 ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/logo.png",width: size.width*0.5,),
            Image.asset("assets/images/got_logo.png",width: size.width*0.25,),
          ],
        ),
      ),
    );
  }
}
