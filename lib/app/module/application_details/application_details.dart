import 'package:flutter/material.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/file_image_widget.dart';
import '../../common_widget/greeting_widget_with_page_name.dart';
import '../../common_widget/header_text.dart';
import '../../common_widget/normal_text.dart';
import '../../common_widget/app_background_screen.dart';
import '../../common_widget/app_header_widget.dart';
import '../../common_widget/status_container.dart';
import '../../common_widget/welcome_widget.dart';

class ApplicationDetails extends StatefulWidget {
  const ApplicationDetails({super.key});

  @override
  State<ApplicationDetails> createState() => _ApplicationDetailsState();
}

class _ApplicationDetailsState extends State<ApplicationDetails> {
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> statusLogList = [
    {'statusUpdated': '2023-09-19', 'applicationStatus': 'Processing', 'updatedBy': 'Jatin',"color":const Color.fromRGBO(137, 131, 71, 0.85)},
    {'statusUpdated': '2023-09-20', 'applicationStatus': 'Rejected', 'updatedBy': 'Kumar',"color":const Color.fromRGBO(63, 61, 86, 1)},
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackgroundScreen(
        isTopImageVisible: true,
        child: [
          Column(
            children: [
              const AppHeaderWidget(),
              const WelcomeWidget(
                nameString: 'Jatin Kumar',
              ),
              const GreetingWidgetWithPageName(
                pageName: "Application Details",
              ),
              SizedBox(
                height: size.height * 0.55,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: Card(
                    elevation: 5,
                    color: const Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Scrollbar(
                        controller: _scrollController,
                        thickness: 8,
                        radius: const Radius.circular(15),
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  HeaderText(
                                    headerText: 'Registration No',
                                  ),
                                  NormalText(
                                    normalString: 'TSRTI/APP/HOM/30/12/23/HO/4027',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  )
                                ],
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      HeaderText(
                                        headerText: 'Petitioner First Name',
                                      ),
                                      NormalText(
                                        normalString: 'Raju',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                      HeaderText(
                                        headerText: 'Department',
                                      ),
                                      NormalText(
                                        normalString: 'Crime Branch CID',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                      HeaderText(
                                        headerText: 'Application Status Updated',
                                      ),
                                      NormalText(
                                        normalString: '10/08/2024',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                      HeaderText(
                                        headerText: 'Petitioner Address',
                                      ),
                                      NormalText(
                                        normalString: '867 Vidyanagar Road Telangana India 5000034',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      HeaderText(
                                        headerText: 'Petitioner Last Name',
                                      ),
                                      NormalText(
                                        normalString: 'Singh',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                      HeaderText(
                                        headerText: 'Application Status',
                                      ),
                                      StatusContainer(
                                        statusBackgroundColor: Color(0xFF3F3D56),
                                        statusText: 'Rejected',
                                        statusTextColor: Color(0xFFF0F4F3),
                                      ),
                                      HeaderText(
                                        headerText: 'PovertyLine',
                                      ),
                                      NormalText(
                                        normalString: 'Yes',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  HeaderText(
                                    headerText: 'Uploaded Files',
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(5, (i) {
                                    return const FileImageWidget();
                                  }),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal, // Allows horizontal scrolling if needed
                                padding: const EdgeInsets.all(0),
                                child: DataTable(
                                  dataRowHeight: 25,
                                  dividerThickness: 0,
                                  headingRowHeight: 40,
                                  showBottomBorder:true ,
                                  columnSpacing: 12,
                                  horizontalMargin: 0,


                                  columns: const [
                                    DataColumn(
                                      label: HeaderText(
                                        headerText: 'Status Updated',
                                      ),
                                    ),
                                    DataColumn(
                                        label: HeaderText(
                                      headerText: 'Application Status',
                                    )),
                                    DataColumn(
                                        label: HeaderText(
                                      headerText: 'Status Updated By',
                                    )),
                                  ],
                                  rows: statusLogList
                                      .map(
                                        (application) => DataRow(
                                          cells: [
                                            DataCell(
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  NormalText(
                                                    normalString: application['statusUpdated']!,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            DataCell(Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                 StatusContainer(
                                                  statusBackgroundColor: application['color']!,
                                                  statusText: application['applicationStatus']!,
                                                  statusTextColor: const Color(0xFFF0F4F3),
                                                ),
                                              ],
                                            )),
                                            DataCell(Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                NormalText(
                                                  normalString: application['updatedBy']!,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                ),
                                              ],
                                            )),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CommonButton(
                                    padding: const EdgeInsets.only(left: 0, right: 16,top: 10),
                                    buttonText: "Print",
                                    width:size.width*0.2,
                                    textFontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    height: 33,
                                    radius: 8,
                                    onTap: () {
                                      Navigator.pushNamed(context, "/applicationGuidelines");
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
