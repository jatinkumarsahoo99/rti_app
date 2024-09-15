import 'package:flutter/material.dart';

import '../../rti_app.dart';
import '../module/splash_screen/splash_screen.dart';

class ScreenRoutes{
  // late BuildContext context;
  static Map<String,WidgetBuilder> appRoutes = {
    "/splashScreen":(context) =>  const SplashScreen(),
    '/homePage':(context) => const MyHomePage()
  };

}