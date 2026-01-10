import 'package:deenmate/CustomWidget/screen_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/splash_controller.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Controller init
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: const Color(0xFF0F3D2E), // Deep Green
      body: Center(
        child: ScreenBackground(
            child: Text('WELCOME',style: TextStyle(
              fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white
            ),)
        ),
      ),
    );
  }
}
