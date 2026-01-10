import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9F7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF8F9F7),
        title: const Text(
          'Quran Majeed',
          style: TextStyle(
            color: Color(0xFF0F3D2E),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.search,
            color: Color(0xFF0F3D2E),
          ),
          SizedBox(width: 16),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // Continue Reading Card
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Get.toNamed('/ayah');
            },
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF0F3D2E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.menu_book_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Continue Reading',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Surah Al-Fatiha • Ayah 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Section Title
          const Text(
            'Surahs',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F3D2E),
            ),
          ),

          const SizedBox(height: 12),

          // 🔹 Surah List
          ...List.generate(10, (index) {
            return InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                // Ayah Reading Screen
                Get.toNamed('/ayah');
              },
              child: _surahCard(
                number: index + 1,
                name: 'Al-Fatiha',
                arabic: 'الفاتحة',
                ayahCount: 7,
                place: 'Meccan',
              ),
            );
          }),
        ],
      ),
    );
  }

  // Reusable Surah Card
  Widget _surahCard({
    required int number,
    required String name,
    required String arabic,
    required int ayahCount,
    required String place,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Row(
        children: [

          // Number Circle
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFF0F3D2E),
              shape: BoxShape.circle,
            ),
            child: Text(
              number.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F3D2E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$ayahCount Ayahs • $place',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // Arabic Name
          Text(
            arabic,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F3D2E),
            ),
          ),
        ],
      ),
    );
  }
}




