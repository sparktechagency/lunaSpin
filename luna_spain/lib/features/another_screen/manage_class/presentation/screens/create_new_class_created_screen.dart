import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class CreateNewClassClassCreatedScreen extends StatelessWidget {
  const CreateNewClassClassCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: Column(
        children: [
          const _TopBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _headerWithBadge('Class Created'),
                    16.height,
                    _stepperComplete(),
                    22.height,

                    // Hand emoji area + heading
                    Column(
                      children: [
                        CommonImage(
                          imageSrc:AppIcons.goodToSee, // If not present, replace with a suitable image or remove
                          height: 120.h,
                          width: 120.w,
                          fill: BoxFit.contain,
                        ),
                        14.height,
                        const CommonText(
                          text: 'How exciting!',
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colourPrimaryPurple,
                        ),
                      ],
                    ).center,

                    14.height,

                    RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.colorPrimaryBlack),
          children: [
            const TextSpan(text: 'Your '),
            TextSpan(text: "[CLASS-NAME]", style: const TextStyle(fontWeight: FontWeight.w700)),
            const TextSpan(text: ' class has been created, '),
                        TextSpan(text: "but not yet open for booking!", style: const TextStyle(fontWeight: FontWeight.w700)),

          ],
        ),
      ).center,
   

                   
                    14.height,
                    const CommonText(
                      text: "Your class won’t be open for bookings until\nthe live status has been set to ‘Available’ within the class overview.",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.colorGreyScalBlack60,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                    ).center,
                    18.height,

                    // Key/value info lines

                    SizedBox(
                      width: double.infinity,
                      child: Column(
                       
                        children: [
                          _kvLine('Class ID', '239774127').center,
                          _kvLine('Class Status', 'Closed').center,
                          _kvLine('Class Cost', '£XX.XX').center,
                          _kvLine('Maximum Attendees', 'XX').center,
                        ],
                      ),
                    ),
                    28.height,

                    // Primary action
                    CommonButton(
                      titleText: 'Go to class overview',
                      onTap: () => Get.toNamed(AppRoutes.createNewClassOverview),
                      buttonColor: AppColors.colorPrimaryGreen,
                      borderColor: AppColors.colorSecondaryGreen,
                      titleColor: AppColors.colorPrimaryBlack,
                      buttonRadius: 10,
                      buttonHeight: 48,
                      titleSize: 20,
                      borderWidth: 2,
                      titleWeight: FontWeight.w600,
                    ),
                    28.height,

                    // Secondary link
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.manageClasses),
                      child: const CommonText(
                        underline: true,
                        text: 'Back to all classes',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorPrimaryBlue,
                      ).center,
                    ),
                    8.height,
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
        child: const SafeArea(top: false, child: CommonBottomNavBar(currentIndex: 58)),
      ),
    );
  }
}

Widget _kvLine(String k, String v) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.h),
    child: Row(
    
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonText(
          text: '$k:',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.colorPrimaryBlack,
        ),
        CommonText(
          text: v,
          fontSize: 16,
          left: 5,
          fontWeight: FontWeight.w600,
          color: AppColors.colorPrimaryBlack,
        ),
      ],
    ),
  );
}

class _TopBar extends StatelessWidget {
  const _TopBar();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 14.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.colorPrimaryPink.withOpacity(0.6), width: 1.w)),
        color: AppColors.colourPrimaryPurple,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 2), blurRadius: 4)],
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: () => Get.back(), child: Icon(Icons.arrow_back, color: AppColors.white, size: 40.h)),
          const CommonImage(imageSrc: AppImages.logoWithBg, height: 40, width: 115, fill: BoxFit.contain),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.white, width: 2)),
            child: const ClipOval(child: CommonImage(imageSrc: AppImages.man, height: 48, width: 48, fill: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}

Widget _headerWithBadge(String title) {
  return Row(
    children: [
      CommonText(
        text: title,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.colourPrimaryPurple,
      ),
      8.width,
      Expanded(child: Container(height: 1.5.h, color: AppColors.colourPrimaryPurple)),
      8.width,
      Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, border: Border.all(color: AppColors.colorGreyScalBlack60, width: 2)),
        child: const ClipOval(child: CommonImage(imageSrc: AppImages.clubLogo, fill: BoxFit.contain)),
      ),
    ],
  );
}

Widget _stepperComplete() {
  return Column(
    children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16.r)),
        child: Row(
          children: [
            _circleCheck(),
            _bar(AppColors.colorPrimaryGreen),
            _circleCheck(),
            _bar(AppColors.colorPrimaryGreen),
            _circleCheck(),
            _bar(AppColors.colorPrimaryGreen),
            _circleCheck(),
          ],
        ),
      ),
      6.height,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CommonText(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.colorPrimaryGreen, text: "Information"),
          CommonText(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.colorPrimaryGreen, text: "Date & Time"),
          CommonText(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.colorPrimaryGreen, text: "Ticket & Cost"),
          CommonText(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.colorPrimaryGreen, text: "Confirm"),
        ],
      ),
    ],
  );
}

Widget _circleCheck() {
  return Container(
    height: 45.h,
    width: 45.w,
    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.colorPrimaryGreen, width: 4)),
    child: Center(child: CommonImage(imageSrc: AppIcons.check, height: 20.h, width: 20.w, fill: BoxFit.contain)),
  );
}

Widget _bar(Color color) {
  return Expanded(child: Container(height: 5.h, decoration: BoxDecoration(color: color)));
}