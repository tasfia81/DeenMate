import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/prayer_controller.dart';

const kPrimary = Color(0xFF0F3D2E);
const kAccent  = Color(0xFF0F3D2E);
const kBg      = Color(0xFFF8F9F7);

class PrayerScreen extends StatelessWidget {
  PrayerScreen({super.key});

  final controller = Get.put(PrayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(
        backgroundColor: kBg,
        elevation: 0,
        leading: const Icon(Icons.location_on, color: kPrimary),
        title: Obx(() => Text(
          controller.location.value,
          style: const TextStyle(
            color: kPrimary,
            fontWeight: FontWeight.w600,
          ),
        )),
        actions: const [
          Icon(Icons.settings, color: kPrimary),
          SizedBox(width: 12),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Prayer Times',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kPrimary,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Tuesday, 12 Oct • 6 Rabi al-Thani',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 16),

            ///============================= NEXT PRAYER CARD ==========================================
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'NEXT PRAYER',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        controller.nextPrayer.value,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimary,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    controller.nextTime.value,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kAccent,
                    ),
                  ),
                ],
              )),
            ),

            const SizedBox(height: 20),

            ///================================= PRAYER LIST =================================
            Expanded(
              child: ListView.builder(
                itemCount: controller.prayers.length,
                itemBuilder: (context, index) {
                  final prayer = controller.prayers[index];
                  final isActive = prayer['name'] == 'Dhuhr';

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isActive ? kAccent : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [

                        Icon(
                          Icons.wb_sunny_outlined,
                          color: isActive ? Colors.white : kPrimary,
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Text(
                            prayer['name']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isActive ? Colors.white : kPrimary,
                            ),
                          ),
                        ),

                        Text(
                          prayer['time']!,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isActive ? Colors.white : Colors.grey,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Icon(
                          Icons.notifications_active,
                          size: 18,
                          color: isActive ? Colors.white : kAccent,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
