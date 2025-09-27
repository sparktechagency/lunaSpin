import 'package:get/get.dart';

class ClassDetailsController extends GetxController {
  String title = '';
  String dateLine = '';
  String time = '';
  int spaces = 0;
  String instructor = '';
  String level = 'Intermediate';
  String instructions = '';
  String address = '';
  String directions = '';
  String mapImage = '';

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map?
        ?? {};
    title = (args['title'] ?? '').toString();
    dateLine = (args['dateLine'] ?? '').toString();
    time = (args['time'] ?? '').toString();
    spaces = int.tryParse((args['spaces'] ?? 0).toString()) ?? 0;
    instructor = (args['instructor'] ?? '@georgialleon').toString();
    level = (args['level'] ?? level).toString();
    instructions = (args['instructions'] ?? 'Bring your dry hands, water, a towel and shorts. Please remember we operate a 24 hour cancellation policy and any bookings cancelled in 24 hours from the class starting are non-refundable.').toString();
    address = (args['address'] ?? 'Fresh Gym\nGovett Avenue\nShepperton\nTW178AJ').toString();
    directions = (args['directions'] ?? 'We are located upstairs just past reception on the right.').toString();
    mapImage = (args['mapImage'] ?? '').toString();
  }
}
