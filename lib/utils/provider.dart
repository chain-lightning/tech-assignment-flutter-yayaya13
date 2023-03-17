import 'package:flutter/material.dart';

class Providers with ChangeNotifier {
  // initial values
  //
  static bool _isPressed = false;
  static bool _isScannerOn = false;
  static String _scanResult = '';

  // get
  //
  get isPressed => _isPressed;
  get isScannerOn => _isScannerOn;
  get scanResult => _scanResult;

  // void - notifyListeners
  //
  void setIsPressed(bool isPressed) {
    _isPressed = isPressed;
    notifyListeners();
  }

  void setIsScannerOn(bool isScannerOn) {
    _isScannerOn = isScannerOn;
    notifyListeners();
  }

  void setScanResult(String scanResult) {
    _scanResult = scanResult;
    notifyListeners();
  }
}
