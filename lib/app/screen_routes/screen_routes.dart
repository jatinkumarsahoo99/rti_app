import 'package:flutter/material.dart';

import '../../rti_app.dart';
import '../module/dashboard_screen/dashboard_screen1.dart';
import '../module/dashboard_screen/dashboard_screen2.dart';
import '../module/for_got_password/for_got_password.dart';
import '../module/intro_screen/intro_screen.dart';
import '../module/login_screen/log_in_screen.dart';
import '../module/register_screen/register_screen.dart';
import '../module/rti_application_status/rti_application_status.dart';
import '../module/splash_screen/splash_screen.dart';

class ScreenRoutes{
  // late BuildContext context;
  static Map<String,WidgetBuilder> appRoutes = {
    "/splashScreen":(context) =>  const SplashScreen(),
    '/introScreen':(context) => const IntroScreen(),
    '/registerScreen':(context) => const RegisterScreen(),
    '/logInScreen':(context) => const LogInScreen(),
    '/forgotPassword':(context) => const ForGotPassword(),
    '/rtiApplicationStatus':(context) => const RtiApplicationStatus(),
    '/dashboardScreen1':(context) => const DashboardScreen1(),
    '/dashboardScreen2':(context) => const DashboardScreen2(),
  };

}