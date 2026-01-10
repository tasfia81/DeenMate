import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tasbih_controller.dart';

class TasbihScreen extends StatelessWidget {
  TasbihScreen({Key? key}) : super(key: key);

  final TasbihController controller = Get.put(TasbihController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9F7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF8F9F7),
        centerTitle: true,
        title: const Text(
          'Tasbih',
          style: TextStyle(
            color: Color(0xFF0F3D2E),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
              () => ListView.separated(
            itemCount: controller.dhikrList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final dhikr = controller.dhikrList[index];
              final count = controller.dhikrCounts[dhikr] ?? 0;
              return _dhikrCard(dhikr, count);
            },
          ),
        ),
      ),
    );
  }

  Widget _dhikrCard(String dhikr, int count) {
    return Container(
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
      child: Row(
        children: [
          // Dhikr Name + Count
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dhikr,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F3D2E),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Count: $count',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // Buttons
          Row(
            children: [
              // Increment
              GestureDetector(
                onTap: () => controller.increment(dhikr),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xFF0F3D2E),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Reset
              GestureDetector(
                onTap: () => controller.reset(dhikr),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
