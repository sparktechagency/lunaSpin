import 'package:get/get.dart';

class CheckoutController extends GetxController {
  String title = '';
  String dateLine = '';
  String time = '';
  double price = 16.00; // default shown in mock
  String voucher = '';
  double fee = 0.45; // example additional fee per mock note

  double get total => price + fee;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map? ?? {};
    title = (args['title'] ?? '').toString();
    dateLine = (args['dateLine'] ?? '').toString();
    time = (args['time'] ?? '').toString();
    price = double.tryParse((args['price'] ?? price).toString()) ?? price;
  }

  void applyVoucher(String code) {
    voucher = code;
    update();
  }
}
