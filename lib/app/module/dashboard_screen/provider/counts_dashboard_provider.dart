import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:rti_telangana/app/api_service/api_factory.dart';
import 'package:rti_telangana/app/api_service/http_methods.dart';
import 'package:rti_telangana/app/common_widget/show_snack_bar.dart';
import 'package:rti_telangana/app/data/model/UserDetails.dart';
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
  String? fullName;
  String? phone;
  String? email;
  List<UserDetails> userDetailsList = [];

  callDashBoardApis(BuildContext context) async {
    try {
      CoreUtility.showProgressIndicator();
      await Future.wait([callUserDetailsApi(context), callAllGridApi(context)]);
      CoreUtility.disMissProgressIndicator();
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
              dynamic count = map['data'];
              debugPrint(">>>>>>>>>>>>>Total count: $count");
              assignValueToVal(key, count);
              completer.complete(count);
            } else {
              ShowSnackBar.showErrorWithAnimation(context, "$map");
              completer.complete(0);
            }
            debugPrint(">>>>>>>>>map$map");
          });
    } catch (e) {
      completer.complete(0);
    }
    return completer.future;
  }

  Future<List<UserDetails>> callUserDetailsApi(BuildContext context) async {
    Completer<List<UserDetails>> completer = Completer<List<UserDetails>>();
    try {
      // Fetch the token
      HttpMethodsDio().getMethodWithToken(
          api: ApiFactory.userDetails,
          token: ApiFactory.apiToken,
          context: context,
          fun: (map, code) async {
            CoreUtility.disMissProgressIndicator();
            if (code == 200 || code == 201) {
              // Since the response is a list of user objects, directly parse it as a list
              List<dynamic> data = map;
               userDetailsList = data.map((json) => UserDetails.fromJson(json)).toList();
              // Save user details to secure storage

              if(userDetailsList.isNotEmpty) {
                String userDetailsJson = jsonEncode(userDetailsList[0]);
                await saveUserDetails(userDetailsJson);

                fullName = "${userDetailsList[0].firstName} ${userDetailsList[0].lastName}";
                phone = userDetailsList[0].phone;
                email = userDetailsList[0].email;
              }
              completer.complete(userDetailsList);
            } else {
              ShowSnackBar.showErrorWithAnimation(context, "$map");
              completer.complete([]);
            }
            debugPrint(">>>>>>>>>map$map");
          });
    } catch (e) {
      CoreUtility.disMissProgressIndicator();
      completer.complete([]);
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
