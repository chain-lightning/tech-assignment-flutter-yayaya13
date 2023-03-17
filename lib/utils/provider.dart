import 'package:flutter/material.dart';

class Providers with ChangeNotifier {
  // initial values
  //
  static bool _isScannerOn = false;   // Check whether Scan Button is pressing or not
  static String _scanResult = '';   // Get result of QR Scanning

  // get
  //
  get isScannerOn => _isScannerOn;
  get scanResult => _scanResult;

  // void - notifyListeners
  //
  void setIsScannerOn(bool isScannerOn) {
    _isScannerOn = isScannerOn;
    notifyListeners();
  }

  void setScanResult(String scanResult) {
    _scanResult = scanResult;
    notifyListeners();
  }
}
