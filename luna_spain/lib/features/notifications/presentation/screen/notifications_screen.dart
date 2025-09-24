import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: Column(
        children: [
          _TopBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 8.h),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: AppString.notifications,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColors.colourPrimaryPurple,
                      bottom: 12.h,
                    ).center,

                    _Section(title: AppString.today),
                    10.height,
                    _NotificationTile(
                      avatar: AppImages.man,
                      username: '@polesolife',
                      text: ' liked and commented on\none of your recent posts 5 hours ago.',
                    ),
                    _Divider(),
                    _NotificationTile(
                      avatar: AppImages.man,
                      username: '@joshua',
                      text: ' liked one of your recent\nposts 13 hours ago.',
                    ),
                    _Divider(),
                    _NotificationTile(
                      avatar: AppImages.man,
                      username: '@vickanss',
                      text: ' liked and commented on one\nof your recent posts 16 hours ago.',
                    ),

                    16.height,
                    _Section(title: AppString.yesterday),
                    10.height,
                    _NotificationTile(
                      avatar: AppImages.man,
                      username: '@stackpeople',
                      text: ' liked one of your recent\nposts 33 hours ago.',
                    ),
                    _Divider(),
                    _NotificationTile(
                      avatar: AppImages.man,
                      username: '@karterin23',
                      text: ' liked one of your recent\nposts 38 hours ago.',
                    ),
                    _Divider(),
                    _NotificationTile(
                      avatar: AppImages.man,
                      username: '@katiegardas',
                      text: ' liked one of your recent\nposts 38 hours ago.',
                    ),
                    _Divider(),
                    _NotificationTile(
                      avatar: AppImages.man,
                      username: '@jimmiele',
                      text: ' liked and commented on one\nof your recent posts 39 hours ago.',
                    ),

                    16.height,
                    _Section(title: AppString.twoDaysAgo),
                    10.height,
                    _NotificationTile(
                      avatar: AppImages.man,
                      username: '@getahoppgirl',
                      text: ' liked one of your recent\nposts 42 hours ago.',
                    ),
                    _Divider(),
                    _NotificationTile(
                      avatar: AppImages.man,
                      username: '@getahoppgirl',
                      text: ' liked one of your recent\nposts 42 hours ago.',
                    ),
                    _Divider(),
                    _NotificationTile(
                      avatar: AppImages.man,
                      username: '@stackpole',
                      text: ' liked one of your recent\nposts 33 hours ago.',
                    ),
                    _Divider(),
                    _NotificationTile(
                      avatar: AppImages.man,
                      username: '@karterin23',
                      text: ' liked one of your recent\nposts 38 hours ago.',
                    ),
                  ],
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
        child: const SafeArea(top: false, child: CommonBottomNavBar(currentIndex: 8)),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final String avatar;
  final String username;
  final String text;
  const _NotificationTile({required this.avatar, required this.username, required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18.r),
          child: CommonImage(imageSrc: avatar, height: 40.sp, width: 40.sp, fill: BoxFit.cover),
        ),
        10.width,
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: username,
                  style: TextStyle(
                    color: AppColors.colorPrimaryBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
                TextSpan(
                  text: text,
                  style: TextStyle(
                    color: AppColors.colorPrimaryBlack,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  const _Section({required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(right: 12.w),
            color: AppColors.colourPrimaryPurple,
          ),
        ),
        CommonText(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.colourPrimaryPurple,
        ),
        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(left: 12.w),
            color: AppColors.colourPrimaryPurple,
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: AppColors.colourGreyScaleGreyTint60,
      margin: EdgeInsets.symmetric(vertical: 12.h),
    );
  }
}

class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 14.h),
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
          InkWell(onTap: () => Get.back(), child: Icon(Icons.arrow_back, color: AppColors.white, size: 40.h)),
          CommonText(
            text: AppString.notifications,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
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
}
