import 'package:get/get.dart';

class PaymentSettingController extends GetxController {
  // Dropdown model
  final List<String> currencies = ['GBP', 'USD', 'EUR'];
  String? selectedCurrency;

  final List<String> inPersonOptions = ['No', 'Yes'];
  String? selectedInPerson;

  // Simulate Stripe connected state
  bool stripeConnected = false;

  void setCurrency(String? v) {
    selectedCurrency = v;
    update();
  }

  void setInPerson(String? v) {
    selectedInPerson = v;
    update();
  }

  void connectStripe() {
    stripeConnected = true;
    update();
  }

  Future<void> save() async {
    // TODO: persist settings to API or local storage
    // For now just update() to reflect state
    update();
  }
}