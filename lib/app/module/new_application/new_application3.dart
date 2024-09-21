import 'package:flutter/material.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/header_text.dart';
import '../../common_widget/normal_text.dart';
import '../../common_widget/rti_background_screen.dart';
import '../../common_widget/rti_header_widget.dart';
import '../../common_widget/rti_text_field.dart';

class NewApplication3 extends StatefulWidget {
  const NewApplication3({super.key});

  @override
  State<NewApplication3> createState() => _NewApplication3State();
}

class _NewApplication3State extends State<NewApplication3> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RtiBackgroundScreen(child: [
        SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              const RtiHeaderWidget(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderText(
                    headerText: 'Section E:  Declaration',
                    fontSize: 14,
                    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 18),
                  ),
                ],
              ),
              const NormalText(normalString: "By submitting this application form, I accept and understand that any personal information submitted by me, is to the best of my knowledge both true and correct, and that I understand that any false or inaccurate information or documentation submitted may render the application inadmissable and I may be subject to legal action.",
                fontSize: 12,fontWeight: FontWeight.w400,padding: EdgeInsets.symmetric(vertical: 4,horizontal: 18),),
             SizedBox(
               height: 10,
             ),
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 10),
                titleText: "Security Code",
                hintText: "Security Code",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 10),
                titleText: "OTP Code",
                hintText: "OTP Code",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonButton(
                    padding: const EdgeInsets.only(left: 16, right: 16,top: 10),
                    buttonText: "Send OTP",
                    textFontSize: 14,
                    fontWeight: FontWeight.w600,
                    width: size.width*0.26,
                    height: 40,

                    onTap: () {
                      Navigator.pushNamed(context, "/newApplication3");
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonButton(
                    padding: const EdgeInsets.only(left: 16, right: 16,top: 10),
                    buttonText: "Submit",
                    textFontSize: 14,
                    fontWeight: FontWeight.w600,
                    width: size.width*0.26,
                    height: 40,
                    onTap: () {
                      Navigator.pushNamed(context, "/newApplication3");
                    },
                  ),
                  CommonButton(
                    padding: const EdgeInsets.only(left: 16, right: 16,top: 10),
                    buttonText: "Cancel",
                    textFontSize: 14,
                    fontWeight: FontWeight.w600,
                    width: size.width*0.26,
                    height: 40,
                    backgroundColor:const Color.fromRGBO(0, 0, 0, 0.58) ,
                    onTap: () {
                      Navigator.pushNamed(context, "/newApplication3");
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ],),
    );
  }
}
