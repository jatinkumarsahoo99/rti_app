import 'package:flutter/material.dart';
import 'package:rti_telangana/app/module/rti_application_status/rti_application_status.dart';

import '../../rti_app.dart';
import '../module/find_rti_application_status/find_rti_application_status.dart';
import '../module/forgot_password/forgot_password.dart';
import '../module/intro_screen/intro_screen.dart';
import '../module/login_screen/login_screen.dart';
import '../module/register_screen/register_screen.dart';
import '../module/splash_screen/splash_screen.dart';

class ScreenRoutes{
  // late BuildContext context;
  static Map<String,WidgetBuilder> appRoutes = {
    "/splashScreen":(context) =>  const SplashScreen(),
    '/introScreen':(context) => const IntroScreen(),
    '/registerScreen':(context) => const RegisterScreen(),
    '/logInScreen':(context) => const LogInScreen(),
    '/forgotPassword':(context) => const ForgotPassword(),
    '/findRtiApplicationStatus':(context) => const FindRtiApplicationStatus(),
    '/rtiApplicationStatus':(context) => const RtiApplicationStatus(),
  };

}