import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/chat_list_model.dart';
import '../../../../services/socket/socket_service.dart';
import '../../../../services/storage/storage_services.dart';
import '../../../../utils/enum/enum.dart';

class ChatController extends GetxController {
  // Api status
  Status status = Status.completed;

  // Paging
  bool isMoreLoading = false;
  int page = 1;

  // Chat list
  List<ChatModel> chats = [];

  // Scroll controller
  final ScrollController scrollController = ScrollController();

  // Singleton-style accessor
  static ChatController get instance => Get.put(ChatController());

  // Load more when reaching the end
  Future<void> moreChats() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await getChatRepo();
      isMoreLoading = false;
      update();
    }
  }

  // Load chat list (replace with API integration)
  Future<void> getChatRepo() async {
    // Example template for API integration:
    // if (page == 1) {
    //   status = Status.loading;
    //   update();
    // }
    //
    // final response = await ApiService.get("${ApiEndPoint.chats}?page=$page");
    // if (response.statusCode == 200) {
    //   final data = response.data['chats'] ?? [];
    //   for (final item in data) {
    //     chats.add(ChatModel.fromJson(item));
    //   }
    //   page++;
    //   status = Status.completed;
    // } else {
    //   status = Status.error;
    // }
    // update();
  }

  // Socket listener to refresh chat list
  void listenChat() {
    SocketServices.on("update-chatlist::${LocalStorage.userId}", (data) {
      page = 1;
      chats.clear();
      for (var item in data) {
        chats.add(ChatModel.fromJson(item));
      }
      status = Status.completed;
      update();
    });
  }

  // Swipe-to-delete helper
  void deleteAt(int index) {
    if (index >= 0 && index < chats.length) {
      chats.removeAt(index);
      update();
    }
  }

  @override
  void onInit() {
    if (!Get.isRegistered<ChatController>()) {
      Get.put(this);
    }
    getChatRepo();
    scrollController.addListener(moreChats);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(moreChats);
    scrollController.dispose();
    super.onClose();
  }
}