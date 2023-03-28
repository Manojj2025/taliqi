import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/constants/values.dart';
import 'app/routes/app_pages.dart';

// signalling server url
final String websocketUrl = "WEB_SOCKET_SERVER_URL";

// generate callerID of local user
final String selfCallerID = Random().nextInt(999999).toString().padLeft(6, '0');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:
          AppColors.primaryColor, // Only honored in Android M and above
      statusBarIconBrightness:
          Brightness.light // Only honored in Android M and above
      // statusBarBrightness: Brightness.light,      // Only honored in iOS
      ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); // init signalling service

  runApp(
    ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, screenUtil) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Taliq-I",
            initialRoute: AppPages.INITIAL,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 0.85),
                child: child!,
              );
            },
            getPages: AppPages.routes,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  backgroundColor: AppColors.primaryColor,
                  elevation: 0),
              primaryColor: AppColors.primaryColor,
              scaffoldBackgroundColor: AppColors.greyprimarycolor.shade100,
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.white),
              ),
            ),
          );
        }),
  );
}
