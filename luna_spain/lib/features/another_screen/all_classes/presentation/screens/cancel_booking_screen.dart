import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import '../controller/cancel_booking_controller.dart';

class CancelBookingScreen extends StatelessWidget {
  const CancelBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CancelBookingController>()) {
      Get.put(CancelBookingController());
    }

    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<CancelBookingController>(builder: (c) {
        return Column(
          children: [
            _TopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 14.h),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 28.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _screenTitle('Cancel Booking'),
                      14.height,
                      const CommonText(
                        text:
                            "We're sorry to see you're thinking of cancelling your class. We hope you're OK!",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorPrimaryBlack,
                        textAlign: TextAlign.start,
                        maxLines: 4,
                      ),
                      14.height,
                      const CommonText(
                        text:
                            'Once submitted, this action cannot be cancelled. Please confirm you understand this by agreeing to the below.',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorPrimaryBlack,
                        textAlign: TextAlign.start,
                        maxLines: 4,
                      ),
                      30.height,
                      // Checkbox 1
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24.w,
                            height: 24.w,
                            child: Checkbox(
                              value: c.agreeReallocation,
                              onChanged: c.toggleAgreeReallocation,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                              fillColor: MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.selected)) {
                                  return AppColors.colourPrimaryPurple;
                                }
                                return const Color(0xFFF0F0F0);
                              }),
                              side: MaterialStateBorderSide.resolveWith((states) {
                                if (states.contains(MaterialState.selected)) {
                                  return BorderSide(color: AppColors.colourPrimaryPurple, width: 1.5);
                                }
                                return const BorderSide(color: Colors.transparent, width: 0);
                              }),
                            ),
                          ),
                          10.width,
                          const Expanded(
                            child: CommonText(
                              text:
                                  '* I understand that once this booking cancellation request has been submitted, I will loose my class allocation and that it will be reallocated to somebody else.',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorPrimaryBlack,
                              maxLines: 10,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      16.height,
                      // Checkbox 2 with underline links
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24.w,
                            height: 24.w,
                            child: Checkbox(
                              value: c.agreePolicies,
                              onChanged: c.toggleAgreePolicies,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                              fillColor: MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.selected)) {
                                  return AppColors.colourPrimaryPurple;
                                }
                                return const Color(0xFFF0F0F0);
                              }),
                              side: MaterialStateBorderSide.resolveWith((states) {
                                if (states.contains(MaterialState.selected)) {
                                  return BorderSide(color: AppColors.colourPrimaryPurple, width: 1.5);
                                }
                                return const BorderSide(color: Colors.transparent, width: 0);
                              }),
                            ),
                          ),
                          10.width,
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.colorPrimaryBlack,
                                ),
                                children: [
                                  const TextSpan(text: '* I confirm that I have read and will comply with the '),
                                  TextSpan(
                                    text: 'Terms and Conditions',
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.colorPrimaryBlack,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    recognizer: c.termsTap..onTap = () {
                                      // TODO: Navigate to terms screen if needed
                                      Get.toNamed(AppRoutes.termsOfServices);
                                    },
                                  ),
                                  const TextSpan(text: ', and '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.colorPrimaryBlack,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    recognizer: c.privacyTap..onTap = () {
                                      // TODO: Navigate to privacy policy
                                      Get.toNamed(AppRoutes.privacyPolicy);
                                    },
                                  ),
                                  const TextSpan(text: '.'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      20.height,
                      CommonButton(
                        titleText: 'Submit cancellation',
                        onTap: c.submit,
                        isLoading: c.isSubmitting,
                        buttonColor: AppColors.colorNoticeError,
                        borderColor: AppColors.colorNoticeWaring,
                        titleColor: AppColors.white,
                        buttonRadius: 10,
                        buttonHeight: 48,
                        titleSize: 18,
                        borderWidth: 2,
                        titleWeight: FontWeight.w600,
                      ),
                      12.height,
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: const Center(
                            child: CommonText(
                              underline: true,
                              text: 'Cancel',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.colorPrimaryBlack,
                            ),
                          ),
                        ),
                      ),
                      8.height,
                      const CommonText(
                        text: 'All form fields are required for form submission',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorGreyScalBlack60,
                      ).center,
                    ],
                  ),
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

Widget _screenTitle(String title) {
  return Row(
    children: [
      CommonText(
        text: title,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.colorNoticeError,
      ),
      8.width,
      Expanded(
        child: Container(height: 1.5.h, color: AppColors.colorPrimaryBlack.withOpacity(0.2)),
      ),
      8.width,
      Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: AppColors.colorGreyScalBlack60, width: 2),
        ),
        child: ClipOval(
          child: CommonImage(
            imageSrc: AppImages.clubLogo,
            fill: BoxFit.contain,
          ),
        ),
      ),
    ],
  );
}
