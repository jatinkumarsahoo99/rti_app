import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';
import 'package:rti_telangana/app/common_provider/user_details_provider.dart';
import 'package:rti_telangana/app/common_widget/app_background_screen.dart';
import 'package:rti_telangana/app/module/applications_list_screen/application_list_provider/application_list_provider.dart';
import 'package:rti_telangana/app/utils/application_status_color.dart';

import '../../common_widget/common_button.dart';
import '../../common_widget/drawer_widget.dart';
import '../../common_widget/greeting_widget_with_page_name.dart';
import '../../common_widget/app_header_widget.dart';
import '../../common_widget/status_container.dart';
import '../../common_widget/welcome_widget.dart';
import '../../utils/core_utility.dart';
import '../../utils/dialog_helper.dart';
import '../../utils/secure_storage.dart';

class ApplicationsListScreen extends StatefulWidget {
  const ApplicationsListScreen({super.key});

  static Widget builder(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApplicationListProvider()),
        ChangeNotifierProvider(create: (context) => UserDetailsProvider()),
      ],
      child: const ApplicationsListScreen(),
    );
  }

  @override
  State<ApplicationsListScreen> createState() => _ApplicationsListScreenState();
}

class _ApplicationsListScreenState extends State<ApplicationsListScreen> {
  final ScrollController _scrollController = ScrollController();
  AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
    context.read<ApplicationListProvider>().callApplicationListApi(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DrawerWidget(
      logOutTap: (){
        CoreUtility.gotoLogInScreen(context);
      },
      applicationListTap: () {
        Navigator.pushNamed(context, "/applicationsListScreen");
      },
      getDrawerController: (AdvancedDrawerController controller) {
        advancedDrawerController = controller;
      },
      widget: Scaffold(
        body: AppBackgroundScreen(
          isTopImageVisible: true,
          child: [
            Column(
              children: [
                const AppHeaderWidget(),
                Consumer<UserDetailsProvider>(
                  builder: (context, provider, child) {
                    return WelcomeWidget(
                      nameString: context.read<UserDetailsProvider>().userDetails?.firstName ?? "",
                      drawerCallBack: () {
                        if (mounted) {
                          advancedDrawerController.showDrawer();
                        }
                      },
                    );
                  },
                ),
                const GreetingWidgetWithPageName(
                  pageName: "Applications",
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
                      child: Consumer<ApplicationListProvider>(builder: (context, provider, child) {
                        return Scrollbar(
                          controller: _scrollController,
                          thumbVisibility: true,
                          trackVisibility: true,
                          thickness: 8,
                          radius: const Radius.circular(15),
                          child: ListView.builder(
                            itemCount: context.read<ApplicationListProvider>().applicationList.length,
                            controller: _scrollController,
                            // physics: const NeverScrollableScrollPhysics(),
                            // shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final application = context.read<ApplicationListProvider>().applicationList[index];

                              return Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      application.applicationId.toString(),
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(application.department.toString()),
                                    Text(application.appLevel.toString()),
                                    const SizedBox(height: 4),
                                    Text(application.createdOn.toString()),
                                    Text(application.statusUpdate.toString()),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        StatusContainer(
                                          statusBackgroundColor:
                                              ApplicationStatusColorUtils.getStatusColor(application.status.toString()),
                                          statusText: application.status.toString(),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CommonButton(
                                          padding: const EdgeInsets.only(left: 0, right: 0, top: 5),
                                          buttonText: "View",
                                          width: size.width * 0.2,
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
                                          padding: const EdgeInsets.only(left: 0, right: 0, top: 5),
                                          buttonText: "Appeal",
                                          width: size.width * 0.2,
                                          textFontSize: 8,
                                          fontWeight: FontWeight.w600,
                                          height: 33,
                                          radius: 8,
                                          backgroundColor: const Color(0xFFEF3E48),
                                          onTap: () {
                                            Navigator.pushNamed(context, "/applicationDetails");
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
