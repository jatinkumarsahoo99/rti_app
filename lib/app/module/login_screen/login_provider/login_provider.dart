import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rti_telangana/app/api_service/api_factory.dart';
import 'package:rti_telangana/app/app_main/main.dart';
import 'package:rti_telangana/app/common_widget/show_snack_bar.dart';

import '../../../api_service/http_methods.dart';
import '../../../utils/core_utility.dart';
import 'login_captcha_provider.dart';

class LogInProvider extends ChangeNotifier {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController captchaTextEditingController = TextEditingController();

  callLogFun(BuildContext context) {
    if (emailTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter your email");
    }else if (!emailTextEditingController.text.isValidEmail()) {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter valid email");
    } else if (passwordTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter your password");
    } else if (captchaTextEditingController.text.trim() == "" ||
        captchaTextEditingController.text != context.read<LogInCaptchaProvider>().captchaText) {
      ShowSnackBar.showErrorWithAnimation(context, "Invalid captcha!");
    } else {
      _callLogInApi(context);
    }
  }

  _callLogInApi(BuildContext context) {
    try {
      CoreUtility.showProgressIndicator();
      HttpMethodsDio().postMethod(
          api: ApiFactory.logInUrl,
          json: {"userName": emailTextEditingController.text, "password": passwordTextEditingController.text},
          fun: (map, code) {
            CoreUtility.disMissProgressIndicator();
            if (code == 200 || code == 201) {
              Navigator.pushNamed(context, "/dashboardScreen1");
            }else{
              ShowSnackBar.showErrorWithAnimation(context, "$map");
            }
            debugPrint(">>>>>>>>>map$map");
          });
    } catch (e) {
      CoreUtility.disMissProgressIndicator();
    }
  }
}
