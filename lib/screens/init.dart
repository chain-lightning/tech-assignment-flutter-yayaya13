import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:challenges_clc/utils/provider.dart';
import 'package:challenges_clc/ui/theme.dart' as theme;
import 'package:challenges_clc/screens/qrScanner.dart';
import 'package:challenges_clc/screens/qrScannerButton.dart';
import 'package:provider/provider.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  bool isScannerOn = true;
  @override
  Widget build(BuildContext context) {
    // bool isScannerOn = context.watch<Providers>().isScannerOn;


    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(
          'QR Code Scanner',
          style: theme.toolbarTextStyle(this.context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isScannerOn) ...[
            const Flexible(
              flex: 2,
              child: QrScanner(),
            ),
          ] else ...[
            Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
          const Expanded(
            child: QrScannerButton(),
          ),
        ],
      )
    );
  }
}