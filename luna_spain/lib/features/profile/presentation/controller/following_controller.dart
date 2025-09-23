import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FollowingController extends GetxController {
  final ScrollController scrollController = ScrollController();

  final List<Map<String, String>> users = [
    {'name': 'Amelia Carter', 'handle': '@ameliacarter'},
    {'name': 'Sophia Bennett', 'handle': '@sophiabennett'},
    {'name': 'Olivia Reed', 'handle': '@oliviareed'},
    {'name': 'Isabella Hayes', 'handle': '@isabellahayes'},
    {'name': 'Harper Lawson', 'handle': '@harperlawson'},
    {'name': 'Naomi Fletcher', 'handle': '@naomifletcher'},
    {'name': 'Ruby Maxwell', 'handle': '@rubymaxwell'},
    {'name': 'Elise Thornton', 'handle': '@elisethornton'},
    {'name': 'Karen Temple', 'handle': '@karentemple'},
    {'name': 'Jackie Gondae', 'handle': '@jackiegondae'},
    {'name': 'Olivia Reed', 'handle': '@oliviareed'},
    {'name': 'Isabella Hayes', 'handle': '@isabellahayes'},
  ];

  @override
  void onInit() {
    super.onInit();
    // Example: attach pagination later
    // scrollController.addListener(_onScroll);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
