import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/quran_controller.dart';

class AyahReadingScreen extends StatelessWidget {
  AyahReadingScreen({super.key});

  final QuranController controller = Get.put(QuranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAF8),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Surah Al-Fatiha',
          style: TextStyle(
            color: Color(0xFF0F3D2E),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF0F3D2E)),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          // 🌙 Bismillah
          const Text(
            'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              height: 1.8,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F3D2E),
            ),
          ),

          const SizedBox(height: 30),

          // 📖 Ayahs
          ...List.generate(7, (index) {
            final ayahNumber = index + 1;
            return _ayahCard(
              ayahNumber: ayahNumber,
              arabic: 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
              translation:
              'All praise is due to Allah, Lord of the worlds.',
              controller: controller,
            );
          }),
        ],
      ),
    );
  }

  // 🔁 Ayah Card (Reusable)
  Widget _ayahCard({
    required int ayahNumber,
    required String arabic,
    required String translation,
    required QuranController controller,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          // Bookmark Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => IconButton(
                icon: Icon(
                  controller.bookmarkedAyah.value == ayahNumber
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: const Color(0xFF0F3D2E),
                ),
                onPressed: () {
                  controller.bookmarkAyah(ayahNumber);
                },
              )),
              CircleAvatar(
                radius: 14,
                backgroundColor: const Color(0xFF0F3D2E),
                child: Text(
                  ayahNumber.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Arabic Text
          Text(
            arabic,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 26,
              height: 1.9,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F3D2E),
            ),
          ),

          const SizedBox(height: 16),

          // Translation
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              translation,
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
