import 'dart:async';
import 'package:get/get.dart';
import '../../../../../config/route/app_routes.dart';

class CheckInboxController extends GetxController {
  Timer? _timer;
  int remaining = 5;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _startTimer() {
    _timer?.cancel();
    remaining = 5;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remaining > 0) {
        remaining--;
        update();
      } else {
        t.cancel();
        Get.offNamed(AppRoutes.createPassword);
      }
    });
    update();
  }
}
