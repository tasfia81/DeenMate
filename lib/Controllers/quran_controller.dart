import 'package:get/get.dart';

class QuranController extends GetxController {
  var bookmarkedAyah = 1.obs;

  void bookmarkAyah(int ayahNumber) {
    bookmarkedAyah.value = ayahNumber;
    Get.snackbar(
      'Bookmarked',
      'Ayah $ayahNumber saved',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
