import 'package:flutter/material.dart';
import 'package:rti_telangana/app/common_widget/app_background_screen.dart';

import '../../utils/secure_storage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  setTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      checkUserLogIn();
    });
  }
  checkUserLogIn() async {
    String? logInSta = await getDataFromLocalStorage(key: "isLogIn");
    if(logInSta != null && logInSta.contains("true")){
      Navigator.pushNamedAndRemoveUntil(context, "/countsDashboardScreen", (Route<dynamic> route) => false);
    }else{
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/introScreen",
            (Route<dynamic> route) => false,
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppBackgroundScreen(
        child: [
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: size.width * 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
