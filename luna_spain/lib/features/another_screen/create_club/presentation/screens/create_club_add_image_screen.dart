import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/features/another_screen/create_club/presentation/controller/create_club_add_image_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import 'package:luna_spain/config/route/app_routes.dart';

class CreateClubAddImageScreen extends StatelessWidget {
  const CreateClubAddImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CreateClubAddImageController>()) {
      Get.put(CreateClubAddImageController());
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.splashBg, fit: BoxFit.cover),
          SafeArea(
            child: GetBuilder<CreateClubAddImageController>(
              builder: (c) {
                return Column(
                  children: [
                    _topBar(),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            22.height,
                            _stepperSection(),
                            16.height,
                            _card(c),
                            50.height,
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h, bottom: 14.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.colorPrimaryPink.withOpacity(0.6),
            width: 1.w,
          ),
        ),
        color: AppColors.colourPrimaryPurple,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 2), blurRadius: 4),
        ],
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: () => Get.back(), child: Icon(Icons.arrow_back, color: AppColors.white, size: 40.h)),
          CommonImage(imageSrc: AppImages.logoWithBg, height: 40.h, width: 115.w, fill: BoxFit.contain),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.white, width: 2)),
            child: ClipOval(child: CommonImage(imageSrc: AppImages.man, height: 48.h, width: 48.w, fill: BoxFit.cover)),
          ),
        ],
      ),
    );
  }

  Widget _stepperSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        children: [
          // Step 1 done
          Container(
            height: 45.h,
            width: 45.w,
            padding: EdgeInsets.all(7.r),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.colorPrimaryGreen, width: 4)),
            child: CommonImage(imageSrc: AppIcons.check, height: 20.h, width: 20.w, fill: BoxFit.contain),
          ),
          Expanded(child: Container(height: 5.h, color: AppColors.colorPrimaryGreen)),
          // Step 2 done
          Container(
            height: 45.h,
            width: 45.w,
            padding: EdgeInsets.all(7.r),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.colorPrimaryGreen, width: 4)),
            child: CommonImage(imageSrc: AppIcons.check, height: 20.h, width: 20.w, fill: BoxFit.contain),
          ),
          Expanded(child: Container(height: 5.h, color: AppColors.colorPrimaryOrange)),
          // Step 3 current
          Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.colorPrimaryOrange, width: 4)),
            child: Center(
              child: CommonText(text: '3', fontSize: 22, fontWeight: FontWeight.w500, color: AppColors.colorPrimaryBlack),
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(CreateClubAddImageController c) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(text: 'Club profile', fontSize: 36, fontWeight: FontWeight.w600, color: AppColors.colourPrimaryPurple, bottom: 28).center,

          CommonText(text: 'CLUB LOGO', fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.colorPrimaryBlack, bottom: 8),
          _filePickerRow(
            fileName: c.logoFileName(),
            onPick: c.pickClubLogo,
            onRemove: c.removeClubLogo,
          ),

          16.height,

          CommonText(text: 'CLUB HEADER IMAGE', fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.colorPrimaryBlack, bottom: 8),
          _filePickerRow(
            fileName: c.headerFileName(),
            onPick: c.pickClubHeader,
            onRemove: c.removeClubHeader,
          ),

          24.height,

          CommonButton(
            titleText: 'Finish',
            onTap: () => Get.offNamed(AppRoutes.clubProfile),
            buttonColor: AppColors.colorPrimaryGreen,
            borderColor: AppColors.colorSecondaryGreen,
            titleColor: AppColors.colorPrimaryBlack,
            buttonRadius: 7,
            buttonHeight: 52,
            titleSize: 20,
            borderWidth: 2,
            titleWeight: FontWeight.w600,
          ),

          12.height,
          CommonText(
            text: 'All form fields are required for form submission',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.colorPrimaryBlack,
          ).center,
        ],
      ),
    );
  }

  Widget _filePickerRow({required String? fileName, required VoidCallback onPick, required VoidCallback onRemove}) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(color: AppColors.colourGreyScaleGreyTint40, border: Border.all(color: AppColors.colourGreyScaleGreyTint60), borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: onPick,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
              child: CommonText(text: 'Select file...', fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
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
                  GestureDetector(onTap: onRemove, child: Icon(Icons.close, size: 20.sp, color: AppColors.colorPrimaryBlack)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
