import 'package:get/get.dart';
import 'package:luna_spain/features/another_screen/user_home/presentation/controller/home_controller.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/features/search/presentation/controller/search_controller.dart' show Club;

class SearchResultController extends GetxController {
  late final List<HomePost> results;

  // Filters
  final List<String> filters = const ['Photos', 'Videos', 'Skills', 'Users', 'Clubs'];
  String selectedFilter = 'Photos';

  // Clubs data
  late final List<Club> clubs;

  void selectFilter(String filter) {
    selectedFilter = filter;
    update();
    // TODO: filter results based on selection if needed
  }

  @override
  void onInit() {
    super.onInit();
    // Seed with sample results; in real usage, filter based on query
    results = [
      HomePost.text(
        title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        body:
            'Donec quis magna in justo viverra molestie. Vivamus vestibulum nisl in tellus semper aliquam. Integer cursus posuere sodales. Cras venenatis laoreet tortor sed eleifend. Maecenas neque quam, condimentum...',
        authorHandle: '@spinlasspole',
        meta: '4m read  •  3d ago',
        comments: 67,
        likes: 145,
        bookmarks: 89,
      ),
      HomePost.image(
        image: AppImages.todayImageTwo,
        caption: 'Parts from spinny class today taught @holidayslim',
        authorHandle: '@holidayslim',
        meta: '12h ago',
        comments: 22,
        likes: 62,
        bookmarks: 145,
      ),
      HomePost.image(
        image: AppImages.twoDaysAgoImageThree,
        caption: 'Christmas pole party @poleninjas such a lovely evening...',
        authorHandle: '@georginaleon',
        meta: '2d ago',
        comments: 22,
        likes: 62,
        bookmarks: 145,
      ),
      HomePost.text(
        title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        body:
            'Donec quis magna in justo viverra molestie. Integer cursus posuere sodales. Cras ornare! Suspendi tortor sed vehicula euismod.',
        authorHandle: '@minipaddle',
        meta: '2m read  •  3d ago',
        comments: 67,
        likes: 145,
        bookmarks: 89,
      ),
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
