import 'package:flutter/material.dart';
import 'package:rti_telangana/app/common_widget/app_background_screen.dart';
import 'package:rti_telangana/app/common_widget/card_info_view.dart';
import 'package:rti_telangana/app/common_widget/app_header_widget.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widget/common_button.dart';
import '../../data/app_string_resource.dart';
import '../../data/model/AppealStatusInfo.dart';

class FirstAppealStatusDetails extends StatefulWidget {
  const FirstAppealStatusDetails({super.key});

  @override
  State<FirstAppealStatusDetails> createState() {
    return _FirstAppealStatusDetails();
  }
}

class _FirstAppealStatusDetails extends State<FirstAppealStatusDetails> {
  FirstAppealStatusInfo appealStatusInfo = FirstAppealStatusInfo(
      registrationNo: "TSRTI/APP/HOM/30/12/23/HO/4027",
      firstName: "Raju",
      lastName: "Singh",
      department: "Crime Branch CID",
      applicationStatus: "Processing",
      applicationStatusUpdated: "10/08/2024",
      applicationFiledDate: "2 Days");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundScreen(
        child: [
          Column(
            children: [
              const AppHeaderWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppString.firstAppealDetails,
                      style: TextStyles(context).googlePoppinsFontsForText(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ],
                ),
              ),
              CardInfoView(data: appealStatusInfo.toMap()),

              CommonButton(
                padding: const EdgeInsets.only(left: 16, right: 16,top: 20),
                buttonText: "Next",
                // width: size.width * 0.35,
                // backgroundColor: const Color.fromRGBO(0, 0, 0, 0.58),
                onTap: () {
                  Navigator.pushNamed(context, "/applicationGuidelines");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
