import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rti_telangana/app/app_main/rti_app.dart';

import '../../../api_service/api_factory.dart';
import '../../../api_service/http_methods.dart';
import '../../../common_provider/user_details_provider.dart';
import '../../../common_widget/show_snack_bar.dart';
import '../../../data/model/UserDetails.dart';
import '../../../utils/core_utility.dart';
import '../../../utils/secure_storage.dart';

class StaticsDashboardProvider extends ChangeNotifier {
  List<Map<String, dynamic>> applicationStaticsData1 = [];
  List<Map<String, dynamic>> applicationStaticsData2 = [];

  Future<dynamic> callStaticsApi1(BuildContext context) async {
    Completer completer = Completer<dynamic>();
    try {
      // Fetch the token
      HttpMethodsDio().getMethodWithToken(
          api: ApiFactory.statusCount,
          context: context,
          token: ApiFactory.apiToken,
          fun: (map, code) {
            applicationStaticsData1=[];
            if (code == 200 || code == 201) {
              if (map != null && map.length > 1) {
                for (int j = 0; j < map[0].length; j++) {
                  applicationStaticsData1.add({"title": map[0][j], "percentage": map[1][j].toDouble()});
                }
              }
              completer.complete("");
            } else {
              applicationStaticsData1 = [];
              ShowSnackBar.showErrorWithAnimation(context, "$map");
              completer.complete("");
            }
          });
    } catch (e) {
      applicationStaticsData1 = [];
      completer.complete("");
    }
    return completer.future;
  }
  Future<dynamic> callStaticsApi2(BuildContext context) async {
    Completer completer = Completer<dynamic>();
    try {
      // Fetch the token
      HttpMethodsDio().getMethodWithToken(
          api: ApiFactory.faCount,
          context: context,
          token: ApiFactory.apiToken,
          fun: (map, code) {
            applicationStaticsData2=[];
            if (code == 200 || code == 201) {
              if (map != null && map.length > 1) {
                for (int j = 0; j < map[0].length; j++) {
                  applicationStaticsData2.add({"title": map[0][j], "percentage": map[1][j].toDouble()});
                }
              }
              completer.complete("");
            } else {
              applicationStaticsData2 = [];
              ShowSnackBar.showErrorWithAnimation(context, "$map");
              completer.complete("");
            }
          });
    } catch (e) {
      applicationStaticsData2 = [];
      completer.complete("");
    }
    return completer.future;
  }

  callAllStaticsApis(BuildContext context) async {
    CoreUtility.showProgressIndicator();
    await Future.wait([
      callStaticsApi1(context),
      callStaticsApi2(context),
      context.read<UserDetailsProvider>(). getUserDetailsFromLocalStorage()
    ]);
    CoreUtility.disMissProgressIndicator();
    notifyListeners();
  }

}
