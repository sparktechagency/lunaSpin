import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextPostCommentController extends GetxController {
  final TextEditingController inputCtrl = TextEditingController();

  // Seed comments; structure matches your ImagePostCommentController
  final RxList<Comment> comments = <Comment>[
    Comment(
      avatar: 'man',
      name: 'kedaa212',
      handle: '@kedaa212',
      time: '13h ago',
      text: 'This shot is EVERYTHING! The colours, the vibe, the energy—pure magic! 🔥🔥',
      liked: true,
      isReply: false,
    ),
    Comment(
      avatar: 'man',
      name: 'catandfogs',
      handle: '@catandfogs',
      time: '8h ago',
      text: 'You just keep outdoing yourself! Love seeing your creativity shine through ❤️🙌',
      liked: true,
      isReply: false,
    ),
    Comment(
      avatar: 'man',
      name: 'georginaleon',
      handle: '@georginaleon',
      time: '7h ago',
      text: '@catandfogs OMG, thank you!',
      liked: false,
      isReply: true,
    ),
    Comment(
      avatar: 'man',
      name: 'georginaleon',
      handle: '@georginaleon',
      time: '4h ago',
      text: 'Hun 😂😂 how do you always find the best angles?! If I tried this, I’d end up looking like a broken doll.',
      liked: true,
      isReply: false,
    ),
  ].obs;

  void toggleLike(int index) {
    comments[index] = comments[index].copyWith(liked: !comments[index].liked);
    update();
  }

  void addComment(String text) {
    final t = text.trim();
    if (t.isEmpty) return;
    comments.add(
      Comment(
        avatar: 'man',
        name: 'You',
        handle: '@you',
        time: 'now',
        text: t,
        liked: false,
        isReply: false,
      ),
    );
    inputCtrl.clear();
    update();
  }

  @override
  void onClose() {
    inputCtrl.dispose();
    super.onClose();
  }
}

class Comment {
  final String avatar; // asset key from AppImages
  final String name;
  final String handle;
  final String time;
  final String text;
  final bool liked;
  final bool isReply;

  Comment({
    required this.avatar,
    required this.name,
    required this.handle,
    required this.time,
    required this.text,
    required this.liked,
    required this.isReply,
  });

  Comment copyWith({bool? liked}) => Comment(
        avatar: avatar,
        name: name,
        handle: handle,
        time: time,
        text: text,
        liked: liked ?? this.liked,
        isReply: isReply,
      );
}