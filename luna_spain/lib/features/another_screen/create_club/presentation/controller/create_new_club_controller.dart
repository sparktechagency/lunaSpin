import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/config/route/app_routes.dart';

class CreateNewClubController extends GetxController {
  // Text controllers
  final TextEditingController websiteCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();

  // Checkbox states
  final RxBool isActiveClub = false.obs;
  final RxBool acceptReview = false.obs;
  final RxBool acceptTerms = false.obs;

  // Toggle helpers
  void toggleActive(bool v) => isActiveClub.value = v;
  void toggleReview(bool v) => acceptReview.value = v;
  void toggleTerms(bool v) => acceptTerms.value = v;

  bool get isFormValid =>
      websiteCtrl.text.isNotEmpty &&
      emailCtrl.text.isNotEmpty &&
      isActiveClub.value &&
      acceptReview.value &&
      acceptTerms.value;

  void submit() {
    if (!isFormValid) {
      Get.snackbar(
        'Incomplete',
        'Please complete all fields and checkboxes.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.white,
        colorText: AppColors.colorPrimaryBlack,
      );
      return;
    }
    // Go to step 2: CreateClubDetails
    Get.toNamed(AppRoutes.createClubDetails);
  }

  @override
  void onClose() {
    websiteCtrl.dispose();
    emailCtrl.dispose();
    super.onClose();
  }
}
