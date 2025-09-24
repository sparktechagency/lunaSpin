import 'package:get/get.dart';
import 'package:luna_spain/utils/constants/app_images.dart';

class LikesController extends GetxController {
  late final List<String> todayImages;
  late final List<String> yesterdayImages;
  late final List<String> twoDaysAgoImages;

  @override
  void onInit() {
    super.onInit();
    todayImages = [
      AppImages.todayImageOne,
      AppImages.todayImageTwo,
      AppImages.todayImageThree,
      AppImages.todayImageFour,
    ];
    yesterdayImages = [
      AppImages.yesterdayImageOne,
      AppImages.yesterdayImageTwo,

    ];
    twoDaysAgoImages = [
      AppImages.twoDaysAgoImageOne,
      AppImages.twoDaysAgoImageTwo,
      AppImages.twoDaysAgoImageThree,
      AppImages.twoDaysAgoImageFour,
    ];
  }
}
