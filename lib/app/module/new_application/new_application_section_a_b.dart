import 'package:flutter/material.dart';
import 'package:rti_telangana/app/common_widget/normal_text.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/header_text.dart';
import '../../common_widget/app_background_screen.dart';
import '../../common_widget/app_header_widget.dart';
import '../../common_widget/app_text_field.dart';

class NewApplicationSectionAB extends StatefulWidget {
  const NewApplicationSectionAB({super.key});

  @override
  State<NewApplicationSectionAB> createState() => _NewApplicationSectionABState();
}

class _NewApplicationSectionABState extends State<NewApplicationSectionAB> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundScreen(child: [
        SingleChildScrollView(
          child: Column(
            children: [
              const AppHeaderWidget(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderText(
                    headerText: 'Section A: Public Authority Information',
                    fontSize: 14,
                    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 18),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  elevation: 6,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            NormalText(normalString: "Select Public Authority",fontSize: 12,fontWeight: FontWeight.w400,)
                          ],
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NormalText(normalString: "*** Authority Level",fontSize: 12,fontWeight: FontWeight.w400,padding: EdgeInsets.symmetric(vertical: 4),),
                                NormalText(normalString: "*** Secretariat",fontSize: 12,fontWeight: FontWeight.w400,padding: EdgeInsets.symmetric(vertical: 4)),
                                NormalText(normalString: "*** Hod",fontSize: 12,fontWeight: FontWeight.w400,padding: EdgeInsets.symmetric(vertical: 4)),
                                NormalText(normalString: "*** District",fontSize: 12,fontWeight: FontWeight.w400,padding: EdgeInsets.symmetric(vertical: 4)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NormalText(normalString: "District Level",fontSize: 12,fontWeight: FontWeight.w400,padding: EdgeInsets.symmetric(vertical: 4)),
                                NormalText(normalString: "Revenue Department",fontSize: 12,fontWeight: FontWeight.w400,padding: EdgeInsets.symmetric(vertical: 4)),
                                NormalText(normalString: "Chief comissioner of Land",fontSize: 12,fontWeight: FontWeight.w400,padding: EdgeInsets.symmetric(vertical: 4)),
                                NormalText(normalString: "Jagtial",fontSize: 12,fontWeight: FontWeight.w400,padding: EdgeInsets.symmetric(vertical:4)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderText(
                    headerText: 'Section B: Application Criteria',
                    fontSize: 14,
                    padding: EdgeInsets.symmetric(vertical: 13,horizontal: 18),
                  ),
                ],
              ),
              const Row(
                children: [
                  NormalText(normalString: "Is the Applicant Below Poverty Line ?",fontSize: 12,fontWeight: FontWeight.w400,
                    padding: EdgeInsets.symmetric(vertical: 0,horizontal: 18),)
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Radio<String>(
                      value: 'Yes',
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    const  NormalText(normalString: "Yes",fontSize: 12,fontWeight: FontWeight.w400,
                      padding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),),
                    Radio<String>(
                      value: 'No',
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    const  NormalText(normalString: "No",fontSize: 12,fontWeight: FontWeight.w400,
                      padding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),)
                  ],
                ),
              ),
              AppTextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 5),
                titleText: "Card No",
                hintText: "Card No",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              AppTextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 5),
                titleText: "Year Of Issue",
                hintText: "Year Of Issue",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              AppTextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 5),
                titleText: "Issuing Authority",
                hintText: "Issuing Authority",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),
              AppTextField(
                controller: TextEditingController(),
                // errorText: _errorFName,
                padding: const EdgeInsets.only(left: 25, right: 25),
                titleText: "Supporting document",
                hintText: "Supporting document",
                keyboardType: TextInputType.name,
                height: 40,
                radius: 100,
                onChanged: (String txt) {},
              ),

              CommonButton(
                padding: const EdgeInsets.only(left: 16, right: 16,top: 10),
                buttonText: "Next",
                onTap: () {
                  Navigator.pushNamed(context, "/newApplication2");
                },
              ),


            ],
          ),
        )
      ],),
    );
  }
}
