import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/extensions/extension.dart';

class LunaChatScreen extends StatelessWidget {
  const LunaChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final msgs = _demoConversation;

    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: Column(
        children: [
          const _TopBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              child: Container(
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
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header user info
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.white, width: 2),
                            ),
                            child: ClipOval(
                              child: CommonImage(
                                imageSrc: AppImages.man,
                                height: 44.w,
                                width: 44.w,
                                fill: BoxFit.cover,
                              ),
                            ),
                          ),
                          10.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: 'Georgina Leon',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.colorPrimaryBlack,
                              ),
                              CommonText(
                                text: '@georginaleon',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.colorPrimaryBlue,
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.height,
                      Container(height: 1, color: AppColors.colourGreyScaleGreyTint60),
                      16.height,

                      // Conversation list (scrollable only)
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: msgs.length,
                          itemBuilder: (_, i) {
                            final m = msgs[i];
                            if (m.images?.isNotEmpty == true) {
                              return _ImageBubble(
                                isMe: m.isMe,
                                images: m.images!,
                                time: m.time,
                              );
                            }
                            if (m.banner != null) {
                              return _Banner(text: m.banner!);
                            }
                            return _TextBubble(
                              isMe: m.isMe,
                              text: m.text!,
                              time: m.time,
                            );
                          },
                        ),
                      ),

                      10.height,

                      // Input (fixed)
                      _InputBar(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
          child: CommonBottomNavBar(currentIndex: 2),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 12.h, bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.colourPrimaryPurple,
        border: Border(
          bottom: BorderSide(
            color: AppColors.colorPrimaryPink.withOpacity(0.6),
            width: 1.w,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: Get.back, child: Icon(Icons.arrow_back, color: AppColors.white, size: 30.sp)),
          CommonImage(
            imageSrc: AppImages.logoWithBg,
            height: 36.h,
            width: 110.w,
            fill: BoxFit.contain,
          ),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 2),
            ),
            child: ClipOval(
              child: CommonImage(
                imageSrc: AppImages.man,
                height: 40.h,
                width: 40.w,
                fill: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextBubble extends StatelessWidget {
  final bool isMe;
  final String text;
  final String time;
  const _TextBubble({required this.isMe, required this.text, required this.time});

  @override
  Widget build(BuildContext context) {
    // Latest color choices
    final bg = isMe ? AppColors.colorPrimaryBlackTint80 : AppColors.colourGreyScaleGreyTint60;
    final textColor = isMe ? Colors.white : AppColors.colourPrimaryPurple;
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = BorderRadius.only(
      topLeft: Radius.circular(14.r),
      topRight: Radius.circular(14.r),
      bottomLeft: Radius.circular(isMe ? 14.r : 4.r),
      bottomRight: Radius.circular(isMe ? 4.r : 14.r),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: Get.width * 0.5),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(color: bg, borderRadius: radius),
            child: Column(
              children: [
                CommonText(
                  text: text,
                  fontSize: 16,
                  maxLines: 10,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  textAlign: TextAlign.start,
                ),
                4.height,
                CommonText(
                  text: time,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isMe ? AppColors.white : AppColors.colorPrimaryBlack,
                ).end,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final bool isMe;
  final List<String> images;
  final String time;
  const _ImageBubble({required this.isMe, required this.images, required this.time});

  @override
  Widget build(BuildContext context) {
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: AppColors.colourGreyScaleGreyTint60,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: images
                  .map((img) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: CommonImage(
                            imageSrc: img,
                            height: 110.w,
                            width: 110.w,
                            fill: BoxFit.cover,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          4.height,
          CommonText(
            text: time,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.colorPrimaryBlack,
          ),
        ],
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  final String text;
  const _Banner({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.colorPrimaryOrange,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: CommonText(
            text: text,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.colorPrimaryBlack,
          ),
        ),
      ),
    );
  }
}

class _InputBar extends StatefulWidget {
  @override
  State<_InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<_InputBar> {
  final TextEditingController _ctrl = TextEditingController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          ],
          border: Border.all(color: AppColors.colourGreyScaleGreyTint60, width: 0.6),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top input row
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.colourGreyScaleGreyTint40,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ctrl,
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: 'Type your message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: send message
                      _ctrl.clear();
                    },
                    child: Icon(Icons.send, color: AppColors.colorPrimaryBlue, size: 22.sp),
                  ),
                ],
              ),
            ),
            // Divider
            Container(
              height: 1,
              color: AppColors.colourGreyScaleGreyTint60,
            ),
            // Bottom toolbar row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Row(
                children: [

                  Icon(Icons.image_outlined, color: AppColors.colorGreyScalBlack60),
                  
                  10.width,
                  
                  Icon(Icons.emoji_emotions_outlined, color: AppColors.colorGreyScalBlack60),
               //   _ToolbarIconBox(icon: Icons.image_outlined),
                  12.width,
                 // _ToolbarIconCircle(icon: Icons.emoji_emotions_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ToolbarIconBox extends StatelessWidget {
  final IconData icon;
  const _ToolbarIconBox({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 28.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60, width: 1),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 18.sp, color: AppColors.colorPrimaryBlack.withOpacity(0.7)),
    );
  }
}

class _ToolbarIconCircle extends StatelessWidget {
  final IconData icon;
  const _ToolbarIconCircle({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.w,
      height: 28.w,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60, width: 1),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 18.sp, color: AppColors.colorPrimaryBlack.withOpacity(0.7)),
    );
  }
}

class _Msg {
  final bool isMe;
  final String? text;
  final String time;
  final List<String>? images;
  final String? banner;
  _Msg.text({required this.isMe, required this.text, required this.time})
      : images = null,
        banner = null;
  _Msg.images({required this.isMe, required this.images, required this.time})
      : text = null,
        banner = null;
  _Msg.banner(this.banner)
      : isMe = false,
        text = null,
        time = '',
        images = null;
}

final _demoConversation = <_Msg>[
  _Msg.text(isMe: true, text: 'Hey, how are you Georgie?', time: '4:56 pm'),
  _Msg.text(
    isMe: true,
    text: 'Could you send me the recordings from todays class please?',
    time: '4:57 pm',
  ),
  _Msg.text(isMe: false, text: 'Hey! Sure thing, let me send now...', time: '6:21 pm'),
  _Msg.images(isMe: false, images: [AppImages.man, AppImages.man], time: '6:22 pm'),
  _Msg.banner('The media will expire in 2 weeks from date sent.'),
  _Msg.text(isMe: true, text: 'OMG, thank you 🙌', time: '7:01 pm'),
];