import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart' show CommonBottomNavBar;
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/features/another_screen/user_home/presentation/controller/text_post_comment_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class TextPostCommentScreen extends StatelessWidget {
  const TextPostCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<TextPostCommentController>()) {
      Get.put(TextPostCommentController());
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      backgroundColor: AppColors.colorGreyScalGrey,
      body: SafeArea(
        child: GetBuilder<TextPostCommentController>(
          builder: (c) {
            return Column(
              children: [
                _topBar(context),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                    children: [
                      _textHeaderCard(),
                      10.height,
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                        child: Column(children: _buildCommentWidgets(c)),
                      ),
                      10.height,
                    ],
                  ),
                ),
                _inputBar(controller: c),
              ],
            );
          },
        ),
      ),
       
           bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.colourPrimaryPurple,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.r),
            topRight: Radius.circular(28.r),
          ),
        ),
        child: const SafeArea(
          top: false,
          child: CommonBottomNavBar(currentIndex: 20),
        ),
      ),
  
   
    );
  }

  Widget _topBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 14.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.colorPrimaryPink.withOpacity(0.6), width: 1.w)),
        color: AppColors.colourPrimaryPurple,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 2), blurRadius: 4)],
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: () => Get.back(), child: Icon(Icons.arrow_back, color: AppColors.white, size: 40.h)),
          CommonImage(imageSrc: AppImages.logoWithBg, height: 40.h, width: 115.w, fill: BoxFit.contain),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.white, width: 2)),
            child: ClipOval(child: CommonImage(imageSrc: AppImages.man, height: 48.h, width: 48.w, fill: BoxFit.cover)),
          ),
        ],
      ),
    );
 }

  // Static text header card (title + body + meta) per screenshot
  Widget _textHeaderCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colourGreyScaleGreyTint60,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Left visuals
              Column(
                children: [
              
                  
                  InkWell(
                    onTap: () => _showPostActions(),
                    child: Container(
                      height: 50.w,
                      width: 50.w,
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(7.w),
                        child: CommonImage(
                          imageSrc: AppIcons.settings,
                          height: 30.sp,
                          width: 30.sp,
                          fill: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  14.height,
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Column(
                      children: [
                        CommonImage(imageSrc: AppIcons.comment, height: 22.sp, width: 22.sp, fill: BoxFit.contain),
                        4.height,
                        CommonText(text: '22', fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
                        10.height,
                        Icon(Icons.favorite, color: AppColors.red, size: 22.sp),
                        4.height,
                        CommonText(text: '145', fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
                      ],
                    ),
                  ),
                  14.height,
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                    child: ClipOval(
                      child: CommonImage(imageSrc: AppImages.man, height: 54.w, width: 54.w, fill: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              10.width,
              // Right: static title + body + meta
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      fontSize: 24,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w700,
                      color: AppColors.colourPrimaryPurple,
                    ),
                    7.height,
                    Stack(
                      children: [
                        CommonText(
                          text:
                              'Curabitur non arcu diam. Nullam egestas tincidunt lorem et ullamcorper. Morbi lacinia purus vel lobortis pellentesque. Vestibulum id ipsum nec libero fringilla posuere. Vivamus pretium quam nec tellus sodales vestibulum. Donec tristique velit mauris, et eleifend ante tincidunt in. Curabitur non arcu diam. Nullam egestas tincidunt lorem et ullamcorper. Morbi lacinia purus vel lobortis pellentesque. Vestibulum id ipsum nec libero fringilla posuere. Vivamus pretium quam nec tellus sodales vestibulum. Donec tristique velit mauris, et eleifend ante tincidunt in. Curabitur non arcu diam. Nullam egestas tincidunt lorem et ullamcorper. Morbi lacinia purus vel lobortis pellentesque. Vestibulum id ipsum nec libero fringilla posuere. Vivamus pretium quam nec tellus sodales vestibulum. Donec tristique velit mauris, et eleifend ante tincidunt in.',
                          fontSize: 16,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w400,
                          color: AppColors.colorPrimaryBlack,
                          maxLines: 25,
                        ),
                     ],
                    ),
                    10.height,

                    CommonText(text: "Aliquam id tempor libero.", 
                    fontSize: 16,
                     fontWeight: FontWeight.w400,
                     bottom: 7,
                      color: AppColors.colorPrimaryBlack),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
                        children: const [
                          TextSpan(
                            text: '@poleninja',
                            style: TextStyle(
                              color: AppColors.colorPrimaryBlue,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.colorPrimaryBlue,
                            ),
                          ),
                          TextSpan(text: '  •  4m read  •  3d ago'),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== Comments + input (same behavior as image screen) =====

  List<Widget> _buildCommentWidgets(TextPostCommentController c) {
    final tiles = <Widget>[];
    int i = 0;
    while (i < c.comments.length) {
      Comment? reply;
      int? replyIndex;
      if (i + 1 < c.comments.length && c.comments[i + 1].isReply) {
        reply = c.comments[i + 1];
        replyIndex = i + 1;
        i += 2;
      } else {
        i += 1;
      }
      tiles.add(
        _commentTile(index: i - (reply != null ? 2 : 1), controller: c, inlineReply: reply, replyIndex: replyIndex),
      );
    }
    if (tiles.isEmpty) return tiles;

    final withDividers = <Widget>[];
    for (var t = 0; t < tiles.length; t++) {
      withDividers.add(tiles[t]);
      if (t != tiles.length - 1) {
        withDividers.add(
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8),
            child: Divider(height: 1, thickness: 1, color: AppColors.colourGreyScaleGreyTint40),
          ),
        );
      }
    }
    return withDividers;
  }

  Widget _commentTile({
    required int index,
    required TextPostCommentController controller,
    Comment? inlineReply,
    int? replyIndex,
  }) {
    final cm = controller.comments[index];
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.only(left: cm.isReply ? 18.w : 12.w, right: 12.w, top: 12.h, bottom: 10.h),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                  child: ClipOval(
                    child: CommonImage(imageSrc: AppImages.man, height: 40.w, width: 40.w, fill: BoxFit.cover),
                  ),
                ),
                if (inlineReply != null)
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10.h, bottom: 40.h),
                      width: 1,
                      color: AppColors.colourGreyScaleGreyTint60,
                    ),
                  ),
              ],
            ),
            10.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: cm.handle,
                                style: const TextStyle(
                                  color: AppColors.colorPrimaryBlue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.colorPrimaryBlue,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: '  •  ${cm.time}',
                                style: TextStyle(color: AppColors.colorPrimaryBlack.withOpacity(0.7), fontWeight: FontWeight.w600),
                              ),
                            ],
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.toggleLike(index),
                        child: Icon(
                          cm.liked ? Icons.favorite : Icons.favorite_border,
                          color: cm.liked ? AppColors.red : AppColors.colourGreyScaleGreyTint60,
                          size: 20.sp,
                        ),
                      ),
                    ],
                  ),
                  6.height,
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.colorPrimaryBlack),
                      children: _mentionSpans(cm.text),
                    ),
                  ),
                  8.height,
                  Row(
                    children: [
                      CommonImage(imageSrc: AppIcons.reply, height: 18.sp, width: 18.sp, fill: BoxFit.contain),
                    ],
                  ),
                  if (inlineReply != null) ...[
                    18.height,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                                child: ClipOval(
                                  child: CommonImage(imageSrc: AppImages.man, height: 40.w, width: 40.w, fill: BoxFit.cover),
                                ),
                              ),
                              10.width,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: inlineReply.handle,
                                                  style: const TextStyle(
                                                    color: AppColors.colorPrimaryBlue,
                                                    decoration: TextDecoration.underline,
                                                    decorationColor: AppColors.colorPrimaryBlue,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '  •  ${inlineReply.time}',
                                                  style: TextStyle(color: AppColors.colorPrimaryBlack.withOpacity(0.7), fontWeight: FontWeight.w600),
                                                ),
                                              ],
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Icon(
                                          inlineReply.liked ? Icons.favorite : Icons.favorite_border,
                                          color: inlineReply.liked ? AppColors.red : AppColors.colourGreyScaleGreyTint60,
                                          size: 18.sp,
                                        ),
                                      ],
                                    ),
                                    6.height,
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.colorPrimaryBlack),
                                        children: _mentionSpans(inlineReply.text),
                                      ),
                                    ),
                                    8.height,
                                    Row(
                                      children: [
                                        CommonImage(imageSrc: AppIcons.reply, height: 18.sp, width: 18.sp, fill: BoxFit.contain),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<InlineSpan> _mentionSpans(String text) {
    final spans = <InlineSpan>[];
    final regex = RegExp(r'@([A-Za-z0-9_]+)');
    int start = 0;
    for (final match in regex.allMatches(text)) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }
      final mention = text.substring(match.start, match.end);
      spans.add(TextSpan(
        text: mention,
        style: const TextStyle(
          color: AppColors.colourPrimaryPurple,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.colorPrimaryBlue,
          fontWeight: FontWeight.w700,
        ),
      ));
      start = match.end;
    }
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }
    return spans;
  }

  Widget _inputBar({required TextPostCommentController controller}) {
    return SafeArea(
      top: false,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h, top: 6.h),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.colourGreyScaleGreyTint40,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  TextField(
                    controller: controller.inputCtrl,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (v) => controller.addComment(v),
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 14.w, right: 44.w, top: 12.h, bottom: 12.h),
                    ),
                  ),
                  Positioned(
                    right: 12.w,
                    child: ValueListenableBuilder<TextEditingValue>(
                      valueListenable: controller.inputCtrl,
                      builder: (_, value, __) {
                        final hasText = value.text.trim().isNotEmpty;
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 120),
                          switchInCurve: Curves.easeOut,
                          switchOutCurve: Curves.easeIn,
                          child: hasText
                              ? GestureDetector(
                                  key: const ValueKey('send-visible'),
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () => controller.addComment(value.text),
                                  child: CommonImage(
                                    imageSrc: AppIcons.commentSent,
                                    height: 22.sp,
                                    width: 22.sp,
                                    fill: BoxFit.contain,
                                  ),
                                )
                              : const SizedBox.shrink(key: ValueKey('send-hidden')),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
void _showPostActions() {
  // Reserve space for bottom bar so the sheet sits above it.
  // Adjust this if your CommonBottomNavBar is taller.
  final reservedForBottomBar = 72.h; // approx height of your bottom bar + SafeArea

  Get.bottomSheet(
    Padding(
      padding: EdgeInsets.only(bottom: reservedForBottomBar),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // drag handle
              Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 6.h),
                child: Container(
                  width: 48.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: AppColors.colourGreyScaleGreyTint40,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
              Divider(height: 1, thickness: 1, color: AppColors.colourGreyScaleGreyTint40),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                title: CommonText(
                  text: 'Edit',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.colorPrimaryBlue,
                ),
                onTap: () {
                  // TODO: implement edit
                  Get.back();
                },
              ),
              Divider(height: 1, thickness: 1, color: AppColors.colourGreyScaleGreyTint40),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                title: CommonText(
                  text: 'Delete',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.red,
                ),
                onTap: () {
                  // TODO: implement delete
                  Get.back();
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}}