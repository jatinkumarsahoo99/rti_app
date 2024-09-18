import 'package:flutter/material.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/greeting_widget_with_page_name.dart';
import '../../common_widget/rti_background_screen.dart';
import '../../common_widget/rti_header_widget.dart';
import '../../common_widget/welcome_widget.dart';

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  final List<Map<String, dynamic>> applications = [
    {
      'id': 'TSRTI/APP/INF/22/01/24/SE/4042',
      'department': 'Secretariat Department Level',
      'info': 'Information Technology & Communication Department',
      'date1': '22/01/2024 13:8:07',
      'date2': '22/01/2024 13:7:33',
      'status': 'Processing',
      'statusColor': const Color.fromRGBO(137, 131, 71, 0.85)
    },
    {
      'id': 'TSRTI/APP/INF/22/01/24/SE/4043',
      'department': 'Secretariat Department Level',
      'info': 'Information Technology & Communication Department',
      'date1': '22/01/2024 13:8:07',
      'date2': '22/01/2024 13:7:33',
      'status': 'Deemed Refusal',
      'statusColor': const Color.fromRGBO(224, 148, 115, 0.38)
    },
    {
      'id': 'TSRTI/APP/INF/22/01/24/SE/4044',
      'department': 'Secretariat Department Level',
      'info': 'Information Technology & Communication Department',
      'date1': '22/01/2024 13:8:07',
      'date2': '22/01/2024 13:7:33',
      'status': 'Processing',
      'statusColor': const Color.fromRGBO(91, 232, 198, 0.38)
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RtiBackgroundScreen(
        isTopImageVisible: true,
        child: [
          SingleChildScrollView(
            child: Column(
              children: [
                const RtiHeaderWidget(),
                const WelcomeWidget(
                  nameString: 'Jatin Kumar',
                ),
                const GreetingWidgetWithPageName(
                  pageName: "Applications",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 5),
                  child: Card(
                    elevation: 5,
                    color: const Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView.builder(
                      itemCount: applications.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final app = applications[index];

                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                app['id'],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(app['department']),
                              Text(app['info']),
                              const SizedBox(height: 4),
                              Text(app['date1']),
                              Text(app['date2']),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: app['statusColor'],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      app['status'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CommonButton(
                                    padding: const EdgeInsets.only(left: 0, right: 0,top: 5),
                                    buttonText: "View",
                                    width:size.width*0.2,
                                    textFontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    height: 33,
                                    radius: 8,
                                    // backgroundColor: const Color.fromRGBO(0, 0, 0, 0.58),
                                    onTap: () {
                                      // Navigator.pushNamed(context, "/logInScreen");
                                    },
                                  ),
                                  CommonButton(
                                    padding: const EdgeInsets.only(left: 0, right: 0,top: 5),
                                    buttonText: "Appeal",
                                    width:size.width*0.2,
                                    textFontSize: 8,
                                    fontWeight: FontWeight.w600,
                                    height: 33,
                                    radius: 8,
                                    backgroundColor: const Color(0xFFEF3E48),
                                    onTap: () {
                                      // Navigator.pushNamed(context, "/logInScreen");
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                CommonButton(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  buttonText: "Next",
                  // backgroundColor: const Color.fromRGBO(0, 0, 0, 0.58),
                  onTap: () {
                    // Navigator.pushNamed(context, "/logInScreen");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
