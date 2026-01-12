import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';
import 'home_screen.dart';
import 'tasbih_screen.dart';
import 'quran_screen.dart';
import 'ai_chat_screen.dart';
import 'prayer_screen.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  // Controller
  final BottomNavController controller = Get.put(BottomNavController());

  // Pages (non-const, to avoid const error)
  final List<Widget> pages = [
    HomeScreen(),
    TasbihScreen(),
    QuranScreen(),
    AiChatScreen(),
    PrayerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        body: pages[controller.currentIndex.value],

        bottomNavigationBar: Container(
          height: 72,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.08),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              _navItem(Icons.home, 'Home  ', 0),
              _navItem(Icons.fingerprint, 'Tasbih  ', 1),

              // CENTER QURAN BUTTON
              _quranButton(),

              _navItem(Icons.smart_toy, 'AI Chat', 3),
              _navItem(Icons.favorite, 'Prayer Time', 4),
            ],
          ),
        ),
      ),
    );
  }

  // Normal Nav Item
  Widget _navItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: controller.currentIndex.value == index
                  ? const Color(0xFF0F3D2E)
                  : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: controller.currentIndex.value == index
                    ? const Color(0xFF0F3D2E)
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // BIG CENTER QURAN BUTTON
  Widget _quranButton() {
    return GestureDetector(
      onTap: () => controller.changeIndex(2),
      child: Obx(
            () => AnimatedScale(
          scale: controller.currentIndex.value == 2 ? 1.15 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF0F3D2E),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  color: const Color(0xFF0F3D2E).withOpacity(0.4),
                ),
              ],
            ),
            child: const Icon(
              Icons.menu_book_rounded, // Quran icon
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}
