import 'package:get/get.dart';

class PremiumFeaturesController extends GetxController {
  // Beta banner state (free during beta)
  final bool isBetaFree = true;

  // Pricing per month (GBP) for display
  final double communityArticlesPrice = 2.99;
  final double bookingSystemPrice = 16.99;

  // Radio groups: 0 = Off, 1 = On
  int communityArticles = 1; // default On in mock
  int bookingSystem = 0;

  void setCommunityArticles(int v) {
    communityArticles = v;
    update();
  }

  void setBookingSystem(int v) {
    bookingSystem = v;
    update();
  }

  double get calculatedTotal =>
      (communityArticles == 1 ? communityArticlesPrice : 0) +
      (bookingSystem == 1 ? bookingSystemPrice : 0);

  // Save/Update action (stub)
  bool isSaving = false;
  Future<void> onUpdate() async {
    isSaving = true;
    update();
    await Future.delayed(const Duration(milliseconds: 400));
    isSaving = false;
    update();
    Get.snackbar('Updated', 'Premium features updated');
  }
}
