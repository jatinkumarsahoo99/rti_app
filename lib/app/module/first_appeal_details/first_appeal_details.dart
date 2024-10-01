import 'package:flutter/material.dart';
import 'package:rti_telangana/app/common_widget/app_background_screen.dart';
import 'package:rti_telangana/app/common_widget/common_button.dart';
import 'package:rti_telangana/app/common_widget/card_info_view.dart';
import 'package:rti_telangana/app/common_widget/app_header_widget.dart';

import '../../data/app_constant.dart';
import '../../data/app_string_resource.dart';
import '../../data/model/FirstAppealDetails.dart';

class FirstAppealDetails extends StatefulWidget {
  const FirstAppealDetails({super.key});

  @override
  State<FirstAppealDetails> createState() {
    return _FirstAppealDetails();
  }
}

class _FirstAppealDetails extends State<FirstAppealDetails> {
  FirstAppealDetailsInfo firstAppealDetailsInfo = FirstAppealDetailsInfo(
      firstAppealRegistrationNo: "TSRTI/APP/HOM/30/12/23/HO/4027",
      firstName: "Raju",
      lastName: "Singh",
      department: "Crime Branch CID",
      applicationStatus: "Processing",
      applicationStatusUpdated: "10/08/2024");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackgroundScreen(
        child: [
          Column(
            children: [
              const AppHeaderWidget(),
              CardInfoView(data: firstAppealDetailsInfo.toMap()),
              SizedBox(height: AppConstant.heightBetweenWidget),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonButton(
                      padding: const EdgeInsets.only(left: 20),
                      buttonText: AppString.print,
                      height: 46,
                      width: size.width * 0.38,
                      onTap: () {},
                    ),
                    CommonButton(
                      padding: const EdgeInsets.only(right: 20),
                      buttonText: AppString.returnHome,
                      height: 46,
                      width: size.width * 0.38,
                      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.58),
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
