import 'package:flutter/material.dart';
import 'package:rti_telangana/app/module/find_rti_application_status/find_rti_application_status.dart';
import 'package:rti_telangana/app/module/first_appeal_details/first_appeal_details.dart';
import 'package:rti_telangana/app/module/first_appeal_status_details/first_appeal_status_details.dart';
import 'package:rti_telangana/app/module/new_application_details/new_application_details.dart';

import '../module/application_details/application_details.dart';
import '../module/application_details_status/application_details_status.dart';
import '../module/application_guidelines/application_guidelines.dart';
import '../module/application_screen/application_screen.dart';
import '../module/application_status_details/application_status_details.dart';
import '../module/dashboard_screen/dashboard_screen1.dart';
import '../module/dashboard_screen/dashboard_screen2.dart';
import '../module/find_first_appeal/find_my_first_appeal.dart';
import '../module/forgot_password/forgot_password.dart';
import '../module/intro_screen/intro_screen.dart';
import '../module/login_screen/login_screen.dart';
import '../module/new_application/new_application_section_a_b.dart';
import '../module/new_application/new_application_section_c_d.dart';
import '../module/new_application/new_application_section_e.dart';
import '../module/first_appeal_submission/first_appeal_submission.dart';
import '../module/payment_details/payment_details.dart';
import '../module/register_screen/register_screen.dart';
import '../module/splash_screen/splash_screen.dart';

class ScreenRoutes {
  // late BuildContext context;
  static Map<String,WidgetBuilder> appRoutes = {
    "/splashScreen":(context) =>  const SplashScreen(),
    '/introScreen':(context) => const IntroScreen(),
    '/registerScreen':(context) => const RegisterScreen(),
    '/logInScreen':(context) => const LogInScreen(),
    '/forgotPassword':(context) => const ForgotPassword(),
    '/findRtiApplicationStatus':(context) => const FindRtiApplicationStatus(),
    '/dashboardScreen1':(context) => const DashboardScreen1(),
    '/dashboardScreen2':(context) => const DashboardScreen2(),
    '/applicationScreen':(context) => const ApplicationScreen(),
    '/rtiApplicationDetailsStatus':(context) => const ApplicationDetailsStatus(),
    '/applicationDetails':(context) => const ApplicationDetails(),
    '/applicationGuidelines':(context) => const ApplicationGuidelines(),
    '/newApplication':(context) => const NewApplicationSectionAB(),
    '/newApplication2':(context) => const NewApplicationSectionCD(),
    '/newApplication3':(context) => const NewApplicationSectionE(),
    '/firstAppealDetails': (context) => const FirstAppealDetails(),
    '/firstAppealStatusDetails':(context) => const FirstAppealStatusDetails(),
    '/newApplicationDetails':(context) => const NewApplicationDetails(),
    '/applicationStatusDetails':(context) => const ApplicationStatusDetails(),
    '/firstAppealSubmission':(context) => const FirstAppealSubmission(),
    '/findMyFirstAppeal':(context) => const FindMyFirstAppeal(),
    '/paymentDetails':(context) => const PaymentDetails(),

  };
}
