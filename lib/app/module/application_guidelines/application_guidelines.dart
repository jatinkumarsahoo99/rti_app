import 'package:flutter/material.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/rti_background_screen.dart';
import '../../common_widget/rti_card_info_view.dart';
import '../../common_widget/rti_header_widget.dart';

class ApplicationGuidelines extends StatefulWidget {
  const ApplicationGuidelines({super.key});
  @override
  State<ApplicationGuidelines> createState() => _ApplicationGuidelinesState();
}

class _ApplicationGuidelinesState extends State<ApplicationGuidelines> {

  Map<String,String> dataMap = {
    "1": "This Web Portal can be used by Indian citizens to file RTI application online and also to make payment for RTI application online. First appeal can also be filed online.",
    "2": "An applicant who desires to obtain any information under the RTI Act can make a request through this Web Portal to the Ministries/Departments of Government of India.",
    "3": "On clicking at 'Submit Request', the applicant has to fill the required details on the page that will appear. The fields marked * are mandatory while the others are optional.",
    "4": "The text of the application may be written at the prescribed column.",
    "5": "At present, the text of an application that can be uploaded at the prescribed column is confined to 3000 characters only.",
    "6": "In case an application contains more than 3000 characters, it can be uploaded as an attachment, by using column 'Supporting document'."
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RtiBackgroundScreen(child: [
        Column(
          children: [
            const RtiHeaderWidget(),
            RtiCardInfoView(data: dataMap,isTitleVisible: false,headerText:"GUIDELINES FOR USE OF RTI ONLINE PORTAL"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonButton(
                  padding: const EdgeInsets.only(left: 0, right: 16,top: 10),
                  buttonText: "Agree",
                  width:size.width*0.2,
                  textFontSize: 8,
                  fontWeight: FontWeight.w600,
                  height: 33,
                  radius: 8,
                  onTap: () {

                  },
                ),
                CommonButton(
                  padding: const EdgeInsets.only(left: 0, right: 30,top: 10),
                  buttonText: "Cancel",
                  width:size.width*0.2,
                  textFontSize: 8,
                  fontWeight: FontWeight.w600,
                  backgroundColor: const Color(0xFFEF3E48),
                  height: 33,
                  radius: 8,
                  onTap: () {
                    // Navigator.pushNamed(context, "/rtiApplicationDetailsStatus");

                  },
                ),
              ],
            )
          ],
        )
      ],),
    );
  }
}
