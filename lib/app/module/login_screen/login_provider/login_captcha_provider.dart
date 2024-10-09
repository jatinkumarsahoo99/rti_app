
import 'package:flutter/cupertino.dart';

import '../../../utils/core_utility.dart';

class LogInCaptchaProvider extends ChangeNotifier{

  String captchaText = CoreUtility.generateRandomString(4);

  resetCaptcha(){
    captchaText = CoreUtility.generateRandomString(4);
    notifyListeners();
  }

}