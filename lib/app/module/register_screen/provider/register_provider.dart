import 'package:flutter/cupertino.dart';
import 'package:rti_telangana/app/utils/core_utility.dart';

import '../../../api_service/api_factory.dart';
import '../../../api_service/http_methods.dart';
import '../../../common_widget/show_snack_bar.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController surNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController stateTextEditingController = TextEditingController();
  TextEditingController pinTextEditingController = TextEditingController();
  TextEditingController genderTextEditingController = TextEditingController();
  TextEditingController mobileNumberTextEditingController = TextEditingController();

  callRegisterFun(BuildContext context) {
    if (fullNameTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter your full name");
    } else if (emailTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter your email");
    } else if (!emailTextEditingController.text.isValidEmail()) {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter valid email");
    } else if (surNameTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter your surName");
    } else if (addressTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter your address");
    } else if (countryTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter your country");
    } else if (stateTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter your state");
    } else if (pinTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter your pin");
    } else if (genderTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter your gender");
    } else if (mobileNumberTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter your mobile number");
    } else if (passwordTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please enter your password");
    } else if (confirmPasswordTextEditingController.text.trim() == "") {
      ShowSnackBar.showErrorWithAnimation(context, "Please confirm password");
    } else if (passwordTextEditingController.text.trim() != confirmPasswordTextEditingController.text.trim()) {
      ShowSnackBar.showErrorWithAnimation(context, "Password and confirm password should be match");
    } else {
      callRegisterApi(context);
    }
  }

  callRegisterApi(BuildContext context){
    try {
      CoreUtility.showProgressIndicator();
      HttpMethodsDio().postMethod(
          api: ApiFactory.registerUrl,
          json: {
            "email": emailTextEditingController.text,
            "password": passwordTextEditingController.text,
            "name": fullNameTextEditingController.text,
            "surname": surNameTextEditingController.text,
            "address": addressTextEditingController.text,
            "country":countryTextEditingController.text,
            "state": stateTextEditingController.text,
            "pin": pinTextEditingController.text,
            "gender": genderTextEditingController.text,
            "mobileNumber": mobileNumberTextEditingController.text,
            "role": "string",
            "createdBy": "string"
          },
          fun: (map, code) {
            CoreUtility.disMissProgressIndicator();
            if (code == 200 || code == 201) {
              Navigator.pushNamed(context, "/logInScreen");
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
