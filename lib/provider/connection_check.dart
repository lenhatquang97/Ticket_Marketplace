import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionCheck with ChangeNotifier {
  bool _isConnected = false;
  bool get isConnected => _isConnected;
  ConnectionCheck() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _isConnected = result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi;
      notifyListeners();
    });
  }
}
