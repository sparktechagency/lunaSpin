import 'package:get/get.dart';

class CreateNewClassOverviewController extends GetxController {
  // Counters for chips
  int attendees = 4;
  int waitlist = 2;
  int tickets = 1;

  // Class status (Available | Closed)
  String classStatus = 'Closed'; // default closed per your created screen

  void setStatus(String status) {
    classStatus = status;
    update();
  }
}