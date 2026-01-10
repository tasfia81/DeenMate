import 'package:deenmate/Screens/ayah_reading_screen.dart';
import 'package:deenmate/Screens/bottom_nav_screen.dart';
import 'package:deenmate/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/bottom',
      getPages: [
        GetPage(name: '/bottom', page: () => BottomNavScreen(),),
        GetPage(name: '/ayah', page: () => AyahReadingScreen()),
      ],
      home: SplashScreen(),
    );
  }
}
