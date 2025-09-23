import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class ProfileEmptyScreen extends StatelessWidget {
  const ProfileEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      extendBody: true, // let background render under the bottom nav bar

      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(AppImages.profileBg, fit: BoxFit.cover),
          ),
          // Subtle overlay for readability
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.25),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                _topBar(),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // _successBanner(),
                        70.height,
                        20.height,
                        _avatarSection(),
                        14.height,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.followers),
                              child: CommonText(
                                text: '1 Followers',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),

                            7.width,
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.following),
                              child: CommonText(
                                text: '0 Following',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                                top: 0,
                                bottom: 0,
                              ),
                            ),
                          ],
                        ),

                        14.height,
                        CommonText(
                          text: 'Georgina Leon',
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                        14.height,
                        Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: [
                            _chip('United Kingdom'),
                            _chip('4 Years'),
                            _chip('Intermediate'),
                          ],
                        ),
                        120.height, // leave breathing room since we dock the card above the nav bar
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Docked "Let's get started" card above bottom navigation bar
          Positioned(
            left: 10.w,
            right: 10.w,
            bottom:
                MediaQuery.of(context).padding.bottom +
                60.h +
                0.h, // nav bar height + inset + spacing
            child: _getStartedCard(),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.colourPrimaryPurple, // iOS safe area color
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.r),
            topRight: Radius.circular(28.r),
          ),
        ),

        child: SafeArea(top: false, child: CommonBottomNavBar(currentIndex: 3)),
      ),
    );
  }

  Widget _topBar() {
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

          CommonImage(
            imageSrc: AppIcons.drawer,
            height: 40.h,
            width: 40.w,
            fill: BoxFit.contain,
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

  // Widget _successBanner() {
  //   return Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
  //     decoration: BoxDecoration(
  //       color: AppColors.colorSecondaryGreen,
  //       borderRadius: BorderRadius.circular(12.r),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.1),
  //           blurRadius: 8,
  //           offset: const Offset(0, 3),
  //         ),
  //       ],
  //     ),
  //     child: CommonText(
  //       text: 'Your account has been setup and your\nprofile personalised.',
  //       fontSize: 14,
  //       fontWeight: FontWeight.w600,
  //       color: AppColors.colorPrimaryBlack,
  //       maxLines: 2,
  //       textAlign: TextAlign.left,
  //     ),
  //   );
  // }

  Widget _avatarSection() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.2),
          ),
          child: Container(
            padding: EdgeInsets.all(4.r),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: 74.r,
              backgroundColor: AppColors.colourGreyScaleGreyTint40,

              child: ClipOval(
                child: CommonImage(
                  imageSrc: AppImages.lunaLogo, // fallback icon
                  height: 148.r,
                  width: 148.r,
                  fill: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        12.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _circleIconButton(AppIcons.share, onTap: () {}),
            12.width,
            _followButton(),
          ],
        ),
      ],
    );
  }

  Widget _circleIconButton(String asset, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: AppColors.colorNotice,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.share, color: AppColors.white, size: 25.sp),
      ),
    );
  }

  Widget _followButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorPrimaryGreen,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.colorSecondaryGreen, width: 3.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 14.h),
        child: CommonText(
          text: 'Follow',
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.colorPrimaryBlack,
        ),
      ),
    );
  }

  Widget _chip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.colorGreyScalBlack60.withOpacity(0.8),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: CommonText(
        text: label,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    );
  }

  Widget _getStartedCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(28.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2C4B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: "Let's get started",
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            bottom: 21,
          ).center,
          Row(
            children: [
              4.width,
              Expanded(
                child: _ctaButton(
                  label: 'Find friends',
                  borderColor: AppColors.colourSecondaryGoldenhaze,
                  color: AppColors.colorNoticeWaring,
                  onTap: () {},
                ),
              ),
              14.width,
              Expanded(
                child: _ctaButton(
                  label: 'Create a post',
                  borderColor: AppColors.colorSecondaryGreen,
                  color: const Color(0xFF4ECDC4),
                  onTap: () {},
                ),
              ),

              4.width,
            ],
          ),

          10.height,
        ],
      ),
    );
  }

  Widget _ctaButton({
    required String label,
    required Color borderColor,
    required Color color,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor, width: 2.h),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: CommonText(
            text: label,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.colorPrimaryBlack,
          ),
        ),
      ),
    );
  }
}
