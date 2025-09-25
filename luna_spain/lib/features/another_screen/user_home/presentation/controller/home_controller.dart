import 'package:get/get.dart';
import 'package:luna_spain/utils/constants/app_images.dart';

enum HomePostType { image, text }

class HomePost {
  final HomePostType type;
  // common
  final String authorHandle;
  final String meta; // e.g. "14h ago" or "4m read  •  3d ago"
  final int comments;
  final int likes;
  final int bookmarks;

  // image
  final String? image;
  final String? caption;

  // text
  final String? title;
  final String? body;

  const HomePost.image({
    required this.image,
    required this.caption,
    required this.authorHandle,
    required this.meta,
    required this.comments,
    required this.likes,
    required this.bookmarks,
  })  : type = HomePostType.image,
        title = null,
        body = null;

  const HomePost.text({
    required this.title,
    required this.body,
    required this.authorHandle,
    required this.meta,
    required this.comments,
    required this.likes,
    required this.bookmarks,
  })  : type = HomePostType.text,
        image = null,
        caption = null;
}

class HomeController extends GetxController {
  late final List<HomePost> posts;

  @override
  void onInit() {
    super.onInit();
    // Seed sample data to match the current design
    posts = [
      HomePost.image(
        image: AppImages.todayImageTwo,
        caption: 'Christmas pole party @poleninjas such a lovely evening with all these...',
        authorHandle: '@georginaleon',
        meta: '14h ago',
        comments: 22,
        likes: 62,
        bookmarks: 145,
      ),
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
        image: AppImages.twoDaysAgoImageTwo,
        caption: 'Parts from gymn class today taught @holydreams',
        authorHandle: '@holydreams',
        meta: '12h ago',
        comments: 22,
        likes: 62,
        bookmarks: 145,
      ),
      HomePost.image(
        image: AppImages.twoDaysAgoImageThree,
        caption: 'Christmas pole party @poleninjas such a beautiful move!',
        authorHandle: '@singlestacks',
        meta: '2d ago',
        comments: 22,
        likes: 62,
        bookmarks: 145,
      ),
      HomePost.text(
        title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        body:
            'Donec quis magna in justo viverra molestie. Vivamus vestibulum nisl in tellus semper aliquam. Integer cursus posuere sodales. Cras ornare! Suspendi tortor sed vehicula euismod.',
        authorHandle: '@minipaddle',
        meta: '2m read  •  3d ago',
        comments: 67,
        likes: 145,
        bookmarks: 89,
      ),
    ];
  }
}
