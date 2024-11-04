import 'dart:ui';

import 'package:flutter/material.dart';

class ApplicationStatusColorUtils{
  static Color getStatusColor(String status){
    switch (status) {
      case 'Pending Fee':
        return Colors.orange;
      case 'Processing':
        return const Color.fromRGBO(137, 131, 71, 0.85);
      case 'Deemed Refusal':
        return const Color.fromRGBO(224, 148, 115, 0.38);
      case 'Disposed':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}