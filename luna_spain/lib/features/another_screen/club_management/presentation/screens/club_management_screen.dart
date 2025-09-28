import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/controller/club_management_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class ClubManagementScreen extends StatelessWidget {
  const ClubManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ClubManagementController>()) {
      Get.put(ClubManagementController());
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 0.h),
        child: AppBar(
          backgroundColor: AppColors.colourPrimaryPurple,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _TopBar(),

            7.height,
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(7.w),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 24.h),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: 'Club Management',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.colourPrimaryPurple,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.colorGreyScalGrey),
                              ),
                              child: CircleAvatar(
                                radius: 25.r,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child: CommonImage(
                                    imageSrc: AppImages.clubLogo,
                                    height: 48.r,
                                    width: 48.r,
                                    fill: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        30.verticalSpace,

                        // Top actions
                        _rowTile('New Post', onTap: () => Get.toNamed(AppRoutes.nawClubPost)),
                        7.verticalSpace,
                        _rowTile('Notifications'),
                        7.verticalSpace,
                        _rowTile('Share Club'),

                        28.verticalSpace,
                        _sectionHeader('Booking Settings'),
                        28.verticalSpace,
                        _rowTile('Manage Classes'),
                        7.verticalSpace,
                        _rowTile('Payment Settings'),
                        7.verticalSpace,
                        _rowTile('Cancellation Settings'),
                        7.verticalSpace,
                        _rowTile('Waiting List Settings'),

                        28.verticalSpace,
                        _sectionHeader('Club Settings'),
                        28.verticalSpace,
                        _rowTile('Edit Profile', onTap: () => Get.toNamed(AppRoutes.editClub)),
                        7.verticalSpace,
                        _rowTile(
                          onTap: () => Get.toNamed(AppRoutes.premiumFeatures),
                          'Premium Features'),
                        7.verticalSpace,
                        _rowTile(
                          onTap: () => Get.toNamed(AppRoutes.clubNotificationSettings),
                          'Notification Settings'),
                        7.verticalSpace,
                        _rowTile('Privacy Settings', onTap: () => Get.toNamed(AppRoutes.clubPrivacy)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(height: MediaQuery.of(context).padding.bottom),
      backgroundColor: const Color(0xFFF4F6F8),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      children: [
        CommonText(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.colourPrimaryPurple,
          right: 14,
        ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.colourPrimaryPurple,
          ),
        ),
      ],
    );
  }

  Widget _rowTile(String title, {VoidCallback? onTap}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.colourGreyScaleGreyTint40,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.r),
        child: Row(
          children: [
            Expanded(
              child: CommonText(
                text: title,
                textAlign: TextAlign.start,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.colorPrimaryBlack,
              ),
            ),
            Icon(Icons.arrow_forward,
            
            size: 25.sp,
             color: AppColors.colorPrimaryBlack),
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
