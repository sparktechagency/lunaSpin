import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewClassTicketAndCostController extends GetxController {
  final costCtrl = TextEditingController();
  final maxAttendeesCtrl = TextEditingController();

  String? validateCost(String? v) {
    final t = (v ?? '').trim();
    if (t.isEmpty) return 'Required';
    final value = double.tryParse(t.replaceAll(',', '.'));
    if (value == null || value < 0) return 'Enter valid amount';
    return null;
  }

  String? validateMax(String? v) {
    final t = (v ?? '').trim();
    if (t.isEmpty) return 'Required';
    final value = int.tryParse(t);
    if (value == null || value <= 0) return 'Enter valid number';
    return null;
  }

  final formKey = GlobalKey<FormState>();

  void onNext() {
    final form = formKey.currentState;
    if (form == null) return;
    if (!form.validate()) {
      Get.snackbar('Validation', 'Please correct the highlighted fields.');
      return;
    }
    // TODO: navigate to confirm step when available
    Get.snackbar('Saved', 'Ticket & Cost saved (stub)');
  }

  @override
  void onClose() {
    costCtrl.dispose();
    maxAttendeesCtrl.dispose();
    super.onClose();
  }
}