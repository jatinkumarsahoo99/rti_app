import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';
import 'package:rti_telangana/app/common_widget/app_background_screen.dart';
import 'package:rti_telangana/app/module/dashboard_screen/provider/statics_dashbard_provider.dart';
import 'package:rti_telangana/app/module/dashboard_screen/widget/home_screen_drawer.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/greeting_widget_with_page_name.dart';
import '../../common_widget/pie_chart_widget.dart';
import '../../common_widget/app_header_widget.dart';
import '../../common_widget/welcome_widget.dart';
import '../../utils/dialog_helper.dart';
import '../../utils/secure_storage.dart';

class StaticsDashboardScreen extends StatefulWidget {
  const StaticsDashboardScreen({super.key});

  static Widget builder(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => StaticsDashboardProvider())],
      child: const StaticsDashboardScreen(),
    );
  }

  @override
  State<StaticsDashboardScreen> createState() => _StaticsDashboardScreenState();
}

class _StaticsDashboardScreenState extends State<StaticsDashboardScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();
  AnimationController? animationController;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    // Ensure context is available by using addPostFrameCallback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StaticsDashboardProvider>().callAllStaticsApis(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: const SizedBox(
        width: double.infinity,
        height: double.infinity,
      ),
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 150),
      animationController: animationController,
      animateChildDecoration: true,
      key: GlobalKey(),
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: true,
      backdropColor: Colors.white,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.red,
      ),
      drawer: SafeArea(
        child: Consumer<StaticsDashboardProvider>(
          builder: (context, provider, child) {
            return HomeScreenDrawer(
              fullName: context.read<StaticsDashboardProvider>().userDetails?.firstName ?? "",
              mobileNumber: context.read<StaticsDashboardProvider>().userDetails?.phone ?? "",
              emailAddress: context.read<StaticsDashboardProvider>().userDetails?.email ?? "",
              logOutTap: gotoSplashScreen,
              advancedDrawerController: advancedDrawerController,
              userId: "",
            );
          },
        ),
      ),
      child: Scaffold(
        body: AppBackgroundScreen(
          isTopImageVisible: true,
          child: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const AppHeaderWidget(),
                  Consumer<StaticsDashboardProvider>(
                    builder: (context, provider, child) {
                      return WelcomeWidget(
                        nameString: context.read<StaticsDashboardProvider>().userDetails?.firstName ?? "",
                        drawerCallBack: () {
                          if (mounted) {
                            advancedDrawerController.showDrawer();
                          }
                        },
                      );
                    },
                  ),
                  const GreetingWidgetWithPageName(
                    pageName: "Dashboard",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      color: const Color(0xFFFFFFFF),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                        child: Consumer<StaticsDashboardProvider>(
                          builder: (context, provider, child) {
                            return (context.read<StaticsDashboardProvider>().applicationStaticsData1.isNotEmpty)
                                ? PieChartWidget(
                                    data: context.read<StaticsDashboardProvider>().applicationStaticsData1,
                                    showText: true,
                                    onRefresh: () {
                                      context.read<StaticsDashboardProvider>().callAllStaticsApis(context);
                                    },
                                  )
                                : const Center(
                                    child: Text("Data Not Found"),
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      color: const Color(0xFFFFFFFF),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                        child: Consumer<StaticsDashboardProvider>(
                          builder: (context, provider, child) {
                            return (context.read<StaticsDashboardProvider>().applicationStaticsData2.isNotEmpty)
                                ? PieChartWidget(
                                    data: context.read<StaticsDashboardProvider>().applicationStaticsData2,
                                    showText: true,
                                    onRefresh: () {
                                      context.read<StaticsDashboardProvider>().callAllStaticsApis(context);
                                    },
                                  )
                                : const Center(
                                    child: Text("Data Not Found"),
                                  );
                          },
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
      ),
    );
  }

  void gotoSplashScreen() async {
    bool isOk = await DialogHelper.showCommonPopupNew(
      "Are you sure?",
      "You want to Sign Out?.",
      context,
      barrierDismissible: true,
      isYesOrNoPopup: true,
    );
    if (isOk) {
      await saveDataInLocalStorage("false", key: "isLogIn");
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/logInScreen",
        (Route<dynamic> route) => false,
      );
    }
  }


  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
}
