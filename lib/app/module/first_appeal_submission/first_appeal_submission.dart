import 'package:flutter/material.dart';
import 'package:rti_telangana/app/common_widget/rti_background_screen.dart';
import 'package:rti_telangana/app/common_widget/rti_header_widget.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widget/common_button.dart';
import '../../common_widget/header_text.dart';
import '../../common_widget/rti_text_field.dart';
import '../../data/app_constant.dart';
import '../../data/app_string_resource.dart';

class FirstAppealSubmission extends StatefulWidget {
  const FirstAppealSubmission({super.key});

  @override
  State<FirstAppealSubmission> createState() =>
      _FirstAppealSubmission();
}

class _FirstAppealSubmission extends State<FirstAppealSubmission> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RtiBackgroundScreen(child: [
        Column(
          children: [
            const RtiHeaderWidget(),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          HeaderText(
                            headerText: 'First Appeal',
                            fontSize: 14,
                          ),
                        ],
                      ),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          HeaderText(
                            headerText: 'Section E: Declaration',
                            fontSize: 14,
                          ),
                        ],
                      ),

                      RTITextField(
                        controller: TextEditingController(),
                        padding:
                        const EdgeInsets.only(left: 0, right: 0,bottom: 6),
                        titleText: AppString.applicationStatus,
                        hintText: AppString.applicationStatus,
                        keyboardType: TextInputType.text,
                        radius: 100,
                        onChanged: (String txt) {},
                      ),
                      RTITextField(
                        controller: TextEditingController(),
                        padding:
                        const EdgeInsets.only(left: 0, right: 0,bottom: 6),
                        titleText: AppString.firstAppealDescription,
                        hintText: AppString.firstAppealDescription,
                        keyboardType: TextInputType.text,
                        radius: 100,
                        onChanged: (String txt) {},
                      ),
                      RTITextField(
                        controller: TextEditingController(),
                        padding:
                        const EdgeInsets.only(left: 0, right: 0,bottom: 15),
                        titleText: AppString.additionalDocuments,
                        hintText: AppString.additionalDocuments,
                        keyboardType: TextInputType.text,
                        radius: 100,
                        onChanged: (String txt) {},
                      ),






                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.sectionBDeclaration,
                            style:
                                TextStyles(context).googlePoppinsFontsForText(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            AppString.submittingClause,
                            style:
                                TextStyles(context).googlePoppinsFontsForText(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          SizedBox(
                              height: AppConstant.heightBetweenWidget + 10),
                          RTITextField(
                            controller: TextEditingController(),
                            padding:
                                const EdgeInsets.only(left: 0, right: 0),
                            titleText: AppString.securityCode,
                            hintText: AppString.securityCode,
                            keyboardType: TextInputType.text,
                            radius: 100,
                            onChanged: (String txt) {},
                          ),
                          SizedBox(height: AppConstant.heightBetweenWidget),
                          RTITextField(
                            controller: TextEditingController(),
                            padding:
                                const EdgeInsets.only(left: 0, right: 0),
                            titleText: AppString.otpCode,
                            hintText: AppString.otpCode,
                            keyboardType: TextInputType.number,
                            radius: 100,
                            onChanged: (String txt) {},
                          ),
                          SizedBox(
                              height: AppConstant.heightBetweenWidget),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CommonButton(
                                padding: const EdgeInsets.only(left: 16,right: 16),
                                buttonText: AppString.sendOTP,
                                height: 46,
                                width: size.width * 0.30,
                                onTap: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                              height: AppConstant.heightBetweenWidget),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                CommonButton(
                                  padding: const EdgeInsets.only(left: 20),
                                  buttonText: AppString.submit,
                                  height: 46,
                                  width: size.width * 0.30,
                                  onTap: () {},
                                ),
                                CommonButton(
                                  padding: const EdgeInsets.only(right: 20),
                                  buttonText: AppString.cancel,
                                  height: 46,
                                  width: size.width * 0.30,
                                  backgroundColor:
                                      const Color.fromRGBO(0, 0, 0, 0.58),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
