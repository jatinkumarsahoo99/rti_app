import 'package:flutter/material.dart';
import 'package:rti_telangana/app/api_service/api_factory.dart';
import 'package:rti_telangana/app/common_widget/app_background_screen.dart';

import '../../utils/dialog_helper.dart';
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
    bool? tokenSta = await checkTokenExpire();
    if (logInSta != null && logInSta.contains("true")) {
      if (tokenSta) {
        ApiFactory.apiToken = await getDataFromLocalStorage() ?? "";
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(context, "/countsDashboardScreen", (Route<dynamic> route) => false);
        }
      } else {
        if (mounted) {
          gotoLoginScreen(context);
        }
      }
    } else {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/introScreen",
          (Route<dynamic> route) => false,
        );
      }
    }
  }

  void gotoLoginScreen(BuildContext context) async {
    bool isOk = await DialogHelper.showCommonPopupNew(
      "OOPS!!",
      "Season out please re-login.",
      context,
      barrierDismissible: false,
      isYesOrNoPopup: false,
    );
    if (isOk) {
      await saveDataInLocalStorage("false", key: "isLogIn");
      await saveDataInLocalStorage("${DateTime.now()}", key: "logInTime");
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/logInScreen",
          (Route<dynamic> route) => false,
        );
      }
    }
  }

  Future<bool> checkTokenExpire() async {
    try {
      String? logInTime = await getDataFromLocalStorage(key: "logInTime");
      if (logInTime != null) {
        DateTime logInDateTime = DateTime.parse(logInTime);
        if (DateTime.now().difference(logInDateTime).inMinutes < 30) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
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
