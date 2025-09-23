import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import '../widgets/do_this_latter_popup.dart';
import '../controller/add_profile_picture_controller.dart';

class AddProfilePictureScreen extends StatelessWidget {
  const AddProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GetBuilder<AddProfilePictureController>(
        init: AddProfilePictureController(),
        builder: (controller) => Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(AppImages.splashBg, fit: BoxFit.cover),
            SafeArea(
              child: Column(
                children: [
                  // Top bar with logo and avatar
                  Container(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 40.h,
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
                            border: Border.all(
                              color: AppColors.white,
                              width: 2,
                            ),
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
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          22.height,
                          _stepperSection(),
                          16.height,
                          // Card
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(24.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: AppString.yourProfile,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.colourPrimaryPurple,
                                  bottom: 28,
                                ).center,

                                // Profile Picture selector
                                CommonText(
                                  text: 'PROFILE PICTURE',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.colorPrimaryBlack,
                                  bottom: 8,
                                ),
                                _filePickerRow(
                                  fileName: controller.profileFileName(),
                                  onPick: controller.pickProfileImage,
                                  onRemove: controller.removeProfileImage,
                                ),

                                16.height,

                                // Header Image selector
                                CommonText(
                                  text: 'PROFILE HEADER IMAGE',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.colorPrimaryBlack,
                                  bottom: 8,
                                ),
                                _filePickerRow(
                                  fileName: controller.headerFileName(),
                                  onPick: controller.pickHeaderImage,
                                  onRemove: controller.removeHeaderImage,
                                ),

                                24.height,

                                // Finish button
                                CommonButton(
                                  titleText: 'Finish',
                                  onTap: () =>
                                      Get.offAllNamed(AppRoutes.profileEmpty),
                                  isLoading: false,
                                  buttonColor: const Color(0xFF4ECDC4),
                                  borderColor: const Color(0xFF4ECDC4),
                                  titleColor: AppColors.colorPrimaryBlack,
                                  buttonRadius: 12,
                                  buttonHeight: 56,
                                  titleSize: 18,
                                  borderWidth: 0,
                                  titleWeight: FontWeight.w600,
                                ),

                                16.height,
                                Container(
                                  height: 1.h,
                                  width: double.infinity,
                                  color: AppColors.colourGreyScaleGreyTint60,
                                ),
                                16.height,

                                GestureDetector(
                                  onTap: () => DoThisLaterPopup.show(
                                    onYes: () =>
                                        Get.offAllNamed(AppRoutes.profile),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 48.h,
                                    child: Center(
                                      child: CommonText(
                                        underline: true,
                                        text: AppString.illDoThisLater,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.colorPrimaryBlue,
                                      ),
                                    ),
                                  ),
                                ),

                                12.height,
                                CommonText(
                                  text: AppString.allFieldsRequired,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.colorPrimaryBlack,
                                ).center,
                              ],
                            ),
                          ),

                          50.height,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stepperSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            height: 45.h,
            width: 45.w,
            padding: EdgeInsets.all(7.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.colorPrimaryGreen, width: 4),
            ),
            child: CommonImage(
              imageSrc: AppIcons.check,
              height: 20.h,
              width: 20.w,
              fill: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Container(height: 5.h, color: AppColors.colorPrimaryGreen),
          ),
          Container(
            height: 45.h,
            width: 45.w,
            padding: EdgeInsets.all(7.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.colorPrimaryGreen, width: 4),
            ),
            child: CommonImage(
              imageSrc: AppIcons.check,
              height: 20.h,
              width: 20.w,
              fill: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Container(height: 5.h, color: AppColors.colorPrimaryOrange),
          ),
          Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.colorPrimaryOrange, width: 4),
            ),
            child: Center(
              child: CommonText(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppColors.colorPrimaryBlack,
                text: "3",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filePickerRow({
    required String? fileName,
    required VoidCallback onPick,
    required VoidCallback onRemove,
  }) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.colourGreyScaleGreyTint40,
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: onPick,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: CommonText(
                text: 'Select file...',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.colorPrimaryBlack,
              ),
            ),
          ),
          12.width,
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CommonText(
                    text: fileName ?? 'No file selected',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black_300,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (fileName != null) ...[
                  8.width,
                  GestureDetector(
                    onTap: onRemove,
                    child: Icon(
                      Icons.close,
                      size: 20.sp,
                      color: AppColors.colorPrimaryBlack,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
