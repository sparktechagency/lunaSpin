import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class SettingsPrivacyScreen extends StatelessWidget {
  const SettingsPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: Size(0, 0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),

      body: Column(
        children: [
          _TopBar(),

          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: 'Settings & Privacy',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.colourPrimaryPurple,
                            bottom: 12.h,
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


                      25.height,
                      _SettingsTile(
                        title: 'Edit Profile',
                        onTap: () => Get.toNamed(AppRoutes.editProfile),
                      ),
                      _SettingsTile(
                        title: 'Share Profile',
                        onTap: () {
                          // TODO: Implement share functionality
                          Get.snackbar('Share', 'Share Profile coming soon');
                        },
                      ),
                      _SettingsTile(
                        title: 'Notification Settings',
                        onTap: () => Get.toNamed(AppRoutes.notificationSettings),
                      ),
                      _SettingsTile(
                        title: 'Privacy Settings',
                        onTap: () => Get.toNamed(AppRoutes.privacySettings),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 0),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _SettingsTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colourGreyScaleGreyTint40,
          borderRadius: BorderRadius.circular(7.r),
        ),
        margin: EdgeInsets.only(bottom: 7.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: title,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.colorPrimaryBlack,
            ),
            const Icon(
              Icons.arrow_forward,
              size: 22,
              color: AppColors.colorPrimaryBlack,
            ),
          ],
        ),
      ),
    );
  }
}



class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          InkWell(onTap: () => Get.back(), child: Icon(Icons.arrow_back, color: AppColors.white, size: 40.h)),
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
}
