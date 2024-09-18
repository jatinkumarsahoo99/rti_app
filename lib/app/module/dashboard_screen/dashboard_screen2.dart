import 'package:flutter/material.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/greeting_widget_with_page_name.dart';
import '../../common_widget/rti_background_screen.dart';
import '../../common_widget/rti_header_widget.dart';
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
                  pageName: "Dashboard",
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
