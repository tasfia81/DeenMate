import 'package:get/get.dart';

class PrayerController extends GetxController {
  var location = 'London, UK'.obs;
  var nextPrayer = 'Dhuhr'.obs;
  var nextTime = '12:45 PM'.obs;

  final prayers = [
    {'name': 'Fajr', 'time': '05:12 AM'},
    {'name': 'Dhuhr', 'time': '12:45 PM'},
    {'name': 'Asr', 'time': '03:20 PM'},
    {'name': 'Maghrib', 'time': '06:10 PM'},
    {'name': 'Isha', 'time': '07:45 PM'},
  ];
}
