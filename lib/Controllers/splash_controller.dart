import 'package:deenmate/Screens/onboarding_screen.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 6), () {
      Get.off(() => const OnboardingScreen());
    });
  }
}
