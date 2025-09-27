import 'package:get/get.dart';
import 'package:luna_spain/utils/constants/app_images.dart';

class Club {
  final String name;
  final int members;
  final String avatar;
  const Club({required this.name, required this.members, required this.avatar});
}

class SearchController extends GetxController {
  // Sample images for grid (reusing the same set as UserProfileController)
  late final List<String> images;

  // Filters
  final List<String> filters = const ['Photos', 'Videos', 'Skills', 'Users', 'Clubs'];
  String selectedFilter = 'Photos';

  // Clubs data
  late final List<Club> clubs;

  void selectFilter(String filter) {
    selectedFilter = filter;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    images = [
      AppImages.twoDaysAgoImageOne,
      AppImages.todayImageOne,
      AppImages.todayImageTwo,
      AppImages.todayImageThree,
      AppImages.todayImageFour,
      AppImages.twoDaysAgoImageTwo,
      AppImages.twoDaysAgoImageThree,
      AppImages.twoDaysAgoImageFour,
    ];

    clubs = const [
      Club(name: 'Pole Ninjas', members: 24943, avatar: AppImages.clubLogo),
      Club(name: 'Hoops + Loops', members: 2412, avatar: AppImages.todayImageOne),
      Club(name: 'Arias School', members: 321, avatar: AppImages.todayImageTwo),
      Club(name: 'Grounded Bright', members: 18, avatar: AppImages.todayImageThree),
      Club(name: 'Pole Series', members: 12631, avatar: AppImages.todayImageFour),
      Club(name: 'FlipTumble', members: 4943, avatar: AppImages.twoDaysAgoImageOne),
      Club(name: 'Grip & Inspire', members: 3217, avatar: AppImages.twoDaysAgoImageTwo),
      Club(name: 'Wiggle Art', members: 7209, avatar: AppImages.twoDaysAgoImageThree),
    ];
  }
}
