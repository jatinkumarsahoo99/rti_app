import 'package:flutter/material.dart';
import 'package:rti_telangana/app/common_widget/app_background_screen.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widget/common_button.dart';
import '../../common_widget/app_header_widget.dart';
import '../../common_widget/app_text_field.dart';
import '../../data/app_constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackgroundScreen(child: [
        SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              const AppHeaderWidget(),
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
              AppTextField(
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
                  Navigator.pushNamed(context, "/findRtiApplicationStatus");
                },
              ),
            ],
          ),
        )
      ],),
    );
  }
}
