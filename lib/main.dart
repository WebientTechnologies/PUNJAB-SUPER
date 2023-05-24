import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punjabsuper/routes/app_routes.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  if (Platform.isWindows) {
    // WidgetsFlutterBinding.ensureInitialized();
    // // Must add this line.
    // await windowManager.ensureInitialized();

    // WindowOptions windowOptions = WindowOptions(
    //   size: Size(1920, 1080),
    //   center: true,
    //   backgroundColor: Colors.transparent,
    //   skipTaskbar: false,
    //   titleBarStyle: TitleBarStyle.hidden,
    // );
    // windowManager.waitUntilReadyToShow(windowOptions, () async {
    //   await windowManager.show();
    //   await windowManager.focus();
    // });
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.pages,
    );
  }
}
