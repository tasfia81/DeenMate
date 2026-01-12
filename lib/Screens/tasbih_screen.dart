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
        backgroundColor: const Color(0xFFF8F9F7),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Tasbih',
          style: TextStyle(
            color: Color(0xFF0F3D2E),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.dhikrList.length,
        itemBuilder: (context, index) {
          final dhikr = controller.dhikrList[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
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

                      ///  ONLY THIS TEXT IS Obx
                      Obx(() => Text(
                        'Count: ${controller.dhikrCounts[dhikr]}',
                        style: const TextStyle(color: Colors.grey),
                      )),
                    ],
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.add_circle,
                      color: Color(0xFF0F3D2E), size: 30),
                  onPressed: () => controller.increment(dhikr),
                ),

                IconButton(
                  icon: const Icon(Icons.refresh,
                      color: Colors.redAccent),
                  onPressed: () => controller.reset(dhikr),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
