import 'dart:async';
import 'package:get/get.dart';
import '../../../../../config/route/app_routes.dart';

class ConfirmAccountController extends GetxController {
  Timer? _timer;
  int remaining = 60;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), navigate);
    startTimer();
  }

  navigate(){
    Get.offAllNamed(AppRoutes.accountConfirmed);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    _timer?.cancel();
    remaining = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remaining > 0) {
        remaining--;
        update();
      } else {
        t.cancel();
        update();
      }
    });
    update();
  }

  void resend() {
    if (remaining > 0) return;
    // TODO: Hook up resend API here
    startTimer();
  }
}
