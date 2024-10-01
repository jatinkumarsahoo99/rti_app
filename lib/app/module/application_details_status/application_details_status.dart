import 'package:flutter/material.dart';
import 'package:rti_telangana/app/common_widget/app_background_screen.dart';
import 'package:rti_telangana/app/common_widget/card_info_view.dart';
import 'package:rti_telangana/app/common_widget/app_header_widget.dart';

import '../../app_theme/text_styles.dart';
import '../../data/app_string_resource.dart';
import '../../data/model/ApplicationStatusInfo.dart';

class RtiApplicationDetailsStatus extends StatefulWidget {
  const RtiApplicationDetailsStatus({super.key});

  @override
  State<RtiApplicationDetailsStatus> createState() {
    return _RtiApplicationStatus();
  }
}

class _RtiApplicationStatus extends State<RtiApplicationDetailsStatus> {
  ApplicationStatusInfo applicationStatusInfo = ApplicationStatusInfo(
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
                      AppString.applicationDetails,
                      style: TextStyles(context).googlePoppinsFontsForText(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ],
                ),
              ),
              CardInfoView(data: applicationStatusInfo.toMap())
            ],
          ),
        ],
      ),
    );
  }
}
