import 'package:get/get.dart';
import '../../../../../config/route/app_routes.dart';

class AccountConfirmedController extends GetxController {
  
  // Navigate to get started (profile setup or main app)
  void getStarted() {
    // Navigate to profile details screen
    Get.offAllNamed(AppRoutes.addProfileDetails);
  }
  
  // Skip for now and go to main app
  void doThisLater() {
    // Navigate to main app without profile setup
    Get.offAllNamed(AppRoutes.profile); // or main app route
  }
}
