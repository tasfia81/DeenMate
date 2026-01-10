import 'package:deenmate/Utils/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/onboarding_controller.dart';
import '../CustomWidget/onboarding_page_widget.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9F7),
     // backgroundColor: const Color(0xFF0F3D2E),
      body: SafeArea(
        child: Column(
          children: [

            // 🔹 SKIP BUTTON
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: controller.skip,
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            // 🔹 PAGE VIEW
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: const [
                  OnboardPage(
                    image: AssetPaths.quranMajeed,
                    title: 'Quran Majeed',
                    subtitle: 'Read & listen to the Holy Quran',
                  ),
                  OnboardPage(
                    image: AssetPaths.quranMajeed,
                    title: 'Prayer Time',
                    subtitle: 'Never miss a single salah',
                  ),
                  OnboardPage(
                    image: AssetPaths.quranMajeed,
                    title: 'Sehri & Iftar',
                    subtitle: 'Ramadan reminders made easy',
                  ),
                  OnboardPage(
                    image: AssetPaths.quranMajeed,
                    title: 'Tasbih & Dua',
                    subtitle: 'Stay connected with Allah',
                  ),
                ],
              ),
            ),

            // 🔹 DOT + BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // DOT INDICATOR
                  Obx(() => Row(
                    children: List.generate(4, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(right: 6),
                        height: 8,
                        width: controller.currentPage.value == index ? 22 : 8,
                        decoration: BoxDecoration(
                          color: controller.currentPage.value == index
                              ? const Color(0xFF0F3D2E)
                              : Colors.grey.shade400,
                             //   : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    }),
                  )),

                  // CUSTOM BUTTON
                  GestureDetector(
                    onTap: controller.nextPage,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F3D2E),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Obx(() => Text(
                        controller.currentPage.value == 3
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
