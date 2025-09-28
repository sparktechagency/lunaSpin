import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luna_spain/config/route/app_routes.dart';

class CloseClubController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final feedbackController = TextEditingController();

  bool confirmed = false;
  bool isSubmitting = false;
  final int maxChars = 200;

  void toggleConfirmed(bool? value) {
    confirmed = value ?? false;
    update();
  }

  String? validateFeedback(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'This field is required';
    if (text.length > maxChars) return 'Max $maxChars characters';
    return null;
  }

  Future<void> submit() async {
    final form = formKey.currentState;
    if (form == null) return;
    if (!form.validate()) return;
    if (!confirmed) {
      Get.snackbar('Notice', 'Please confirm the deletion checkbox to proceed');
      return;
    }
    isSubmitting = true;
    update();
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      Get.toNamed(AppRoutes.userProfile);
      Get.snackbar('Close account', 'Your request has been submitted');
    } finally {
      isSubmitting = false;
      update();
    }
  }

  @override
  void onClose() {
    feedbackController.dispose();
    super.onClose();
  }
}
