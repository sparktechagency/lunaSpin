import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/component/text_field/common_text_field.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/features/another_screen/profile_details/presentation/widgets/do_this_latter_popup.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import 'package:luna_spain/utils/helpers/other_helper.dart';
import '../controller/add_profile_details_controller.dart';

class AddProfileDetailsScreen extends StatelessWidget {
  const AddProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.splashBg, fit: BoxFit.cover),
          SafeArea(
            child: GetBuilder<AddProfileDetailsController>(
              init: AddProfileDetailsController(),
              builder: (controller) {
                return Column(
                  children: [
                    // Top bar with logo and profile
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

                    // Main content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            22.height,
                            stepperSection(),

                            16.height,

                            // Form container
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(24.w),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Form(
                                key: controller.formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title
                                    CommonText(
                                      text: AppString.yourDetails,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.colourPrimaryPurple,
                                      bottom: 28,
                                    ).center,

                                    // First Name
                                    CommonText(
                                      text: AppString.firstName.toUpperCase(),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.colorPrimaryBlack,
                                      bottom: 8,
                                    ),
                                    CommonTextField(
                                      controller:
                                          controller.firstNameController,
                                      hintText: AppString.firstNameHint,
                                      validator: OtherHelper.validator,
                                      fillColor:
                                          AppColors.colourGreyScaleGreyTint40,
                                      borderColor: AppColors.colourGreyScaleGreyTint60,
                                      
                                      borderRadius: 8,
                                    ),

                                    16.height,

                                    // Last Name
                                    CommonText(
                                      text: AppString.lastName.toUpperCase(),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.colorPrimaryBlack,
                                      bottom: 8,
                                    ),
                                    CommonTextField(
                                      controller: controller.lastNameController,
                                      hintText: AppString.lastNameHint,
                                      validator: OtherHelper.validator,
                                      fillColor:
                                          AppColors.colourGreyScaleGreyTint40,
                                              borderColor: AppColors.colourGreyScaleGreyTint60,
                                      borderRadius: 8,
                                    ),

                                    16.height,

                                    // Date of Birth
                                    CommonText(
                                      text: AppString.dateOfBirth.toUpperCase(),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.colorPrimaryBlack,
                                      bottom: 8,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: _buildDropdown(
                                            value: controller.selectedDay,
                                            hint: "DD",
                                            items: controller.days,
                                            onChanged: (value) {
                                              controller.selectedDay = value;
                                              controller.update();
                                            },
                                          ),
                                        ),
                                        12.width,
                                        Expanded(
                                          child: _buildDropdown(
                                            value: controller.selectedMonth,
                                            hint: "MM",
                                            items: controller.months,
                                            onChanged: (value) {
                                              controller.selectedMonth = value;
                                              controller.update();
                                            },
                                          ),
                                        ),
                                        12.width,
                                        Expanded(
                                          child: _buildDropdown(
                                            value: controller.selectedYear,
                                            hint: "YYYY",
                                            items: controller.yearsOfBirth,
                                            onChanged: (value) {
                                              controller.selectedYear = value;
                                              controller.update();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),

                                    16.height,

                                    // Country
                                    CommonText(
                                      text: AppString.country.toUpperCase(),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.colorPrimaryBlack,
                                      bottom: 8,
                                    ),
                                    _buildDropdown(
                                      value: controller.selectedCountry,
                                      hint: AppString.selectCountry,
                                      items: controller.countries,
                                      onChanged: (value) {
                                        controller.selectedCountry = value;
                                        controller.update();
                                      },
                                    ),

                                    16.height,

                                    // Skill Set
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CommonText(
                                          text: AppString.skillSet.toUpperCase(),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.colorPrimaryBlack,
                                        ),
                                        CommonText(
                                          text: AppString.maxSkills,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.colorPrimaryBlack,
                                        ),
                                      ],
                                    ),
                                    12.height,
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 14.w,vertical: 10.h
                                      ),
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        border: Border.all(
                                          color: AppColors.colourGreyScaleGreyTint60,
                                        ),
                                        color: AppColors.colourGreyScaleGreyTint40,
                                      ),
                                      child: Wrap(
                                        spacing: 8.w,
                                        runSpacing: 8.h,
                                        children: [
                                          // Selected skills as colored chips with remove (x)
                                          ...controller.selectedSkills.map((skill) {
                                            final bgColor = controller.skillColorMap[skill] ?? AppColors.colorPrimaryOrange;
                                            return GestureDetector(
                                              onTap: () => controller.removeSkill(skill),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 12.w,
                                                  vertical: 7.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: bgColor,
                                                  borderRadius: BorderRadius.circular(20.r),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.close,
                                                      size: 20.sp,
                                                      color: AppColors.colorPrimaryBlack,
                                                    ),
                                                    4.width,
                                                    CommonText(
                                                      text: skill,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600,
                                                      color: AppColors.colorPrimaryBlack,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          // Add button chip
                                          GestureDetector(
                                            onTap: () => _showAddSkillDialog(controller),
                                            child: Container(
                                              width: 32.w,
                                              height: 32.h,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF4ECDC4),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                size: 18.sp,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    16.height,

                                    // Years of Experience
                                    CommonText(
                                      text: AppString.yearsOfExperience.toUpperCase(),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.colorPrimaryBlack,
                                      bottom: 8,
                                    ),
                                    _buildDropdown(
                                      value: controller.selectedYears,
                                      hint: AppString.selectYears,
                                      items: controller.years,
                                      onChanged: (value) {
                                        controller.selectedYears = value;
                                        controller.update();
                                      },
                                    ),

                                    16.height,

                                    // Level of Experience
                                    CommonText(
                                      text: AppString.levelOfExperience.toUpperCase(),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.colorPrimaryBlack,
                                      bottom: 8,
                                    ),
                                    _buildDropdown(
                                      value: controller.selectedLevel,
                                      hint: AppString.selectLevel,
                                      items: controller.levels,
                                      onChanged: (value) {
                                        controller.selectedLevel = value;
                                        controller.update();
                                      },
                                    ),

                                    20.height,

                                    // Email notification checkbox
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 20.w,
                                          height: 20.h,
                                          child: Checkbox(
                                            value: controller.receiveEmails,
                                            onChanged: (value) => controller
                                                .toggleEmailNotification(),
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                          ),
                                        ),
                                        12.width,
                                        Expanded(
                                          child: CommonText(
                                            text: AppString.emailNotification,
                                            fontSize: 12,
                                            textAlign: TextAlign.start,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.colorPrimaryBlack,
                                            maxLines: 3,
                                          ),
                                        ),
                                      ],
                                    ),

                                    24.height,

                                    // Continue button
                                    CommonButton(
                                      titleText: AppString.continues,
                                      onTap: controller.continueToNext,
                                      isLoading: controller.isLoading,
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

                                    // Divider
                                    Container(
                                      height: 1.h,
                                      width: double.infinity,
                                      color:
                                          AppColors.colourGreyScaleGreyTint60,
                                    ),

                                    16.height,

                                    // I'll do this later
                                    GestureDetector(
                                      onTap: () => DoThisLaterPopup.show(
                                        onYes: () => Get.offAllNamed(AppRoutes.profile),
                                      ),
                                      child: Container(
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

                                    // Footer note
                                    CommonText(
                                      text: AppString.allFieldsRequired,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.colorPrimaryBlack,
                                    ).center,
                                  ],
                                ),
                              ),
                            ),

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

  Widget stepperSection() {
    return // Progress indicator
    Container(
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
            child: Container(
              height: 5.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.colorPrimaryGreen,
                    AppColors.colorPrimaryOrange,
                  ],
                ),
              ),
            ),
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
                text: "2",
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 5.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.colorPrimaryOrange,
                    AppColors.colourGreyscaleGrey,
                  ],
                ),
              ),
            ),
          ),

          Container(
            height: 45.h,
            width: 45.w,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.colourGreyscaleGrey,
                width: 4,
              ),
            ),
            child: Center(
              child: CommonText(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppColors.colorPrimaryBlack,
                text: "2",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
        color: AppColors.colourGreyScaleGreyTint40,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: CommonText(
            text: hint,
            fontSize: 14,
            color: AppColors.black_200,
          ),
          isExpanded: true,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: CommonText(
                text: item,
                fontSize: 14,
                color: AppColors.colorPrimaryBlack,
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  void _showAddSkillDialog(AddProfileDetailsController controller) {
    final textController = TextEditingController();
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        title: CommonText(
          text: 'Add skill',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.colorPrimaryBlack,
        ),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: 'Type a skill...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: CommonText(
              text: AppString.cancel,
              fontSize: 14,
              color: AppColors.colorPrimaryBlack,
            ),
          ),
          TextButton(
            onPressed: () {
              final value = textController.text.trim();
              if (value.isEmpty) return; // controller handles snackbar on invalid
              if (controller.selectedSkills.contains(value)) return;
              if (controller.selectedSkills.length >= 5) return;
              controller.addSkill(value);
              Get.back();
            },
            child: CommonText(
              text: AppString.done,
              fontSize: 14,
              color: AppColors.colorPrimaryBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
