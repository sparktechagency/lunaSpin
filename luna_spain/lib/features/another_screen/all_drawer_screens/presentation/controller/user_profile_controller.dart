import 'package:get/get.dart';
import 'package:luna_spain/utils/constants/app_images.dart';

class UserProfileController extends GetxController {
  String name = 'Georgina Leon';
  int followers = 6313;
  int following = 2421;
  bool isFollowing = false;

  // Profile meta
  final String location = 'United Kingdom';
  final String experience = '4 Years';
  final String level = 'Intermediate';

  // Sample images for grid
  late final List<String> images;

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
  }

  void toggleFollow() {
    isFollowing = !isFollowing;
    // naive follower count change to reflect follow/unfollow
    followers += isFollowing ? 1 : -1;
    update();
  }
}
