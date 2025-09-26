import 'package:get/get.dart';

class ClubProfileController extends GetxController {
  final RxBool showSuccessBanner = true.obs;

  void dismissBanner() {
    showSuccessBanner.value = false;
    update();
  }
}
