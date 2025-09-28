import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/controller/close_club_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class CloseClubScreen extends StatelessWidget {
  const CloseClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CloseClubController>()) {
      Get.put(CloseClubController());
    }

    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<CloseClubController>(builder: (c) {
        final remaining = c.maxChars - c.feedbackController.text.length;
        return Column(
          children: [
            _TopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 14.h),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  child: Form(
                    key: c.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        CommonText(
                          text: "Close [CLUB-NAME]",
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorNoticeError,
                        ).center,
                        14.height,
                        // Subtitle
                        CommonText(
                          text: "We’re sorry to see you closing the club so soon. Tell us why you’re closing this club?",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorPrimaryBlack,
                          textAlign: TextAlign.start,
                          maxLines: 4,
                        ),
                        28.height,

                        // Feedback label + counter
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: AppString.feedback,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.colorPrimaryBlack,
                            ),
                            CommonText(
                              text: AppString.maxCharacters200,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.colorPrimaryBlack,
                            ),
                          ],
                        ),
                        8.height,

                        // Multiline feedback input
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.colourGreyScaleGreyTint40,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: TextFormField(
                            controller: c.feedbackController,
                            maxLines: 5,
                            maxLength: c.maxChars,
                            buildCounter: (
                              context, {
                              required int currentLength,
                              required bool isFocused,
                              required int? maxLength,
                            }) => const SizedBox.shrink(),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: AppString.feedbackHint,
                              hintStyle: TextStyle(
                                color: AppColors.colourGreyScaleBlack,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            validator: c.validateFeedback,
                            onChanged: (_) => c.update(),
                          ),
                        ),
                        8.height,
                        CommonText(
                          text: '$remaining',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.colorPrimaryBlack,
                        ).end,

                        12.height,
                        // Confirm checkbox
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24.w,
                              height: 24.w,
                              child: Checkbox(
                                value: c.confirmed,
                                onChanged: c.toggleConfirmed,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                                fillColor: MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return AppColors.colourPrimaryPurple;
                                  }
                                  return const Color(0xFFF0F0F0); // light grey when unchecked
                                }),
                                side: MaterialStateBorderSide.resolveWith((states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return BorderSide(color: AppColors.colourPrimaryPurple, width: 1.5);
                                  }
                                  return const BorderSide(color: Colors.transparent, width: 0); // no border when unchecked
                                }),
                              ),
                            ),
                            10.width,
                            Expanded(
                              child: CommonText(
                                text: AppString.confirmDeletionText,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.colorPrimaryBlack,
                                maxLines: 10,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),

                        20.height,
                        // Submit button (red)
                        CommonButton(
                          titleText: AppString.submitRequest,
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
                        // Cancel link
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: SizedBox(
                            width: double.infinity,
                            height: 48.h,
                            child: Center(
                              child: CommonText(
                                underline: true,
                                text: AppString.cancel,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.colorPrimaryBlack,
                              ),
                            ),
                          ),
                        ),
                        8.height,
                        // Footer note
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
