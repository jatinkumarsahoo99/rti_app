import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rti_telangana/app/api_service/api_factory.dart';
import 'package:rti_telangana/app/api_service/http_methods.dart';
import 'package:rti_telangana/app/common_widget/show_snack_bar.dart';
import 'package:rti_telangana/app/utils/secure_storage.dart';

import '../../../utils/core_utility.dart';

class CountsDashboardProvider extends ChangeNotifier {
  dynamic submittedCount = 7;

  callCountsApis(BuildContext context) async {
    submittedCount = await callSubmittedCountApi(context);
    notifyListeners();
  }

  Future<dynamic> callSubmittedCountApi(BuildContext context) async {
    Completer completer = Completer<dynamic>();
    try {
      CoreUtility.showProgressIndicator();
      // Fetch the token
      String? accessToken = await getToken();
      HttpMethodsDio().getMethodWithToken(
          api: ApiFactory.totalSubmittedApplicationsUrl,
          token: accessToken,
          fun: (map, code) {
            CoreUtility.disMissProgressIndicator();
            if (code == 200 || code == 201) {
              dynamic count = map['data'];
              debugPrint(">>>>>>>>>>>>>submitted count: $count");
              completer.complete(count);
            } else {
              ShowSnackBar.showErrorWithAnimation(context, "$map");
              completer.complete(9);
            }
            debugPrint(">>>>>>>>>map$map");
          });
    } catch (e) {
      CoreUtility.disMissProgressIndicator();
      completer.complete(9);
    }
    return completer.future;
  }
}
