import 'package:get/get.dart';

class ConfirmAndPayController extends GetxController {
  String title = '';
  String dateLine = '';
  double total = 0;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map? ?? {};
    title = (args['title'] ?? '').toString();
    dateLine = (args['dateLine'] ?? '').toString();
    total = double.tryParse((args['total'] ?? '0').toString()) ?? 0.0;
  }
}
