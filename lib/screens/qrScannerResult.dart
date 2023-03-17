import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:challenges_clc/utils/provider.dart';

class QrScannerResult extends StatelessWidget {
  const QrScannerResult({super.key});

  @override
  Widget build(BuildContext context) {
    String scanResult = context.watch<Providers>().scanResult;

    return Scaffold(
      appBar: AppBar(title: Text('Result of QR Code Scan'),),
      body: Align(
        alignment: Alignment.center,
        child: Text(
          scanResult
        ),
      ),
    );
  }
}