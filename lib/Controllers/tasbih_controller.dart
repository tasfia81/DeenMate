import 'package:get/get.dart';

class TasbihController extends GetxController {
  final RxMap<String, int> dhikrCounts = <String, int>{}.obs;

  final List<String> dhikrList = [
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
    for (var dhikr in dhikrList) {
      dhikrCounts[dhikr] = 0;
    }
  }

  void increment(String dhikr) {
    final old = dhikrCounts[dhikr] ?? 0;
    dhikrCounts[dhikr] = old + 1;
  }

  void reset(String dhikr) {
    dhikrCounts[dhikr] = 0;
  }
}
