import 'package:flutter/material.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/greeting_widget_with_page_name.dart';
import '../../common_widget/pie_chart_widget.dart';
import '../../common_widget/app_background_screen.dart';
import '../../common_widget/app_header_widget.dart';
import '../../common_widget/welcome_widget.dart';

class DashboardScreen2 extends StatefulWidget {
  const DashboardScreen2({super.key});

  @override
  State<DashboardScreen2> createState() => _DashboardScreen2State();
}

class _DashboardScreen2State extends State<DashboardScreen2> {
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    color: const Color(0xFFFFFFFF),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      child: PieChartWidget(
                        data: [
                          {'title': 'Pending Fee', 'percentage': 5.0},
                          {'title': 'Processing', 'percentage': 30.0},
                          {'title': 'Deemed Refusal', 'percentage': 45.0},
                          {'title': 'Disposed', 'percentage': 15.0},
                          {'title': 'Rejected', 'percentage': 5.0},
                        ],
                        showText: true,
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    color: const Color(0xFFFFFFFF),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      child: PieChartWidget(
                        data: [
                          {'title': 'Pending Fee', 'percentage': 5.0},
                          {'title': 'Processing', 'percentage': 30.0},
                          {'title': 'Deemed Refusal', 'percentage': 65.0}
                        ],
                      ),
                    ),
                  ),
                ),

                CommonButton(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  buttonText: "Next",
                  // backgroundColor: const Color.fromRGBO(0, 0, 0, 0.58),
                  onTap: () {
                    Navigator.pushNamed(context, "/applicationScreen");
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
