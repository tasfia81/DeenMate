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
            ///================================ PAGE VIEW ==================================
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
                    image: AssetPaths.prayerAdhan,
                    title: 'Prayer Time',
                    subtitle: 'Never miss a single salah',
                  ),
                  OnboardPage(
                    image: AssetPaths.ramadanCalendarAlerts,
                    title: 'Sehri & Iftar',
                    subtitle: 'Ramadan reminders made easy',
                  ),
                  OnboardPage(
                    image: AssetPaths.duaTasbihTracker,
                    title: 'Tasbih & Dua',
                    subtitle: 'Stay connected with Allah',
                  ),
                ],
              ),
            ),

            ///================== DOT + BUTTON ========================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [

                  ///===================== DOT INDICATOR ===========================
                  Obx(
                        () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        final isActive = controller.currentPage.value == index;

                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          height: 8,
                          width: isActive ? 26 : 8,
                          decoration: BoxDecoration(
                            color: isActive
                                ? const Color(0xFF0F3D2E)
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 28),

                  ///======================== BIG CUSTOM BUTTON ==========================
                  GestureDetector(
                    onTap: controller.nextPage,
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F3D2E),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                            color: const Color(0xFF0F3D2E).withOpacity(0.35),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Obx(
                              () => Text(
                            controller.currentPage.value == 3
                                ? 'Get Started'
                                : 'Next',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  ///======================== SKIP BUTTON =============================
                  Obx(
                        () => controller.currentPage.value == 3
                        ? const SizedBox()
                        : GestureDetector(
                      onTap: controller.skip,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
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
