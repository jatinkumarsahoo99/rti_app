import 'package:flutter/material.dart';
import 'package:rti_telangana/app/app_theme/text_styles.dart';
import 'package:rti_telangana/app/common_widget/app_background_screen.dart';
import 'package:rti_telangana/app/common_widget/common_button.dart';
import 'package:rti_telangana/app/common_widget/app_header_widget.dart';
import 'package:rti_telangana/app/common_widget/app_text_field.dart';
import 'package:rti_telangana/app/data/app_string_resource.dart';

import '../../data/app_constant.dart';

class FindMyFirstAppeal extends StatefulWidget {
  const FindMyFirstAppeal({super.key});

  @override
  State<FindMyFirstAppeal> createState() {
    return _FindMyFirstAppeal();
  }
}

class _FindMyFirstAppeal extends State<FindMyFirstAppeal> {
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
                height: size.height * 0.1,
              ),
              Text(
                AppString.findMyFirstAppeal,
                style: TextStyles(context).googlePoppinsFontsForText(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(0, 0, 0, 1)),
              ),
              SizedBox(
                height: AppConstant.heightBetweenWidget,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 85.0),
                child: SizedBox(
                  child: Text(
                    AppString.rtiPlatform,
                    style: TextStyles(context).googlePoppinsFontsForText(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 0, 0, 0.8)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: AppConstant.heightBetweenWidget + 40,
              ),
              AppTextField(
                controller: TextEditingController(),
                padding: const EdgeInsets.only(left: 16, right: 16),
                titleText: AppString.rtiFirstAppealRegNo,
                hintText: AppString.rtiFirstAppealRegNo,
                keyboardType: TextInputType.text,
                radius: 100,
                onChanged: (String txt) {},
              ),
              SizedBox(
                height: AppConstant.heightBetweenWidget,
              ),
              AppTextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 16, right: 16),
                titleText: AppString.enterMobileNumber,
                hintText: AppString.enterMobileNumber,
                keyboardType: TextInputType.phone,
                radius: 100,
                onChanged: (String txt) {},
              ),
              SizedBox(
                height: AppConstant.heightBetweenWidget + 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonButton(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      buttonText: AppString.search,
                      width: size.width * 0.35,
                      onTap: () {
                        Navigator.pushNamed(context, "/firstAppealStatusDetails");
                      },
                    ),
                    CommonButton(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      buttonText: AppString.reset,
                      width: size.width * 0.35,
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
