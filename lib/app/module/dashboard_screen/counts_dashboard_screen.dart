import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rti_telangana/app/common_widget/app_background_screen.dart';
import 'package:rti_telangana/app/utils/secure_storage.dart';

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
  String? fullName;

  @override
  void initState() {
    super.initState();
    context.read<CountsDashboardProvider>().callCountsApis(context);
    _loadFullName();
  }

  Future<void> _loadFullName() async{
    String? name = await getUserFullName();
    debugPrint(">>>>>>>>>fullname$name");
    setState(() {
      fullName = name;
    });
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
                WelcomeWidget(
                  nameString: fullName ?? 'User',
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
                            count:  context.read<CountsDashboardProvider>().totalSubmittedApplications.toString(),
                            description: 'Total. Applications Submitted',
                          ),
                           BuildDashboardCard(
                            title: 'Disposed',
                            count: context.read<CountsDashboardProvider>().totalDisposedApplications.toString(),
                            description: 'Total. Applications Disposed',
                          ),
                           BuildDashboardCard(
                            title: 'Deemed Refusal',
                            count: context.read<CountsDashboardProvider>().totalDeemedApplications.toString(),
                            description: 'Total. Applications Deemed Refusal',
                          ),
                           BuildDashboardCard(
                            title: 'Rejected',
                            count:context.read<CountsDashboardProvider>().totalRejectedApplications.toString() ,
                            description: 'Total. Applications Rejected',
                          ),
                           BuildDashboardCard(
                            title: 'Submitted',
                            count: context.read<CountsDashboardProvider>().totalFirstAppealSubmittedApplications.toString(),
                            description: 'Total. First Appeals Submitted',
                          ),
                           BuildDashboardCard(
                            title: 'Disposed',
                            count: context.read<CountsDashboardProvider>().totalFirstAppealDisposedApplications.toString(),
                            description: 'Total. First Appeals Disposed',
                          ),
                           BuildDashboardCard(
                            title: 'Deemed Refusal',
                            count: context.read<CountsDashboardProvider>().totalFirstAppealsDeemedApplications.toString(),
                            description: 'Total. First Appeals Deemed Refusal',
                          ),
                           BuildDashboardCard(
                            title: 'Rejected',
                            count: context.read<CountsDashboardProvider>().totalFirstAppealsRejectedApplications.toString(),
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
