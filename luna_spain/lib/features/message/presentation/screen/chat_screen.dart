import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../config/route/app_routes.dart';
import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../component/other_widgets/common_loader.dart';
import '../../../../component/screen/error_screen.dart';
import '../../../../component/text/common_text.dart';
import '../../../../component/text_field/common_text_field.dart';
import '../controller/chat_controller.dart';
import '../../data/model/chat_list_model.dart';
import '../../../../../../utils/enum/enum.dart';
import '../../../../../../utils/constants/app_string.dart';
import '../widgets/chat_list_item.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure controller is available (no init parameter in GetBuilder)
    if (!Get.isRegistered<ChatController>()) {
      Get.put(ChatController());
    }

    return Scaffold(
      // AppBar
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: 'Messages',
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),

      // Body
      body: GetBuilder<ChatController>(
        builder: (controller) => switch (controller.status) {
          Status.loading => const CommonLoader(),
          Status.error => ErrorScreen(
              onTap: ChatController.instance.getChatRepo,
            ),
          Status.completed => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  // Card container to match screenshot
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonText(
                            text: 'Messages',
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                          10.verticalSpace,
                          CommonTextField(
                            prefixIcon: const Icon(Icons.search),
                            hintText: AppString.searchDoctor,
                          ),
                          8.verticalSpace,

                          // List with swipe-to-delete
                          Expanded(
                            child: ListView.builder(
                              controller: controller.scrollController,
                              itemCount: controller.chats.length,
                              padding: EdgeInsets.only(top: 8.h),
                              itemBuilder: (context, index) {
                                final ChatModel item = controller.chats[index];
                                return Dismissible(
                                  key: ValueKey(item.id ?? index),
                                  direction: DismissDirection.endToStart,
                                  background: Container(
                                    margin: EdgeInsets.symmetric(vertical: 6.h),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                                        child: const Icon(Icons.delete, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onDismissed: (_) => ChatController.instance.deleteAt(index),
                                  child: GestureDetector(
                                    onTap: () => Get.toNamed(
                                      AppRoutes.message,
                                      parameters: {
                                        'chatId': item.id,
                                        'name': item.participant.fullName,
                                        'image': item.participant.image,
                                      },
                                    ),
                                    child: chatListItem(item: item),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        },
      ),

      // Bottom nav
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 2),
    );
  }
}