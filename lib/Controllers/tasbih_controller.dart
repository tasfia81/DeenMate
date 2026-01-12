import 'package:get/get.dart';

class TasbihController extends GetxController {
  final dhikrCounts = <String, int>{}.obs;

  final dhikrList = <String>[
    'SubhanAllah',
    'Alhamdulillah',
    'Allahu Akbar',
    'La ilaha illallah',
    'Astaghfirullah',
    'Ayat Al-Kursi',
  ];

  @override
  void onInit() {
    super.onInit();
    for (var d in dhikrList) {
      dhikrCounts[d] = 0;
    }
  }

  void increment(String dhikr) {
    dhikrCounts[dhikr] = (dhikrCounts[dhikr] ?? 0) + 1;
  }

  void reset(String dhikr) {
    dhikrCounts[dhikr] = 0;
  }
}
