import 'package:flutter/material.dart';

class AppHeaderWidget extends StatelessWidget {
  final double? height;
  final double? imageOneWidth;
  final double? imageTwoWidth;
  const AppHeaderWidget({super.key, this.height, this.imageOneWidth, this.imageTwoWidth});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 3),
      child: SizedBox(
        height:height?? size.height*0.2 ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/logo.png",width:imageOneWidth?? size.width*0.5,),
            Image.asset("assets/images/got_logo.png",width: imageTwoWidth??size.width*0.25,),
          ],
        ),
      ),
    );
  }
}
