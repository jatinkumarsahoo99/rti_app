import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:rti_telangana/app/api_service/api_factory.dart';
import 'package:rti_telangana/app/api_service/http_methods.dart';
import 'package:rti_telangana/app/common_widget/show_snack_bar.dart';
import 'package:rti_telangana/app/data/model/UserDetails.dart';
import 'package:rti_telangana/app/utils/secure_storage.dart';

import '../../../data/model/ApplicationInfo.dart';
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
  String? fullName;
  String? phone;
  String? email;
  List<UserDetails> userDetailsList = [];
  List<ApplicationInfo> applicationList = [];


  callDashBoardApis(BuildContext context) async {
    try {
      CoreUtility.showProgressIndicator();
      await callAllGridApi(context);
      await CoreUtility.disMissProgressIndicator();
      notifyListeners();
    } catch (e) {
      ShowSnackBar.showErrorWithAnimation(context, "Something Went Wrong $e");
    }
  }

  Future<dynamic> getTotalApplicationsCountApi(String apiUrl, BuildContext context, String key) async {
    Completer completer = Completer<dynamic>();
    try {
      // Fetch the token
      HttpMethodsDio().getMethodWithToken(
          api: apiUrl,
          token: ApiFactory.apiToken,
          context: context,
          fun: (map, code) {
            CoreUtility.disMissProgressIndicator();
            if (code == 200 || code == 201) {
              dynamic count = map;
              assignValueToVal(key, count);
              completer.complete(count);
            } else {
              ShowSnackBar.showErrorWithAnimation(context, "$map");
              completer.complete(0);
            }
            debugPrint(">>>>>>>>>total count res:$map");
          });
    } catch (e) {
      completer.complete(0);
    }
    return completer.future;
  }


  assignValueToVal(String key, dynamic val) {
    switch (key) {
      case "totalSubmitted":
        totalSubmittedApplications = val;
        break;
      case "totalFirstAppeal":
        totalFirstAppealSubmittedApplications = val;
        break;
      case "totalDispose":
        totalDisposedApplications = val;
        break;
      case "totalFirstAppealDispose":
        totalFirstAppealDisposedApplications = val;
        break;
      case "totalDeemed":
        totalDeemedApplications = val;
        break;
      case "totalFirstAppealDeemed":
        totalFirstAppealsDeemedApplications = val;
        break;
      case "totalReject":
        totalRejectedApplications = val;
        break;
      case "totalFirstAppealReject":
        totalFirstAppealsRejectedApplications = val;
        break;
      default:
        break;
    }
  }

  Future<void> callAllGridApi(BuildContext context) async {
    await Future.wait([
      getTotalApplicationsCountApi(ApiFactory.totalSubmittedApplicationsUrl, context, "totalSubmitted"),
      getTotalApplicationsCountApi(ApiFactory.totalFirstAppealsSubmittedUrl, context, "totalFirstAppeal"),
      getTotalApplicationsCountApi(ApiFactory.totalDisposedApplicationsUrl, context, "totalDispose"),
      getTotalApplicationsCountApi(ApiFactory.totalFirstAppealsDisposedUrl, context, "totalFirstAppealDispose"),
      getTotalApplicationsCountApi(ApiFactory.totalDeemedApplicationsUrl, context, "totalDeemed"),
      getTotalApplicationsCountApi(ApiFactory.totalFirstAppealsDeemedUrl, context, "totalFirstAppealDeemed"),
      getTotalApplicationsCountApi(ApiFactory.totalRejectedApplicationsUrl, context, "totalReject"),
      getTotalApplicationsCountApi(ApiFactory.totalFirstAppealsRejectedUrl, context, "totalFirstAppealReject")
    ]);
  }
}
