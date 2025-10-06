import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }

    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<HomeController>(
        builder: (c) {
          final posts = c.posts;
          return Column(
            children: [
             _topBar(context),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 12.h,
                  ),
                  itemBuilder: (context, index) {
                    final p = posts[index];
                    if (p.type == HomePostType.image) {
                      return _ImagePost(
                        image: p.image!,
                        caption: p.caption!,
                        authorHandle: p.authorHandle,
                        meta: p.meta,
                        comments: p.comments,
                        likes: p.likes,
                        bookmarks: p.bookmarks,
                      );
                    } else {
                      return _TextPost(
                        title: p.title!,
                        body: p.body!,
                        authorHandle: p.authorHandle,
                        meta: p.meta,
                        comments: p.comments,
                        likes: p.likes,
                        bookmarks: p.bookmarks,
                      );
                    }
                  },
                  separatorBuilder: (_, __) => 12.height,
                  itemCount: posts.length,
                ),
              ),
            ],
          );
        },
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
          child: CommonBottomNavBar(currentIndex: 0),
        ),
      ),
    );
  }
}

  Widget _topBar(context) {
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

         GestureDetector(
  onTap: () => Get.toNamed(AppRoutes.drawer),
  child: CommonImage(
    imageSrc: AppIcons.drawer,
    height: 40.h,
    width: 40.w,
    fill: BoxFit.contain,
  ),
),


          CommonImage(
            imageSrc: AppImages.logoWithBg,
            height: 40.h,
            width: 115.w,
            fill: BoxFit.contain,
          ),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 2),
            ),
            child: ClipOval(
              child: CommonImage(
                imageSrc: AppImages.man,
                height: 48.h,
                width: 48.w,
                fill: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

class _ImagePost extends StatelessWidget {
  final String image;
  final String caption;
  final String authorHandle;
  final String meta; // e.g. "14h ago"
  final int comments;
  final int likes;
  final int bookmarks;
  const _ImagePost({
    required this.image,
    required this.caption,
    required this.authorHandle,
    required this.meta,
    required this.comments,
    required this.likes,
    required this.bookmarks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: SizedBox(
          height: 465.h,
          width: double.infinity,
          child: Stack(
            children: [
              // Image background
              Positioned.fill(
                child: CommonImage(imageSrc: image, fill: BoxFit.cover),
              ),

              // Subtle gradient to improve caption readability at bottom
              Positioned(
                left: 0,

                right: 0,
                bottom: 70.h,
                height: 100.h,
                child: IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.35),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Left vertical stats pill floating over image
              Positioned(
                left: 10.w,
                bottom: 100.h,
                child: _LeftStats(
                  comments: comments,
                  likes: likes,
                  bookmarks: bookmarks,
                  onCommentsTap: () {
                    
                  },
                ),
              ),

              // Bottom dark overlay caption area
              Positioned(
                left: 0.w,
                right: 0.w,
                bottom: 0.h,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 14.w,
                    right: 12.w,
                    top: 12.h,
                    bottom: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.colorGreyScalBlack60,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.r),
                      bottomRight: Radius.circular(12.r),
                    ),
                  ),
                  child: Row(
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Caption with bottom fade overlay to create subtle shadow on last lines
                            Stack(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                    children: _captionSpans(caption),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  height: 26.h,
                                  child: IgnorePointer(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            AppColors.colorGreyScalBlack60
                                                .withOpacity(0.05),
                                            AppColors.colorGreyScalBlack60
                                                .withOpacity(0.02),
                                            AppColors.colorGreyScalBlack60,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            6.height,
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: authorHandle,
                                    style: TextStyle(
                                      color: AppColors.colorPrimaryPink,
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          AppColors.colorPrimaryPink,
                                      decorationThickness: 1.5,
                                    ),
                                  ),
                                  TextSpan(
                                    style: TextStyle(fontSize: 18.sp),
                                    text: '  •  ',
                                  ),
                                  TextSpan(text: meta),
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

              // Small avatar overlapping the bottom overlay on the left
            ],
          ),
        ),
      ),
    );
  }

  // Build styled spans for caption: highlight @mentions with pink and underline
  List<InlineSpan> _captionSpans(String text) {
    final spans = <InlineSpan>[];
    final mentionRegex = RegExp(r'@\w+');
    int start = 0;
    for (final match in mentionRegex.allMatches(text)) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }
      final mention = text.substring(match.start, match.end);
      spans.add(
        TextSpan(
          text: mention,
          style: const TextStyle(
            color: AppColors.colorPrimaryPink,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.colorPrimaryPink,
          ),
        ),
      );
      start = match.end;
    }
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }
    return spans;
  }
}

class _TextPost extends StatelessWidget {
  final String title;
  final String body;
  final String authorHandle;
  final String meta; // e.g. "4m read  •  3d ago"
  final int comments;
  final int likes;
  final int bookmarks;
  const _TextPost({
    required this.title,
    required this.body,
    required this.authorHandle,
    required this.meta,
    required this.comments,
    required this.likes,
    required this.bookmarks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colourGreyScaleGreyTint60,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Main row content
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      height: 50.w,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
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
                    14.height,
                    _LeftStats(
                      comments: comments,
                      likes: likes,
                      bookmarks: bookmarks,
                      dark: false,
                      commentColor: AppColors.colorPrimaryBlack,
                      likeColor: AppColors.red,
                    ),


                    14.height,

                         Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.white,
                                width: 2,
                              ),
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
                        
                  ],
                ),
                10.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      33.height,
                      CommonText(
                        text: title,
                        fontSize: 24,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w700,
                        color: AppColors.colourPrimaryPurple,
                      ),
                      // Body with bottom fade overlay to create a white shadow on last lines
                      Padding(
                        padding: EdgeInsets.only(top: 7.h),
                        child: Stack(
                          children: [
                            // The actual description text
                            CommonText(
                              text: body,
                              fontSize: 16,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorPrimaryBlack,
                              maxLines: 6,
                            ),
                            // Bottom gradient to fade out last lines into card background
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              height: 60.h,
                              child: IgnorePointer(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppColors.colourGreyScaleGreyTint60
                                            .withOpacity(0.0),
                                        AppColors.colourGreyScaleGreyTint60
                                            .withOpacity(0.80),
                                        AppColors.colourGreyScaleGreyTint60,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                       10.height,
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                          // Avatar
                    
                          // Handle + meta styled
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.colorPrimaryBlack,
                                ),
                                children: [
                                  TextSpan(
                                    text: authorHandle,
                                    style: const TextStyle(
                                      color: AppColors.colorPrimaryBlue,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.colorPrimaryBlue,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  •  ',
                                    style: TextStyle(
                                      color: AppColors.colorPrimaryBlack
                                          ,
                                    ),
                                  ),
                                  TextSpan(
                                    text: meta,
                                    style: TextStyle(
                                      color: AppColors.colorPrimaryBlack
                                       ,
                                    ),
                                  ),
                                ],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
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
    );
  }
}

class _LeftStats extends StatelessWidget {
  final int comments;
  final int likes;
  final int bookmarks;

  final bool dark; // when used on white cards
  final Color? likeColor;
  final Color? commentColor;
  final VoidCallback? onCommentsTap;
  const _LeftStats({
    required this.comments,
    required this.likes,
    required this.bookmarks,
    this.dark = true,
    this.likeColor,
    this.commentColor,
    this.onCommentsTap,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = dark ? Colors.white : AppColors.colorPrimaryBlack;
    final resolvedLikeColor = likeColor ?? baseColor;
    final resolvedCommentColor = commentColor ?? baseColor;

    Widget stat(Widget iconWidget, String label, Color color) {
      return Column(
        children: [
          iconWidget,
          4.height,
          CommonText(
            text: label,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: dark ? AppColors.white : AppColors.colorPrimaryBlack,
          ),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
      decoration: BoxDecoration(
        color: dark ? AppColors.colorGreyScalBlack60 : AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: dark
            ? null
            : Border.all(color: AppColors.white),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onCommentsTap,
            child: stat(
              CommonImage(
                imageSrc: dark ? AppIcons.commentWhite : AppIcons.comment,
                height: 24.sp,
                width: 24.sp,
                fill: BoxFit.contain,
              ),
              comments.toString(),
              resolvedCommentColor,
            ),
          ),
          14.height,
          stat(
            Icon(
              dark ? Icons.favorite_border : Icons.favorite,
              color: resolvedLikeColor,
              size: 25.sp,
            ),
            likes.toString(),
            resolvedLikeColor,
          ),
        ],
      ),
    );
  }
}
