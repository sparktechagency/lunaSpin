import 'package:get/get.dart';

class BookingCompleteController extends GetxController {
  String title = '';
  String bookingId = '';
  double amount = 0.0;
  String status = 'Paid';

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map? ?? {};
    title = (args['title'] ?? '').toString();
    bookingId = (args['bookingId'] ?? '231974127').toString();
    amount = double.tryParse((args['amount'] ?? '0').toString()) ?? 0.0;
    status = (args['status'] ?? 'Paid').toString();
  }
}
