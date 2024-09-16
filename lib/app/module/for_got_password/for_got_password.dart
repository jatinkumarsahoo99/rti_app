import 'package:flutter/material.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widget/common_button.dart';
import '../../common_widget/rti_background_screen.dart';
import '../../common_widget/rti_header_widget.dart';
import '../../common_widget/rti_text_field.dart';
import '../../data/app_constant.dart';

class ForGotPassword extends StatefulWidget {
  const ForGotPassword({super.key});

  @override
  State<ForGotPassword> createState() => _ForGotPasswordState();
}

class _ForGotPasswordState extends State<ForGotPassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RtiBackgroundScreen(child: [
        SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              const RtiHeaderWidget(),
              SizedBox(
                height: size.height*0.1,
              ),
              Text("Find my Account",style: TextStyles(context).googlePoppinsFontsForText(fontSize: 18,fontWeight: FontWeight.w700,color: const Color(0xFF000000)),),
              SizedBox(
                height: AppConstant.heightBetweenWidget,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 85.0),
                child: SizedBox(
                    child: Text("RTI Platform help citizens to file your RTI Application digitally.",style: TextStyles(context).googlePoppinsFontsForText(fontSize: 13,fontWeight: FontWeight.w400,color: const Color.fromRGBO(0, 0, 0, 0.8)),textAlign: TextAlign.center,)),
              ),
              SizedBox(
                height: AppConstant.heightBetweenWidget+40,
              ),
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 16, right: 16),
                titleText: "Enter your email",
                hintText: "Enter your email",
                keyboardType: TextInputType.name,
                radius: 100,
                onChanged: (String txt) {},
              ),
              SizedBox(
                height: AppConstant.heightBetweenWidget+40,
              ),
              CommonButton(
                padding: const EdgeInsets.only(left: 16, right: 16),
                buttonText: "Password Reset",
                onTap: () {
                  Navigator.pushNamed(context, "/rtiApplicationStatus");
                },
              ),
            ],
          ),
        )
      ],),
    );
  }
}
