import 'package:flutter/material.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/greeting_widget_with_page_name.dart';
import '../../common_widget/app_background_screen.dart';
import '../../common_widget/app_header_widget.dart';
import '../../common_widget/welcome_widget.dart';
import 'build_dashboard_card.dart';

class DashboardScreen1 extends StatefulWidget {
  const DashboardScreen1({super.key});

  @override
  State<DashboardScreen1> createState() => _DashboardScreen1State();
}

class _DashboardScreen1State extends State<DashboardScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackgroundScreen(
        isTopImageVisible: true,
        child: [
          SingleChildScrollView(
            child: Column(
              children: [
                const AppHeaderWidget(),
                const WelcomeWidget(
                  nameString: 'Jatin Kumar',
                ),
                const GreetingWidgetWithPageName(
                  pageName: "Dashboard",
                ),
                // Dashboard Grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    childAspectRatio: 1.3,
                    children: const [
                      BuildDashboardCard(
                        title: 'Submitted',
                        count: '7',
                        description: 'Total. Applications Submitted',
                      ),
                      BuildDashboardCard(
                        title: 'Disposed',
                        count: '4',
                        description: 'Total. Applications Disposed',
                      ),
                      BuildDashboardCard(
                        title: 'Deemed Refusal',
                        count: '8',
                        description: 'Total. Applications Deemed Refusal',
                      ),
                      BuildDashboardCard(
                        title: 'Rejected',
                        count: '10',
                        description: 'Total. Applications Rejected',
                      ),
                      BuildDashboardCard(
                        title: 'Submitted',
                        count: '7',
                        description: 'Total. First Appeals Submitted',
                      ),
                      BuildDashboardCard(
                        title: 'Disposed',
                        count: '4',
                        description: 'Total. First Appeals Disposed',
                      ),
                      BuildDashboardCard(
                        title: 'Deemed Refusal',
                        count: '8',
                        description: 'Total. First Appeals Deemed Refusal',
                      ),
                      BuildDashboardCard(
                        title: 'Rejected',
                        count: '10',
                        description: 'Total. First Appeals Rejected',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonButton(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  buttonText: "Next",
                  // backgroundColor: const Color.fromRGBO(0, 0, 0, 0.58),
                  onTap: () {
                    Navigator.pushNamed(context, "/dashboardScreen2");
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
