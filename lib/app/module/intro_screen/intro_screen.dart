import 'package:flutter/material.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widget/common_button.dart';
import '../../common_widget/rti_background_screen.dart';
import '../../common_widget/rti_header_widget.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: RtiBackgroundScreen(child: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const RtiHeaderWidget(),
              Image.asset("assets/images/user_rti_image.png"),
              Text("Right To Information - RTI ACT",style: TextStyles(context).googlePoppinsFontsForText(fontSize: 18,fontWeight: FontWeight.w700,color: const Color(0xFF000000)),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: SizedBox(
                  height: 173,
                    child: Text("RTI means Right to Information and under Article 19(1) of the Constitution it has been given the post of Fundamental Right.An applicant who desires to obtain any information under the RTI Act can make a request through this Web Portal to the Departments/Public-Authorities/Others of Government of Telangana.",style: TextStyles(context).googlePoppinsFontsForText(fontSize: 13,fontWeight: FontWeight.w400,color: const Color.fromRGBO(0, 0, 0, 0.8)),textAlign: TextAlign.center,)),
              ),
              CommonButton(
                padding: const EdgeInsets.only(left: 16, right: 16),
                buttonText: "Get Started",
                onTap: () {
                  Navigator.pushNamed(context, "/registerScreen");
                  // NavigationServices(context).gotoTabScreen();
                },
              ),
              SizedBox(
                height: size.height*0.03,
              )
            ],
          ),


        ],),
      ),
    );
  }
}
