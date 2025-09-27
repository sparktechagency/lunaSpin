import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/features/another_screen/user_home/presentation/controller/image_post_comment_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class ImagePostCommentScreen extends StatelessWidget {
  const ImagePostCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ImagePostCommentController>()) {
      Get.put(ImagePostCommentController());
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: SafeArea(
        child: GetBuilder<ImagePostCommentController>(
          builder: (c) {
            return Column(
              children: [
                _topBar(context),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 12.h,
                    ),
                    children: [
                      // Image card header
                      _imageHeaderCard(),
                      10.height,
                      // Comments list (merge inline replies under their parent)
                      ..._buildCommentWidgets(c),
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
      backgroundColor: AppColors.colorGreyScalGrey,
    );
  }

  Widget _topBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 15.h,
        bottom: 14.h,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.colorPrimaryPink.withOpacity(0.6),
            width: 1.w,
          ),
        ),
        color: AppColors.colourPrimaryPurple,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: Get.back,
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          10.width,
          CommonText(
            text: 'LunaSpin',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          const Spacer(),
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipOval(
              child: CommonImage(
                imageSrc: AppImages.man,
                height: 36.w,
                width: 36.w,
                fill: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageHeaderCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
       // border: Border.all(color: Colors.white.withOpacity(0.6), width: 1.5),
     
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image with overlay stats on left + gear on right
            SizedBox(
              height: 400.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CommonImage(
                      imageSrc: AppImages.todayImageTwo,
                      fill: BoxFit.cover,
                    ),
                  ),

                  // Left vertical stats pill
                  Positioned(
                    left: 10.w,
                    bottom: 16.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.colorGreyScalBlack60,
                        borderRadius: BorderRadius.circular(14.r),
                     
                      ),
                      child: Column(
                        children: [
                          CommonImage(
                            imageSrc: AppIcons.commentWhite,
                            height: 22.sp,
                            width: 22.sp,
                            fill: BoxFit.contain,
                          ),
                          4.height,
                          CommonText(
                            text: '22',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          10.height,
                          Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                          4.height,
                          CommonText(
                            text: '145',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom-right gear icon button over image
                  Positioned(
                    right: 10.w,
                    bottom: 16.h,
                    child: Container(
                      width: 50.w,
                      height: 50.w,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: AppColors.colorGreyScalBlack60,
                        shape: BoxShape.circle,
                    
                      ),
                      child: CommonImage(
                        imageSrc: AppIcons.settingsWhite,
                     
                        fill: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Caption area matches screenshot
            Container(
              color: AppColors.colorGreyScalBlack60,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipOval(
                      child: CommonImage(
                        imageSrc: AppImages.man,
                        height: 54.w,
                        width: 54.w,
                        fill: BoxFit.cover,
                      ),
                    ),
                  ),

                  14.width,

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Paragraph first, full width
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            children: _hashtagSpans(
                              "What a night 🎭 2024 showcase it was a pleasure. 🥳 Just want to say a very big thank you to everyone. You know who you are, and you mean the world to me! #ThankYou #PoleNinjas",
                            ),
                          ),
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                        10.height,
                        // Row with avatar + handle and time
                        10.width,
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            children: const [
                              TextSpan(
                                text: '@georginaleon',
                                style: TextStyle(
                                  color: AppColors.colorPrimaryPink,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.colorPrimaryPink,
                                ),
                              ),
                              TextSpan(text: '  •  14h ago'),
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
          ],
        ),
      ),
    );
  }

  Widget _commentTile({
    required int index,
    required ImagePostCommentController controller,
    Comment? inlineReply,
    int? replyIndex,
  }) {
    final cm = controller.comments[index];
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.only(
        left: cm.isReply ? 18.w : 12.w,
        right: 12.w,
        top: 12.h,
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar (slightly smaller for replies)
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipOval(
              child: CommonImage(
                imageSrc: AppImages.man,
                height: cm.isReply ? 30.w : 40.w,
                width: cm.isReply ? 30.w : 40.w,
                fill: BoxFit.cover,
              ),
            ),
          ),
          10.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: handle (blue, underlined) + dot + time, heart at right
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
                              style: TextStyle(
                                color: AppColors.colorPrimaryBlack.withOpacity(0.7),
                                fontWeight: FontWeight.w600,
                              ),
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
                // Body with @mentions highlighted
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.colorPrimaryBlack,
                    ),
                    children: _mentionSpans(cm.text),
                  ),
                ),
                8.height,
                // Reply arrow
                Row(
                  children: [
                    CommonImage(
                      imageSrc: AppIcons.reply,
                      height: 18.sp,
                      width: 18.sp,
                      fill: BoxFit.contain,
                    ),
                  ],
                ),
                // Inline reply block (if provided)
                if (inlineReply != null) ...[
                  10.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left guide line
                      Container(
                        width: 14.w,
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 2.w,
                          height: 54.h,
                          color: AppColors.colourGreyScaleGreyTint60,
                        ),
                      ),
                      6.width,
                      // Reply avatar + content
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: ClipOval(
                                child: CommonImage(
                                  imageSrc: AppImages.man,
                                  height: 30.w,
                                  width: 30.w,
                                  fill: BoxFit.cover,
                                ),
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
                                                style: TextStyle(
                                                  color: AppColors.colorPrimaryBlack.withOpacity(0.7),
                                                  fontWeight: FontWeight.w600,
                                                ),
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
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.colorPrimaryBlack,
                                      ),
                                      children: _mentionSpans(inlineReply.text),
                                    ),
                                  ),
                                  8.height,
                                  Row(
                                    children: [
                                      CommonImage(
                                        imageSrc: AppIcons.reply,
                                        height: 18.sp,
                                        width: 18.sp,
                                        fill: BoxFit.contain,
                                      ),
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
    );
  }

  Widget _inputBar({required ImagePostCommentController controller}) {
    return Container(
      padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 10.h, top: 8.h),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.colourGreyScaleGreyTint40,
                borderRadius: BorderRadius.circular(22.r),
              ),
              child: TextField(
                controller: controller.inputCtrl,
                decoration: const InputDecoration(
                  hintText: 'Add a comment...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          8.width,
          GestureDetector(
            onTap: () => controller.addComment(controller.inputCtrl.text),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.colourPrimaryPurple,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: CommonText(
                text: 'Post',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build styled spans for hashtags within the caption paragraph
  List<InlineSpan> _hashtagSpans(String text) {
    final spans = <InlineSpan>[];
    final regex = RegExp(r'(#[A-Za-z0-9_]+)');
    int start = 0;
    for (final match in regex.allMatches(text)) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }
      final tag = text.substring(match.start, match.end);
      spans.add(const TextSpan(
        text: '',
      ));
      spans.add(TextSpan(
        text: tag,
        style: const TextStyle(
          color: AppColors.colorPrimaryPink,
          decoration: TextDecoration.underline,
          fontSize: 16,
          decorationColor: AppColors.colorPrimaryPink,
          fontWeight: FontWeight.w600,
        ),
      ));
      start = match.end;
    }
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }
    return spans;
  }

  // Build styled spans for @mentions inside a comment
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

  // Build comment widgets merging one inline reply after each parent comment
  List<Widget> _buildCommentWidgets(ImagePostCommentController c) {
    final widgets = <Widget>[];
    int i = 0;
    while (i < c.comments.length) {
      final main = c.comments[i];
      Comment? reply;
      int? replyIndex;
      if (i + 1 < c.comments.length && c.comments[i + 1].isReply) {
        reply = c.comments[i + 1];
        replyIndex = i + 1;
        i += 2;
      } else {
        i += 1;
      }
      widgets.add(_commentTile(index: i - (reply != null ? 2 : 1), controller: c, inlineReply: reply, replyIndex: replyIndex));
    }
    return widgets;
  }
}
