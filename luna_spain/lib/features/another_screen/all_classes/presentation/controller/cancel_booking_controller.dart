import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luna_spain/config/route/app_routes.dart';

class CancelBookingController extends GetxController {
  final formKey = GlobalKey<FormState>();

  bool agreeReallocation = false;
  bool agreePolicies = false;
  bool isSubmitting = false;

  void toggleAgreeReallocation(bool? v) {
    agreeReallocation = v ?? false;
    update();
  }

  void toggleAgreePolicies(bool? v) {
    agreePolicies = v ?? false;
    update();
  }

  Future<void> submit() async {
    if (!agreeReallocation || !agreePolicies) {
      Get.snackbar('Required', 'Please agree to both confirmations to proceed.');
      return;
    }
    isSubmitting = true;
    update();
    await Future.delayed(const Duration(milliseconds: 800));
    isSubmitting = false;
    update();
   Get.toNamed(AppRoutes.bookedClasses);
    Get.snackbar('Submitted', 'Your booking cancellation has been submitted.');
  }

  // Helpers for link taps (can be wired from the screen)
  final TapGestureRecognizer termsTap = TapGestureRecognizer();
  final TapGestureRecognizer privacyTap = TapGestureRecognizer();

  @override
  void onClose() {
    termsTap.dispose();
    privacyTap.dispose();
    super.onClose();
  }
}
