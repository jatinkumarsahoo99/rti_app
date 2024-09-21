import 'package:flutter/material.dart';
import 'package:rti_telangana/app/common_widget/rti_background_screen.dart';
import 'package:rti_telangana/app/common_widget/rti_header_widget.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widget/rti_text_field.dart';
import '../../data/app_constant.dart';
import '../../data/app_string_resource.dart';

class NewApplicationSectionCD extends StatefulWidget {
  const NewApplicationSectionCD({super.key});

  @override
  State<NewApplicationSectionCD> createState() => _NewApplicationSectionCDState();
}

class _NewApplicationSectionCDState extends State<NewApplicationSectionCD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RtiBackgroundScreen(
        child: [Column(
          children: [
            const RtiHeaderWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 200),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppString.sectionCPersonalInformation,
                              style: TextStyles(context).googlePoppinsFontsForText(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            SizedBox(height: AppConstant.heightBetweenWidget),
                            // Personal Information Fields
                            RTITextField(
                              controller: TextEditingController(),
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              titleText: AppString.name,
                              hintText: AppString.name,
                              keyboardType: TextInputType.name,
                              radius: 100,
                              onChanged: (String txt) {},
                            ),
                            SizedBox(height: AppConstant.heightBetweenWidget),
                            RTITextField(
                              controller: TextEditingController(),
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              titleText: AppString.surname,
                              hintText: AppString.surname,
                              keyboardType: TextInputType.name,
                              radius: 100,
                              onChanged: (String txt) {},
                            ),
                            SizedBox(height: AppConstant.heightBetweenWidget),
                            RTITextField(
                              controller: TextEditingController(),
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              titleText: AppString.emailAddress,
                              hintText: AppString.emailAddress,
                              keyboardType: TextInputType.emailAddress,
                              radius: 100,
                              onChanged: (String txt) {},
                            ),
                            SizedBox(height: AppConstant.heightBetweenWidget),
                            RTITextField(
                              controller: TextEditingController(),
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              titleText: AppString.mobileNumber,
                              hintText: AppString.mobileNumber,
                              keyboardType: TextInputType.number,
                              radius: 100,
                              onChanged: (String txt) {},
                            ),
                            SizedBox(height: AppConstant.heightBetweenWidget),
                            RTITextField(
                              controller: TextEditingController(),
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              titleText: AppString.gender,
                              hintText: AppString.gender,
                              keyboardType: TextInputType.name,
                              radius: 100,
                              onChanged: (String txt) {},
                            ),
                            SizedBox(height: AppConstant.heightBetweenWidget),
                            RTITextField(
                              controller: TextEditingController(),
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              titleText: AppString.address,
                              hintText: AppString.address,
                              keyboardType: TextInputType.text,
                              radius: 100,
                              onChanged: (String txt) {},
                            ),
                            SizedBox(height: AppConstant.heightBetweenWidget + 15),
                            Text(
                              AppString.sectionDParticularsOfInformationSolicited,
                              style: TextStyles(context).googlePoppinsFontsForText(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            SizedBox(height: AppConstant.heightBetweenWidget),
                            RTITextField(
                              controller: TextEditingController(),
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              titleText: AppString.gender,
                              hintText: AppString.gender,
                              keyboardType: TextInputType.name,
                              radius: 100,
                              onChanged: (String txt) {},
                            ),
                            SizedBox(height: AppConstant.heightBetweenWidget),
                            RTITextField(
                              controller: TextEditingController(),
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              titleText: AppString.specificDetailsOfInformationRequired,
                              hintText: AppString.specificDetailsOfInformationRequired,
                              keyboardType: TextInputType.text,
                              radius: 100,
                              onChanged: (String txt) {},
                            ),
                            SizedBox(height: AppConstant.heightBetweenWidget),
                            RTITextField(
                              controller: TextEditingController(),
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              titleText: AppString.additionalDocuments,
                              hintText: AppString.additionalDocuments,
                              keyboardType: TextInputType.name,
                              radius: 100,
                              onChanged: (String txt) {},
                            ),
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
