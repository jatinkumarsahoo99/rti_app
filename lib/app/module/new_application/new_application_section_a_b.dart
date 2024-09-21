import 'package:flutter/material.dart';
import 'package:rti_telangana/app/common_widget/rti_background_screen.dart';
import 'package:rti_telangana/app/common_widget/rti_header_widget.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widget/rti_text_field.dart';
import '../../data/app_constant.dart';
import '../../data/app_string_resource.dart';

class NewApplicationSectionAB extends StatefulWidget {
  const NewApplicationSectionAB({super.key});

  @override
  State<NewApplicationSectionAB> createState() =>
      _NewApplicationSectionABState();
}

class _NewApplicationSectionABState extends State<NewApplicationSectionAB> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RtiBackgroundScreen(
        child: [
          Column(
            children: [
              const RtiHeaderWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 200), // Adjusted bottom padding to 200 dp
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppString.sectionAPublicAuthorityInformation,
                                style: TextStyles(context).googlePoppinsFontsForText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                            child: SizedBox(
                              width: size.width * 0.82,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppString.selectPublicAuthority,
                                    style: TextStyles(context).googlePoppinsFontsForText(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      buildRow(
                                        context,
                                        AppString.authorityLevel,
                                        "District Level",
                                      ),
                                      const SizedBox(height: 20),
                                      buildRow(
                                        context,
                                        AppString.secretariat,
                                        "Revenue Department",
                                      ),
                                      const SizedBox(height: 20),
                                      buildRow(
                                        context,
                                        AppString.hod,
                                        "Chief commissioner of Land",
                                      ),
                                      const SizedBox(height: 20),
                                      buildRow(
                                        context,
                                        AppString.district,
                                        "Jagtial",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    AppString.sectionBApplicationCriteria,
                                    style: TextStyles(context).googlePoppinsFontsForText(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 1), // Left margin of 100
                                    child: Text(
                                      AppString.isTheApplicantBelowPovertyLine,
                                      style: TextStyles(context).googlePoppinsFontsForText(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20), // Left margin of 100 for "Yes"
                                    child: Text(
                                      AppString.yes,
                                      style: TextStyles(context).googlePoppinsFontsForText(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20), // Space between "Yes" and "No"
                                  Padding(
                                    padding: const EdgeInsets.only(left: 80), // Left margin of 100 for "No"
                                    child: Text(
                                      AppString.no,
                                      style: TextStyles(context).googlePoppinsFontsForText(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(0, 0, 0, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                                child: Column(
                                  children: [
                                    RTITextField(
                                      controller: TextEditingController(),
                                      padding: const EdgeInsets.only(left: 16, right: 16),
                                      titleText: AppString.cardNo,
                                      hintText: AppString.cardNo,
                                      keyboardType: TextInputType.text,
                                      radius: 100,
                                      onChanged: (String txt) {},
                                    ),
                                    SizedBox(height: AppConstant.heightBetweenWidget),
                                    RTITextField(
                                      controller: TextEditingController(),
                                      padding: const EdgeInsets.only(left: 16, right: 16),
                                      titleText: AppString.yearOfIssue,
                                      hintText: AppString.yearOfIssue,
                                      keyboardType: TextInputType.number,
                                      radius: 100,
                                      onChanged: (String txt) {},
                                    ),
                                    SizedBox(height: AppConstant.heightBetweenWidget),
                                    RTITextField(
                                      controller: TextEditingController(),
                                      padding: const EdgeInsets.only(left: 16, right: 16),
                                      titleText: AppString.issuingAuthority,
                                      hintText: AppString.issuingAuthority,
                                      keyboardType: TextInputType.name,
                                      radius: 100,
                                      onChanged: (String txt) {},
                                    ),
                                    SizedBox(height: AppConstant.heightBetweenWidget),
                                    RTITextField(
                                      controller: TextEditingController(),
                                      padding: const EdgeInsets.only(left: 16, right: 16),
                                      titleText: AppString.supportingDocument,
                                      hintText: AppString.supportingDocument,
                                      keyboardType: TextInputType.name,
                                      radius: 100,
                                      onChanged: (String txt) {},
                                    ),
                                    SizedBox(height: AppConstant.heightBetweenWidget),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 200), // Added bottom margin here
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function to build a row with left and right texts
  Widget buildRow(BuildContext context, String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            leftText,
            style: TextStyles(context).googlePoppinsFontsForText(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            rightText,
            style: TextStyles(context).googlePoppinsFontsForText(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
        ),
      ],
    );
  }
}
