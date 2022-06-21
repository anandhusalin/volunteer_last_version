import 'dart:io';

import 'package:bloc_volunteer_service/presentaion/splashscren/splash_screen_copy.dart';
import 'package:bloc_volunteer_service/provider/celebration/celebrationProvider.dart';
import 'package:bloc_volunteer_service/provider/chat/ChatProvider.dart';
import 'package:bloc_volunteer_service/provider/infomation/InformationProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'core/colors/colors.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.blue,
  ));

  // WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();
  // HttpOverrides.global = MyHttpOverrides();

  await GetStorage.init();

  runApp(const MyApp());
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChatProvider>(create: (_) => ChatProvider()),
        ChangeNotifierProvider<InformationProvider>(
            create: (_) => InformationProvider()),
        ChangeNotifierProvider<CelebrationProvider>(
            create: (_) => CelebrationProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            backgroundColor: backgroundColor,
            primarySwatch: Colors.blue,
            platform: TargetPlatform.iOS),
        home: const SplashScreen(),
      ),
    );

    // ChangeNotifierProvider(
    //   create: (BuildContext context) => ChatProvider(),
    //   child: GetMaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //         scaffoldBackgroundColor: backgroundColor,
    //         backgroundColor: backgroundColor,
    //         primarySwatch: Colors.blue,
    //         platform: TargetPlatform.iOS),
    //     home: const SplashScreen(),
    //   ),
    // );
  }
}
