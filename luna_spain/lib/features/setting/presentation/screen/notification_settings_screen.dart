import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/features/setting/presentation/controller/notification_settings_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<NotificationSettingsController>()) {
      Get.put(NotificationSettingsController());
    }
    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<NotificationSettingsController>(builder: (c) {
        return Column(
          children: [
            _TopBar(),
        
        
        
        
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        14.height,
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: AppString.notificationSettings,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: AppColors.colorPrimaryBlack,
                            bottom: 12.h,
                          ).center,
                  
                          12.height,
                  
                          // 3-option groups
                          _SectionTitle(AppString.likesOnYourPosts),
                          _CardRadioThree(
                            groupValue: c.likesOnYourPosts,
                            onChanged: c.setLikesOnYourPosts,
                          ),
                  
                          _SectionTitle(AppString.commentsOnYourPosts),
                          _CardRadioThree(
                            groupValue: c.commentsOnYourPosts,
                            onChanged: c.setCommentsOnYourPosts,
                          ),
                  
                          _SectionTitle(AppString.likesCommentsTagged),
                          _CardRadioThree(
                            groupValue: c.likesCommentsOnTagged,
                            onChanged: c.setLikesCommentsOnTagged,
                          ),
                  
                          // 2-option groups
                          _SectionTitle(AppString.newFollowers),
                          _CardRadioTwo(
                            groupValue: c.newFollowers,
                            onChanged: c.setNewFollowers,
                          ),
                  
                          _SectionTitle(AppString.acceptedFollowRequests),
                          _CardRadioTwo(
                            groupValue: c.acceptedFollowRequests,
                            onChanged: c.setAcceptedFollowRequests,
                          ),
                  
                          _SectionTitle(AppString.messageRequests),
                          _CardRadioTwo(
                            groupValue: c.messageRequests,
                            onChanged: c.setMessageRequests,
                          ),
                  
                          _SectionTitle(AppString.clubCommunityMessages),
                          _CardRadioTwo(
                            groupValue: c.clubCommunityMessages,
                            onChanged: c.setClubCommunityMessages,
                          ),
                  
                          _SectionTitle(AppString.clubClassBookingUpdates),
                          _CardRadioTwo(
                            groupValue: c.clubClassBookingUpdates,
                            onChanged: c.setClubClassBookingUpdates,
                          ),
                  
                          _SectionTitle(AppString.birthdays),
                          _CardRadioTwo(
                            groupValue: c.birthdays,
                            onChanged: c.setBirthdays,
                          ),
                  
                          24.height,
                  
                          CommonButton(
                            titleText: AppString.save,
                            onTap: () {
                              Get.back();
                              Get.snackbar(AppString.notificationSettings, AppString.save);
                            },
                            isLoading: false,
                            buttonColor: AppColors.colorPrimaryGreen,
                            borderColor: AppColors.colorSecondaryGreen,
                            titleColor: AppColors.colorPrimaryBlack,
                            buttonRadius: 12,
                            buttonHeight: 56,
                            titleSize: 18,
                            borderWidth: 2,
                            titleWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),

                    20.height
                  ],
                ),
              ),
            ),
          ],
        );
      }),
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

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
      child: CommonText(
        text: text,
        fontSize: 16,
        maxLines: 2,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w500,
        color: AppColors.colorPrimaryBlack,
      ),
    );
  }
}

class _CardRadioThree extends StatelessWidget {
  final int groupValue; // 0 Off, 1 Follow, 2 Everyone
  final ValueChanged<int> onChanged;
  const _CardRadioThree({required this.groupValue, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          _RadioRow(label: AppString.optionOff, value: 0, groupValue: groupValue, onChanged: onChanged),
          _RadioRow(label: AppString.optionFromProfilesIFollow, value: 1, groupValue: groupValue, onChanged: onChanged),
          _RadioRow(label: AppString.optionFromEveryone, value: 2, groupValue: groupValue, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _CardRadioTwo extends StatelessWidget {
  final int groupValue; // 0 Off, 1 On
  final ValueChanged<int> onChanged;
  const _CardRadioTwo({required this.groupValue, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          _RadioRow(label: AppString.optionOff, value: 0, groupValue: groupValue, onChanged: onChanged),
          _RadioRow(label: AppString.optionOn, value: 1, groupValue: groupValue, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _RadioRow extends StatelessWidget {
  final String label;
  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;
  const _RadioRow({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool selected = value == groupValue;

    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          children: [
            // Custom dot-style selector
            Container(
              width: 22.w,
              height: 22.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colourGreyScaleGreyTint40, // light grey outer circle
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? AppColors.colourPrimaryPurple : AppColors.colourGreyScaleGreyTint40,
                  ),
                ),
              ),
            ),
            11.width,
            CommonText(
              text: label,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.colourGreyScaleBlack,
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
