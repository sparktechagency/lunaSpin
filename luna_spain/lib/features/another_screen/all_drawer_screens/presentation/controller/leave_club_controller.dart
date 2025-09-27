import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveClubController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController feedbackController = TextEditingController();
  final int maxChars = 200;
  bool confirmed = false;
  bool isSubmitting = false;

  String clubName = 'Club';

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map && args['clubName'] is String) {
      clubName = args['clubName'];
    }
  }

  void toggleConfirmed(bool? v) {
    confirmed = v ?? false;
    update();
  }

  String? validateFeedback(String? val) {
    // optional: you may allow empty feedback
    if ((val ?? '').length > maxChars) {
      return 'Max $maxChars characters';
    }
    return null;
  }

  Future<void> submit() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    if (!confirmed) {
      Get.snackbar('Confirm', 'Please confirm before submitting');
      return;
    }
    isSubmitting = true;
    update();
    await Future.delayed(const Duration(seconds: 1));
    isSubmitting = false;
    update();
    Get.back();
    Get.snackbar('Submitted', 'Your request to leave $clubName has been sent.');
  }
}
