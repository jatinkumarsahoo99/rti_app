import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:rti_telangana/app/api_service/api_factory.dart';
import 'package:rti_telangana/app/api_service/http_methods.dart';
import 'package:rti_telangana/app/data/model/ApplicationInfo.dart';
import 'package:rti_telangana/app/utils/core_utility.dart';
import 'package:rti_telangana/app/utils/secure_storage.dart';

import '../../../common_widget/show_snack_bar.dart';

class ApplicationListProvider extends ChangeNotifier{
  List<ApplicationInfo> applicationList = [];

  Future<List<ApplicationInfo>> callApplicationListApi(BuildContext context) async{
    Completer<List<ApplicationInfo>> completer = Completer<List<ApplicationInfo>>();
    try{
      String? accessToken = await getDataFromLocalStorage();
      HttpMethodsDio().getMethodWithToken(api: ApiFactory.getAllApplications, token: accessToken, fun: (map, code) async{
        CoreUtility.disMissProgressIndicator();
        if (code == 200 || code == 201) {
          // Since the response is a list of user objects, directly parse it as a list
          List<dynamic> data = map;
          applicationList = data.map((json) => ApplicationInfo.fromJson(json)).toList();
          notifyListeners();
          completer.complete(applicationList);
        } else {
          ShowSnackBar.showErrorWithAnimation(context, "$map");
          completer.complete([]);
        }
        debugPrint(">>>>>>>>>application_list_res:$map");
      });

    }catch(e){
      CoreUtility.disMissProgressIndicator();
      completer.complete([]);
    }
    return completer.future;
  }
}