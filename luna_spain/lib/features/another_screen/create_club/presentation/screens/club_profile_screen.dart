import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/features/another_screen/create_club/presentation/controller/club_profile_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class ClubProfileScreen extends StatelessWidget {
  const ClubProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ClubProfileController>()) {
      Get.put(ClubProfileController());
    }
    return Scaffold(
      appBar:  PreferredSize(preferredSize: Size(0, 0), child: AppBar(backgroundColor: AppColors.colourPrimaryPurple)),
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(child: Image.asset(AppImages.clubProfileBg, fit: BoxFit.cover)),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.05),
                  Colors.black.withOpacity(0.25),
                ],
              ),
            ),
          ),
          SafeArea(
            child: GetBuilder<ClubProfileController>(builder: (c) {
              return Column(
                children: [
                  _topBar(context),
                //  if (c.showSuccessBanner.value) _successBanner(onClose: c.dismissBanner),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          40.height,
                          _avatarSection(),
                          14.height,
                          CommonText(text: '1 Members', fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.colorPrimaryPink),
                          14.height,
                          CommonText(text: 'Pole Ninjas', fontSize: 36, fontWeight: FontWeight.w600, color: AppColors.white),
                          8.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(width: 12.r, height: 12.r, decoration: const BoxDecoration(color: AppColors.colorPrimaryGreen, shape: BoxShape.circle)),
                              6.width,
                              CommonText(text: 'Last active just now', fontSize: 16, fontWeight: FontWeight.w400, color:AppColors.colorPrimaryGreen),
                            ],
                          ),
                          10.height,
                          Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            alignment: WrapAlignment.center,
                            children: [
                              _chip('London, UK', AppColors.colorPrimaryPurpleTint80),
                              _chip('All Levels', AppColors.colorPrimaryPurpleTint80),
                            ],
                          ),
                          16.height,
                          CommonText(
                            text:
                                "We're a small pole family based in Shepperton, Surrey, who share a passion for pole and movement. We run classes for complete beginners to advanced polers and everyone is welcome here.",
                            fontSize: 14,
                            maxLines: 10,
                         
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            textAlign: TextAlign.center,
                          ),
                          170.height,
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          Positioned(
            left: 10.w,
            right: 10.w,
            bottom: MediaQuery.of(context).padding.bottom + 60.h + 0.h,
            child: _getStartedCard(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.colourPrimaryPurple,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(28.r), topRight: Radius.circular(28.r)),
        ),
        child: SafeArea(top: false, child: CommonBottomNavBar(currentIndex: 8)),
      ),
    );
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

  Widget _successBanner({required VoidCallback onClose}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.colorSecondaryGreen,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: CommonText(
              text: 'Great! Your club setup has been successful.',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.colorPrimaryBlack,
            ),
          ),
          GestureDetector(onTap: onClose, child: Icon(Icons.close, color: AppColors.colorPrimaryBlack, size: 20.sp)),
        ],
      ),
    );
  }

  Widget _avatarSection() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Container(
            padding: EdgeInsets.all(2.r),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: CircleAvatar(
              radius: 74.r,
              backgroundColor: AppColors.colourGreyScaleGreyTint40,
              child: ClipOval(child: CommonImage(imageSrc: AppImages.clubLogo, height: 148.r, width: 148.r, fill: BoxFit.fill)),
            ),
          ),
        ),
        12.height,
        _circleIconButton(AppIcons.share, onTap: () {}),
      ],
    );
  }

  Widget _circleIconButton(String asset, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(padding: EdgeInsets.all(10.r), decoration: BoxDecoration(color: AppColors.colorNotice, shape: BoxShape.circle), child: Icon(Icons.share, color: AppColors.white, size: 25.sp)),
    );
  }

  Widget _chip(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(color: color.withOpacity(0.9), borderRadius: BorderRadius.circular(14.r)),
      child: CommonText(text: label, fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
    );
  }

  Widget _getStartedCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(28.w),
      decoration: BoxDecoration(color: AppColors.colorGreyScalBlack60, borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(text: "Let's get started", fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white, bottom: 21).center,
          Row(
            children: [
              4.width,
              Expanded(child: _ctaButton(label: 'Create a post', borderColor: AppColors.colorSecondaryGreen, color: const Color(0xFF4ECDC4), onTap: () {})),
              14.width,
              Expanded(child: _ctaButton(label: 'Add a class', borderColor: AppColors.colourSecondaryGoldenhaze, color: AppColors.colorNoticeWaring, onTap: () {})),
              4.width,
            ],
          ),
          10.height,
        ],
      ),
    );
  }

  Widget _ctaButton({required String label, required Color borderColor, required Color color, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(color: color, border: Border.all(color: borderColor, width: 2.h), borderRadius: BorderRadius.circular(10.r)),
        child: Center(child: CommonText(text: label, fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack)),
      ),
    );
  }
}
