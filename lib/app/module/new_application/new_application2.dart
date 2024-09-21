import 'package:flutter/material.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/header_text.dart';
import '../../common_widget/rti_background_screen.dart';
import '../../common_widget/rti_header_widget.dart';
import '../../common_widget/rti_text_field.dart';

class NewApplication2 extends StatefulWidget {
  const NewApplication2({super.key});

  @override
  State<NewApplication2> createState() => _NewApplication2State();
}

class _NewApplication2State extends State<NewApplication2> {
  @override
  Widget build(BuildContext context) {
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
                    headerText: 'Section C:  Personal Infomation',
                    fontSize: 14,
                    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 18),
                  ),
                ],
              ),
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 5),
                titleText: "Name",
                hintText: "Name",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 5),
                titleText: "Surname",
                hintText: "Surname",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 5),
                titleText: "Email Address",
                hintText: "Email Address",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 5),
                titleText: "Mobile Number",
                hintText: "Mobile Number",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 5),
                titleText: "Gender",
                hintText: "Gender",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 5),
                titleText: "Address",
                hintText: "Address",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderText(
                    headerText: 'Section D:  Particulars Of Information Solicited',
                    fontSize: 14,
                    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 18),
                  ),
                ],
              ),
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 5),
                titleText: "Gender",
                hintText: "Gender",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 5),
                titleText: "Specific details of information required",
                hintText: "Specific details of information required",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              RTITextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 5),
                titleText: "Additional documents (only pdf upto 5 MB)",
                hintText: "Additional documents (only pdf upto 5 MB)",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              CommonButton(
                padding: const EdgeInsets.only(left: 16, right: 16,top: 10),
                buttonText: "Next",
                onTap: () {
                  Navigator.pushNamed(context, "/newApplication3");
                },
              ),
            ],
          ),
        )
      ],),
    );
  }
}
