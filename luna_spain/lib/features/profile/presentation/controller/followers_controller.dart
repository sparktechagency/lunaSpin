import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FollowersController extends GetxController {
  final ScrollController scrollController = ScrollController();

  // Mock followers with follow status
  final RxList<_Follower> followers = <_Follower>[
    _Follower(name: 'Amelia Carter', handle: '@ameliacarter', isFollowing: false),
    _Follower(name: 'Sophia Bennett', handle: '@sophiabennett', isFollowing: true),
    _Follower(name: 'Olivia Reed', handle: '@oliviareed', isFollowing: false),
    _Follower(name: 'Isabella Hayes', handle: '@isabellahayes', isFollowing: true),
    _Follower(name: 'Harper Lawson', handle: '@harperlawson', isFollowing: true),
    _Follower(name: 'Naomi Fletcher', handle: '@naomifletcher', isFollowing: false),
    _Follower(name: 'Ruby Maxwell', handle: '@rubymaxwell', isFollowing: true),
    _Follower(name: 'Elise Thornton', handle: '@elisethornton', isFollowing: false),
    _Follower(name: 'Karen Temple', handle: '@karentemple', isFollowing: true),
    _Follower(name: 'Jackie Gondae', handle: '@jackiegondae', isFollowing: true),
    _Follower(name: 'Olivia Reed', handle: '@oliviareed', isFollowing: false),
    _Follower(name: 'Isabella Hayes', handle: '@isabellahayes', isFollowing: true),
  ].obs;

  void toggleFollow(int index) {
    final current = followers[index];
    followers[index] = current.copyWith(isFollowing: !current.isFollowing);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

class _Follower {
  final String name;
  final String handle;
  final bool isFollowing;
  const _Follower({required this.name, required this.handle, required this.isFollowing});

  _Follower copyWith({String? name, String? handle, bool? isFollowing}) => _Follower(
        name: name ?? this.name,
        handle: handle ?? this.handle,
        isFollowing: isFollowing ?? this.isFollowing,
      );
}
