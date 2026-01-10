import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/bottom_nav_screen.dart';


class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 3) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Onboarding done → Bottom Navigation
      Get.offAll(() => BottomNavScreen());
    }
  }

  void skip() {
    // Skip করলে সরাসরি Bottom Navigation
    Get.offAll(() => BottomNavScreen());
  }
}
