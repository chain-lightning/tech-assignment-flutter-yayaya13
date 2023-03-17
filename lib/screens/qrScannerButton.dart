import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:challenges_clc/utils/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class QrScannerButton extends StatefulWidget {
  const QrScannerButton({Key? key}) : super(key: key);

  @override
  State<QrScannerButton> createState() => _QrScannerButton();
}

class _QrScannerButton extends State<QrScannerButton> {
  QRViewController? controller;

  // get permission of camera
  Future<bool> permission() async {
    if (await Permission.camera.isGranted) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    bool isScannerOn = context.watch<Providers>().isScannerOn;

    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        child: InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * .05, vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              isScannerOn ? 'QR Scanning..' : 'QR Scan Ready',
              style: TextStyle(
                fontSize: 18 * textScale,
                color: Colors.white,
              ),
            ),
          ),
        ),
        onLongPressStart: (_) async {
          permission();   // Get permissions to a user

          isScannerOn = true;
          Provider.of<Providers>(context, listen: false).setIsScannerOn(isScannerOn);
        },
        onLongPressEnd: (_) => setState(() {
          isScannerOn = false;
          Provider.of<Providers>(context, listen: false).setIsScannerOn(isScannerOn);
        }),
      ),
    );
  }
}