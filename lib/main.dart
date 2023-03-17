import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:challenges_clc/ui/theme.dart' as theme;
import 'package:challenges_clc/screens/init.dart';
import 'package:challenges_clc/utils/provider.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Providers>(create: (_) => Providers()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        // home: const MainScreen(),
        home: Theme(
          data: theme.materialThemeData,
          child: PlatformProvider(
            settings: PlatformSettingsData(
              iosUsesMaterialWidgets: true,
              iosUseZeroPaddingForAppbarPlatformIcon: true,
            ),
            builder: (context) => PlatformApp(
              home: const InitScreen(),
              material: (_, __) => MaterialAppData(
                theme: theme.materialThemeData,
                darkTheme: ThemeData.dark(), // standard dark theme
                themeMode: ThemeMode.system, // device controls theme
              ),
              cupertino: (_, __) => CupertinoAppData(
                theme: theme.cupertinoTheme,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  Future<bool> permission() async {
    Map<Permission, PermissionStatus> status =
    await [Permission.camera].request();

    if (await Permission.camera.isGranted) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}



// void main() => runApp(const MyApp());
//
// Future<bool> permission() async {
//   Map<Permission, PermissionStatus> status =
//   await [Permission.camera].request();
//
//   if (await Permission.camera.isGranted) {
//     return Future.value(true);
//   } else {
//     return Future.value(false);
//   }
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//
//   permission() {
//     // TODO: implement permission
//     throw UnimplementedError();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: theme.materialThemeData,
//       child: PlatformProvider(
//         settings: PlatformSettingsData(
//           iosUsesMaterialWidgets: true,
//           iosUseZeroPaddingForAppbarPlatformIcon: true,
//         ),
//         builder: (context) => PlatformApp(
//           home: const InitScreen(),
//           material: (_, __) => MaterialAppData(
//             theme: theme.materialThemeData,
//             darkTheme: ThemeData.dark(), // standard dark theme
//             themeMode: ThemeMode.system, // device controls theme
//           ),
//           cupertino: (_, __) => CupertinoAppData(
//             theme: theme.cupertinoTheme,
//           ),
//         ),
//       ),
//     );
//   }
// }