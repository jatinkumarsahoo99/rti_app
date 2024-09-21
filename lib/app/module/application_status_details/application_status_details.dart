import 'package:flutter/material.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widget/rti_background_screen.dart';
import '../../common_widget/rti_card_info_view.dart';
import '../../common_widget/rti_header_widget.dart';
import '../../data/app_string_resource.dart';
import '../../data/model/ApplicationStatusInfo.dart';
import '../../data/model/NewApplicationStatusInfo.dart';

class NewApplicationDetails extends StatefulWidget {
  const NewApplicationDetails({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewApplicationDetails();
  }
}

class _NewApplicationDetails extends State<NewApplicationDetails> {
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
      body: RtiBackgroundScreen(
        child: [
          Column(
            children: [
              const RtiHeaderWidget(),
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
              RtiCardInfoView(data: applicationStatusInfo.toMap())
            ],
          ),
        ],
      ),
    );
  }
}
