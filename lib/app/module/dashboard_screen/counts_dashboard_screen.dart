import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rti_telangana/app/common_widget/app_background_screen.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/greeting_widget_with_page_name.dart';
import '../../common_widget/app_header_widget.dart';
import '../../common_widget/welcome_widget.dart';
import 'build_dashboard_card.dart';
import 'dashboard_counts_provider/counts_dashboard_provider.dart';

class CountsDashboardScreen extends StatefulWidget {
  const CountsDashboardScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountsDashboardProvider(),
      child: const CountsDashboardScreen(),
    );
  }

  @override
  State<CountsDashboardScreen> createState() => _CountsDashboardScreenState();
}

class _CountsDashboardScreenState extends State<CountsDashboardScreen> {

  @override
  void initState() {
    context.read<CountsDashboardProvider>().callCountsApis(context);
    super.initState();
  }

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
                  child: Consumer<CountsDashboardProvider>(
                    builder: (context, provider, child) {
                      return GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                        childAspectRatio: 1.3,
                        children: [
                          BuildDashboardCard(
                            title: 'Submitted',
                            count:  context.read<CountsDashboardProvider>().submittedCount.toString(),
                            description: 'Total. Applications Submitted',
                          ),
                          const BuildDashboardCard(
                            title: 'Disposed',
                            count: '4',
                            description: 'Total. Applications Disposed',
                          ),
                          const BuildDashboardCard(
                            title: 'Deemed Refusal',
                            count: '8',
                            description: 'Total. Applications Deemed Refusal',
                          ),
                          const BuildDashboardCard(
                            title: 'Rejected',
                            count: '10',
                            description: 'Total. Applications Rejected',
                          ),
                          const BuildDashboardCard(
                            title: 'Submitted',
                            count: '7',
                            description: 'Total. First Appeals Submitted',
                          ),
                          const BuildDashboardCard(
                            title: 'Disposed',
                            count: '4',
                            description: 'Total. First Appeals Disposed',
                          ),
                          const BuildDashboardCard(
                            title: 'Deemed Refusal',
                            count: '8',
                            description: 'Total. First Appeals Deemed Refusal',
                          ),
                          const BuildDashboardCard(
                            title: 'Rejected',
                            count: '10',
                            description: 'Total. First Appeals Rejected',
                          ),
                        ],
                      );
                    }
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
                    Navigator.pushNamed(context, "/staticsDashboardScreen");
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
