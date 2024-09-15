import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rti_telangana/app/utils/dialog_helper.dart';

class CoreUtility {
  /// Method use to convert the base64 string to decode into Uint8List
  /// To show memory image
  static Uint8List? imageBase64ToImageData(String base64image) {
    Uint8List? imageByte;
    try {
      final UriData? data = Uri.parse(base64image).data;
      imageByte = data!.contentAsBytes();
    } catch (error) {
      imageByte = Uri.parse("data:image/png;base64,$base64image").data?.contentAsBytes();
      debugPrint("${CoreUtility}imageBase64Logo()$error");
    }
    return imageByte;
  }

  /// Method for setting initials of site Name reference taken from sentinll web
  /// @param fullName
  /// @return
  static String getInitialChar(String fullName) {
    String initials = "";
    if (fullName.isEmpty) {
      return initials;
    }
    try {
      if (fullName.isNotEmpty) {
        List<String> siteName = fullName.split(" ");
        if (siteName.length >= 2) {
          initials += siteName[0].substring(0, 1) + siteName[1].substring(0, 1);
        } else if (siteName.length == 1) {
          initials += siteName[0].substring(0, 1);
        }
      }
    } catch (e) {
      initials = fullName[0].toUpperCase();
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return initials.toUpperCase();
  }

  /// Method use to convert time stamp to date and time.
  static String formatTimestamp(int timestamp) {
    // Convert the timestamp to a DateTime object
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    // Format the DateTime with AM/PM as "dd MM yy hh:mm a"
    String formattedDate = DateFormat('dd-MMM-yy  hh:mm a').format(dateTime);

    return formattedDate;
  }

  static Future<bool> checkPermission(Permission permission, BuildContext context) async {
    final status = await permission.status;
    switch (status) {
      case PermissionStatus.denied:
        bool isOk = await DialogHelper.showCommonPopupNew(
          "Alert!",
          _PermissionName.getPermissions().where((element) => element.permission == permission).firstOrNull?.message ?? "",
          context,
          barrierDismissible: true,
          isYesOrNoPopup: true,
        );
        if (isOk) {
          await openAppSettings();
        }
      case PermissionStatus.granted:
        return true;

      case PermissionStatus.permanentlyDenied:
        bool isOk = await DialogHelper.showCommonPopupNew(
          "Alert!",
          _PermissionName.getPermissions().where((element) => element.permission == permission).firstOrNull?.message ?? "",
          context,
          barrierDismissible: true,
          isYesOrNoPopup: true,
        );
        if (isOk) {
          await openAppSettings();
        }
      case PermissionStatus.provisional:
      default:
        return false;
    }
    return false;
  }
}

class _PermissionName {
  String? title;
  String message;
  Permission permission;

  _PermissionName({this.title, required this.message, required this.permission});

  static List<_PermissionName> getPermissions() {
    return [
      _PermissionName(
        title: "Photo and Album",
        message: 'Extended App" would like to \n Access the Gallery',
        permission: Permission.photos,
      ),
      _PermissionName(
        title: "Camera",
        message: 'Extended App" would like to \n Access the Camera',
        permission: Permission.camera,
      ),
      _PermissionName(
        title: "Media Library",
        message: 'Extended App" would like to \n Access the Media Library',
        permission: Permission.mediaLibrary,
      ),
      _PermissionName(
        title: "Location",
        message: 'Extended App" would like to \n Access the Location',
        permission: Permission.location,
      ),
    ];
  }
}
