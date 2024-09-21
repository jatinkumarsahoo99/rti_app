import 'package:flutter/material.dart';
import 'package:rti_telangana/app/common_widget/rti_background_screen.dart';
import 'package:rti_telangana/app/common_widget/rti_header_widget.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widget/common_button.dart';
import '../../common_widget/rti_text_field.dart';
import '../../data/app_constant.dart';
import '../../data/app_string_resource.dart';

class NewApplicationSectionE extends StatefulWidget {
  const NewApplicationSectionE({super.key});

  @override
  State<NewApplicationSectionE> createState() =>
      _NewApplicationSectionCDState();
}

class _NewApplicationSectionCDState extends State<NewApplicationSectionE> {
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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 200),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppString.sectionEDeclaration,
                              style:
                                  TextStyles(context).googlePoppinsFontsForText(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            SizedBox(height: AppConstant.heightBetweenWidget),
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
                                  const EdgeInsets.only(left: 16, right: 16),
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
                                  const EdgeInsets.only(left: 16, right: 16),
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
                                  width: size.width * 0.35,
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
