import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart' as service;

import '../utils/core_utility.dart';
import '../utils/dialog_helper.dart';
import '../utils/logger.dart';
import '../utils/secure_storage.dart';

class HttpMethodsDio {
  HttpMethodsDio._privateConstructor() {
    // Perform any necessary initialization here
    _dio = Dio()
      // ..options.baseUrl = 'https://your-api-base-url.com' // Set your base URL
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestBody: true,
          logPrint: (data) {
            if (kDebugMode) {
              /*Logger.setInfoLogs(
                'HttpMethodsDio',
                'API CALLING',
                'message: $data',
              );*/
              debugPrint(">>>>>>>>$data");
            }
          })); // Add logging (optional)
    // debugPrint('MySingleton instance created');
  }

  factory HttpMethodsDio() {
    return _instance;
  }

  Future<bool> checkTokenExpire() async {
    try {
      String? logInTime = await getDataFromLocalStorage(key: "logInTime");
      if (logInTime != null) {
        DateTime logInDateTime = DateTime.parse(logInTime);
        if (DateTime.now().difference(logInDateTime).inMinutes < 30) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void gotoLoginScreen(BuildContext context) async {
    bool isOk = await DialogHelper.showCommonPopupNew(
      "OOPS!!",
      "Season out please re-login.",
      context,
      barrierDismissible: false,
      isYesOrNoPopup: false,
    );
    if (isOk) {
      await saveDataInLocalStorage("false", key: "isLogIn");
      await saveDataInLocalStorage("${DateTime.now()}", key: "logInTime");
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/logInScreen",
          (Route<dynamic> route) => false,
        );
      }
    }
  }

  static final HttpMethodsDio _instance = HttpMethodsDio._privateConstructor();
  late final Dio _dio;

  Map<String, dynamic> failedMap = {"status": "failed"};

  getMethod({required String api, required Function fun}) async {
    // debugPrint("<<jks>>>>>API_CALL>>>>>>\n\n\n\n\n$api");
    try {
      service.Response response = await _dio.get(api);
      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          fun(response.data, response.statusCode);
        } catch (e) {
          if (kDebugMode) {
            /*Logger.setErrorLogs(
              'HttpMethodsDio',
              'getMapping',
              'Error: ${e.toString()}',
            );*/
            print(">>>>>>>$e");
          }
        }
      } else if (response.statusCode == 500) {
        fun(response.data, response.statusCode);
      } else {
        fun(failedMap, response.statusCode);
      }
    } on DioException catch (e) {
      //log("Connector Response Error>>" + jsonEncode(e.message));
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.cancel:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.badResponse:
          fun(e.response?.data ?? "", e.response?.statusCode);
          break;
        case DioExceptionType.badCertificate:
        case DioExceptionType.unknown:
          fun(failedMap, e.response?.statusCode);
          break;
        case DioExceptionType.connectionError:
          fun(failedMap, e.response?.statusCode);
          break;
        default:
          fun(failedMap, e.response?.statusCode);
          break;
      }
    }
  }

  getMethodWithToken({required String api, required String? token, required Function fun, required BuildContext context}) async {
    bool isExpired = await checkTokenExpire();
    if (!isExpired) {
      if (context.mounted) {
        CoreUtility.disMissProgressIndicator();
        gotoLoginScreen(context);
      }
    } else {
      try {
        service.Response response = await _dio.get(
          api,
          options: Options(headers: {"Authorization": "Bearer ${(token != null) ? token : ""}", "accept": "/"}),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          try {
            fun(response.data, response.statusCode);
          } catch (e) {
            if (kDebugMode) {
              print(">>>>>>>$e");
            }
          }
        } else if (response.statusCode == 500) {
          fun(response.data, response.statusCode);
        } else {
          fun(failedMap, response.statusCode);
        }
      } on DioException catch (e) {
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.cancel:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.unknown:
            fun(failedMap, e.response?.statusCode);
            break;
          case DioExceptionType.badResponse:
            fun(e.response?.data ?? {}, e.response?.statusCode);
          case DioExceptionType.badCertificate:
            fun(failedMap, e.response?.statusCode);
          case DioExceptionType.connectionError:
            fun(failedMap, e.response?.statusCode);
        }
      }
    }
  }

  getMethodWithParam({required String api, required Function fun, Map<String, dynamic>? json}) async {
    try {
      service.Response response = await _dio.get(api, queryParameters: json);
      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          fun(response.data);
        } catch (e) {
          if (kDebugMode) {
            print(">>>>>>>$e");
          }
        }
      } else if (response.statusCode == 500) {
        fun(response.data);
      } else {
        fun(failedMap);
      }
    } on DioException catch (e) {
      //log("Connector Response Error>>" + jsonEncode(e.message));
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.cancel:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.badResponse:
          fun(e.response?.data ?? "");
          break;
        case DioExceptionType.badCertificate:
        case DioExceptionType.unknown:
          fun(failedMap);
          break;
        case DioExceptionType.connectionError:
          fun(failedMap);
          break;
        default:
          fun(failedMap);
          break;
      }
    }
  }

  postMethod({required String api, dynamic json, required Function fun,required BuildContext context}) async {
    bool isExpired = await checkTokenExpire();
    if (!isExpired) {
      if (context.mounted) {
        CoreUtility.disMissProgressIndicator();
        gotoLoginScreen(context);

      }
    }else {
      try {
        service.Response response = await _dio.post(
          api,
          data: (json != null) ? jsonEncode(json) : null,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          try {
            fun(response.data, response.statusCode);
          } catch (e) {
            if (kDebugMode) {
              print(">>>>>>>$e");
            }
          }
        }
        /*else if (response.statusCode == 417) {
        fun(response.data);
      }*/
        else {
          fun(failedMap, response.statusCode);
        }
      } on DioException catch (e) {
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.cancel:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.unknown:
            fun(failedMap, 1000);
            break;
          case DioExceptionType.badResponse:
            fun(e.response?.data ?? {}, e.response?.statusCode);
          case DioExceptionType.badCertificate:
            fun(failedMap, e.response?.statusCode);
          case DioExceptionType.connectionError:
            fun(failedMap, e.response?.statusCode);
        }
      }
    }
  }

  postMethodWithToken({required String api, dynamic json, required Function fun, required String? token,required BuildContext context}) async {
    bool isExpired = await checkTokenExpire();
    if (!isExpired) {
      if (context.mounted) {
        CoreUtility.disMissProgressIndicator();
        gotoLoginScreen(context);
      }
    }
    try {
      service.Response response = await _dio.post(
        api,
        data: (json != null) ? jsonEncode(json) : null,
        options: Options(headers: {"Authorization": "Bearer ${(token != null) ? token : ""}", "accept": "/"}),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          fun(response.data, response.statusCode);
        } catch (e) {
          if (kDebugMode) {
            print(">>>>>>>$e");
          }
        }
      }
      /*else if (response.statusCode == 417) {
        fun(response.data);
      }*/
      else {
        fun(failedMap, response.statusCode);
      }
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.cancel:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.unknown:
          fun(failedMap, 1000);
          break;
        case DioExceptionType.badResponse:
          fun(e.response?.data ?? {}, e.response?.statusCode);
        case DioExceptionType.badCertificate:
          fun(failedMap, e.response?.statusCode);
        case DioExceptionType.connectionError:
          fun(failedMap, e.response?.statusCode);
      }
    }
  }

  putMethod({required String api, required post, required Function fun}) async {
    try {
      service.Response response = await _dio.put(
        api,
        data: jsonEncode(post),
      );
      if (response.statusCode == 200) {
        try {
          fun(response.data, response.statusCode);
        } catch (e) {
          if (kDebugMode) {
            print(">>>>>>>$e");
          }
        }
      } else {
        fun(failedMap, response.statusCode);
      }
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.cancel:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.unknown:
          fun(failedMap, e.response?.statusCode);
          break;
        case DioExceptionType.badResponse:
          fun(e.response?.data, e.response?.statusCode);
        case DioExceptionType.badCertificate:
          fun(failedMap, e.response?.statusCode);
        case DioExceptionType.connectionError:
          fun(failedMap, e.response?.statusCode);
      }
    }
  }
}
