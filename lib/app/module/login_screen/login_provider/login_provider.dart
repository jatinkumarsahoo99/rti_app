import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rti_telangana/app/api_service/api_factory.dart';
import 'package:rti_telangana/app/common_widget/show_snack_bar.dart';
import 'package:rti_telangana/app/data/model/UserDetails.dart';
import 'package:rti_telangana/app/utils/secure_storage.dart';

import '../../../api_service/http_methods.dart';
import '../../../utils/core_utility.dart';
import 'login_captcha_provider.dart';
import 'dart:convert';

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
          fun: (map, code) async {
            CoreUtility.disMissProgressIndicator();
            if (code == 200 || code == 201) {
              //Save accessToken in secure storage
              await saveToken(map['accessToken']);

              CoreUtility.showSuccessDialog("Logged In Successfully").then((val) {
                Navigator.pushNamedAndRemoveUntil(context, "/countsDashboardScreen", (Route<dynamic> route) => false);
              });
            } else {
              ShowSnackBar.showErrorWithAnimation(context, "$map");
            }
          });
    } catch (e) {
      CoreUtility.disMissProgressIndicator();
    }
  }
}
