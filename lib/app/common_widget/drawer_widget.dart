import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';

import '../common_provider/user_details_provider.dart';
import '../module/dashboard_screen/widget/home_screen_drawer.dart';

class DrawerWidget extends StatefulWidget {
  final Widget widget;
  final VoidCallback logOutTap;
  final VoidCallback applicationListTap;
  final Function(AdvancedDrawerController) getDrawerController;
  const DrawerWidget({super.key, required this.widget, required this.logOutTap, required this.applicationListTap, required this.getDrawerController});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> with WidgetsBindingObserver, SingleTickerProviderStateMixin{

  AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();
  AnimationController? animationController;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    widget.getDrawerController(advancedDrawerController);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserDetailsProvider>().getUserDetailsFromLocalStorage();
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
          child: Consumer<UserDetailsProvider>(
            builder: (context, provider, child) {
              return HomeScreenDrawer(
                fullName: context.read<UserDetailsProvider>().userDetails?.firstName ?? "",
                mobileNumber: context.read<UserDetailsProvider>().userDetails?.phone ?? "",
                emailAddress: context.read<UserDetailsProvider>().userDetails?.email ?? "",
                applicationListTap:widget.applicationListTap ,
                logOutTap: widget.logOutTap,
                advancedDrawerController: advancedDrawerController,
                userId: "",
              );
            },
          ),
        ),

        child: widget.widget);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
}
