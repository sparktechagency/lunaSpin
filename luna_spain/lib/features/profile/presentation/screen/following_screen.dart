import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import 'package:luna_spain/features/profile/presentation/controller/following_controller.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FollowingController controller = Get.put(FollowingController());
    final users = controller.users;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: AppColors.colourPrimaryPurple,
        ),
      ),
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.colorGreyScalGrey,

          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            _TopBar(),

            Expanded(
              child: Scrollbar(
                thumbVisibility: false,
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  padding: EdgeInsets.zero,
                  child: Container(
                    margin: EdgeInsets.only(top: 14.h, right: 7.w, left: 7.w, bottom: 16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: AppColors.colorGreyScalBlack20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
                          child: Center(
                            child: CommonText(
                              text: 'Following',
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: AppColors.colourGreyScaleBlack,
                            ),
                          ),
                        ),
                   
                        ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final u = users[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                     
                                     shape: BoxShape.circle,
                                     border: Border.all(color: AppColors.white, width: 2)
                                        ),
                                    child: ClipOval(
                                      child: CommonImage(
                                        imageSrc: AppImages.man,
                                        height: 40.r,
                                        width: 40.r,
                                        fill: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  10.width,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: u['name'] as String,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.colourPrimaryPurple,
                                        ),
                                        4.height,
                                        CommonText(
                                          text: u['handle'] as String,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.colorPrimaryBlue,
                                        ),
                                      ],
                                    ),
                                  ),
                                  _UnfollowPill(onTap: () {}),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(left: 12.w, right: 12.w),
                            child: Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.colorGreyScalBlack80,
                            ),
                          ),
                          itemCount: users.length,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

        105.height
       ],
        ),
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

          Icon(Icons.arrow_back, color: AppColors.white, size: 40.h),


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

class _UnfollowPill extends StatelessWidget {
  final VoidCallback onTap;
  const _UnfollowPill({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: AppColors.colourGreyScaleGreyTint40,
          borderRadius: BorderRadius.circular(16.r),
        //  border: Border.all(color: AppColors.colorPrimaryPink, width: 1),
        ),
        child: CommonText(
          text: 'Unfollow',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.colorNoticeError,
        ),
      ),
    );
  }
}

