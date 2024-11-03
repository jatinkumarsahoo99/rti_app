import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rti_telangana/app/api_service/api_factory.dart';
import 'package:rti_telangana/app/api_service/http_methods.dart';
import 'package:rti_telangana/app/common_widget/show_snack_bar.dart';
import 'package:rti_telangana/app/utils/secure_storage.dart';

import '../../../utils/core_utility.dart';

class CountsDashboardProvider extends ChangeNotifier {
  dynamic totalSubmittedApplications = 0;
  dynamic totalFirstAppealSubmittedApplications = 0;
  dynamic totalDisposedApplications = 0;
  dynamic totalFirstAppealDisposedApplications = 0;
  dynamic totalDeemedApplications = 0;
  dynamic totalFirstAppealsDeemedApplications = 0;
  dynamic totalRejectedApplications = 0;
  dynamic totalFirstAppealsRejectedApplications = 0;

  callCountsApis(BuildContext context) async {
    totalSubmittedApplications = await getTotalApplicationsCountApi(ApiFactory.totalSubmittedApplicationsUrl,context);
    totalFirstAppealSubmittedApplications = await getTotalApplicationsCountApi(ApiFactory.totalFirstAppealsSubmittedUrl,context);
    totalDisposedApplications = await getTotalApplicationsCountApi(ApiFactory.totalDisposedApplicationsUrl,context);
    totalFirstAppealDisposedApplications= await getTotalApplicationsCountApi(ApiFactory.totalFirstAppealsDisposedUrl,context);
    totalDeemedApplications= await getTotalApplicationsCountApi(ApiFactory.totalDeemedApplicationsUrl,context);
    totalFirstAppealsDeemedApplications = await getTotalApplicationsCountApi(ApiFactory.totalFirstAppealsDeemedUrl,context);
    totalRejectedApplications= await getTotalApplicationsCountApi(ApiFactory.totalRejectedApplicationsUrl,context);
    totalFirstAppealsRejectedApplications = await getTotalApplicationsCountApi(ApiFactory.totalFirstAppealsRejectedUrl,context);
    notifyListeners();
  }

  Future<dynamic> getTotalApplicationsCountApi(String apiUrl,BuildContext context) async {
    Completer completer = Completer<dynamic>();
    try {
      CoreUtility.showProgressIndicator();
      // Fetch the token
      String? accessToken = await getToken();
      HttpMethodsDio().getMethodWithToken(
          api: apiUrl,
          token: accessToken,
          fun: (map, code) {
            CoreUtility.disMissProgressIndicator();
            if (code == 200 || code == 201) {
              dynamic count = map['data'];
              debugPrint(">>>>>>>>>>>>>Total count: $count");
              completer.complete(count);
            } else {
              ShowSnackBar.showErrorWithAnimation(context, "$map");
              completer.complete(0);
            }
            debugPrint(">>>>>>>>>map$map");
          });
    } catch (e) {
      CoreUtility.disMissProgressIndicator();
      completer.complete(0);
    }
    return completer.future;
  }

}
