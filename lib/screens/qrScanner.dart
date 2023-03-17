import 'dart:io';
import 'package:challenges_clc/screens/qrScannerResult.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:challenges_clc/utils/provider.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool? isScannerOn;

  // In order to get hot reload to work we need to pause the camera if the platform is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
        ),
        child: _buildQrView(context)
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    bool isScannerOn = context.watch<Providers>().isScannerOn;  // Check whether Scan button is long-pressing or not

    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;

    if (isScannerOn) {    // Detect QR Scan button is pressing
      return QRView(
        key: qrKey,
        onQRViewCreated: _onQRScanning,
        formatsAllowed: const [
          BarcodeFormat.qrcode
        ],
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea,
        ),
      );
    } else {
      return QRView(
        key: qrKey,
        onQRViewCreated: _offQRScanning,
      );
    }
  }

  // Start scanning with long pressing the button
  void _onQRScanning(QRViewController controller) {
    controller.resumeCamera();

    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        controller.pauseCamera();

        Provider.of<Providers>(context, listen: false).setScanResult(scanData.code.toString());

        goToResult(context);
      }
    });
  }

  // End scanning with pressing off
  void _offQRScanning(QRViewController controller) {
    controller.pauseCamera();
  }

  // go to result screen (qrScannerResult.dart)
  void goToResult(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const QrScannerResult()), (route) => false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }
}