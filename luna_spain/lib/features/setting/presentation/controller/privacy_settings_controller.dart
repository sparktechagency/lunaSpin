import 'package:get/get.dart';

class PrivacySettingsController extends GetxController {
  // Info card visibility (dismiss with X)
  bool showInfoCard = true;

  void dismissInfoCard() {
    showInfoCard = false;
    update();
  }

  // Marketing permissions: 0 = No, 1 = Yes
  int marketingPermission = 1;
  void setMarketingPermission(int value) {
    marketingPermission = value;
    update();
  }
}
