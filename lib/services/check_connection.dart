import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class CheckConnection extends ChangeNotifier {
  bool internet = true;

  checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(Duration(seconds: 8));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        internet = true;
      }
    } on SocketException catch (_) {
      internet = false;
    } on TimeoutException catch (_) {
      internet = false;
    }
    // setLoading();
    notifyListeners();
  }
}
