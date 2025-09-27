import 'package:get/get.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/config/route/app_routes.dart';

class SearchClubProfileController extends GetxController {
  String name = 'Club';
  int members = 0;
  String avatar = '';

  // Join button state
  bool joined = false; // false => show "Join club", true => show "Available Classes"

  // Upcoming classes data (sample)
  late final List<UpcomingDay> upcoming;

  // Latest activity images (sample)
  late final List<String> activityImages;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map) {
      name = (args['name'] ?? name).toString();
      members = int.tryParse((args['members'] ?? members).toString()) ?? members;
      avatar = (args['avatar'] ?? avatar).toString();
    }

    // Seed upcoming classes (two days like screenshot)
    upcoming = [
      UpcomingDay(
        weekday: 'Friday',
        day: '14',
        month: 'February',
        items: [
          ClassItem('Beginners Pole', 4),
          ClassItem('Mixed ability', 1),
          ClassItem('Spinny Pole', 0),
        ],
      ),
      UpcomingDay(
        weekday: 'Saturday',
        day: '15',
        month: 'February',
        items: [
          ClassItem('Beginners Pole', 2),
          ClassItem('Mixed ability', 1),
          ClassItem('Spinny Pole', 0),
        ],
      ),
      UpcomingDay(
        weekday: 'Sunday',
        day: '16',
        month: 'February',
        items: [
          ClassItem('Beginners Pole', 4),
          ClassItem('Mixed ability', 1),
          ClassItem('Spinny Pole', 0),
        ],
      ),
    ];

    activityImages = [
      AppImages.todayImageOne,
      AppImages.todayImageTwo,
      AppImages.todayImageThree,
      AppImages.todayImageFour,
    ];
  }

  void onJoinPressed() {
    // Toggle to show Available Classes
    if (!joined) {
      joined = true;
      update();
      Get.snackbar('Joined', 'You have joined $name');
    } else {
      // Navigate to Available Classes screen
      Get.toNamed(AppRoutes.availableClasses);
    }
  }
}

class UpcomingDay {
  final String weekday;
  final String day; // numeric day as string to style big
  final String month;
  final List<ClassItem> items;
  UpcomingDay({required this.weekday, required this.day, required this.month, required this.items});
}

class ClassItem {
  final String label;
  final int count;
  ClassItem(this.label, this.count);
}
