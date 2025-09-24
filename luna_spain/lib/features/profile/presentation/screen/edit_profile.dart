import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/component/text_field/common_text_field.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import 'package:luna_spain/utils/helpers/other_helper.dart';
import '../controller/profile_controller.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }
  }


  @override
  void dispose() {
    Get.find<ProfileController>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),

        child: AppBar(
          backgroundColor: AppColors.colourPrimaryPurple,
        ),
      ),
      body: GetBuilder<ProfileController>(
        builder: (profileCtrl) {
          return Column(
            children: [
      
      
              _TopBar(),
              // Top bar with logo and profile avatar
              // Container(
              //   padding: EdgeInsets.only(
              //     left: 20.w,
              //     right: 20.w,
              //     top: 40.h,
              //     bottom: 14.h,
              //   ),
              //   decoration: BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(
              //         color: AppColors.colorPrimaryPink.withOpacity(0.6),
              //         width: 1.w,
              //       ),
              //     ),
              //     color: AppColors.colourPrimaryPurple,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.1),
              //         offset: const Offset(0, 2),
              //         blurRadius: 4,
              //       ),
              //     ],
              //     borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(20.r),
              //       bottomRight: Radius.circular(20.r),
              //     ),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Row(
              //         children: [
              //           GestureDetector(
              //             onTap: () => Get.back(),
              //             child: const Icon(Icons.arrow_back, color: Colors.white),
              //           ),
              //           12.width,
              //           CommonImage(
              //             imageSrc: AppImages.logoWithBg,
              //             height: 40.h,
              //             width: 115.w,
              //             fill: BoxFit.contain,
              //           ),
              //         ],
              //       ),
              //       Container(
              //         width: 48.w,
              //         height: 48.h,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border.all(
              //             color: AppColors.white,
              //             width: 2,
              //           ),
              //         ),
              //         child: ClipOval(
              //           child: profileCtrl.image != null
              //               ? Image.file(
              //                   File(profileCtrl.image!),
              //                   height: 48.h,
              //                   width: 48.w,
              //                   fit: BoxFit.cover,
              //                 )
              //               : const CommonImage(
              //                   imageSrc: AppImages.profile,
              //                   height: 48,
              //                   width: 48,
              //                 ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            
              // Main content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Column(
                    children: [
                      8.height,
            
                      // Form container
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(24.w),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Form(
                          key: profileCtrl.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              const CommonText(
                                text: 'Edit Profile',
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 28,
                              ).center,
            

                              // Images row (Profile + Cover) with Edit actions
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Profile image
                                  Column(
                                    children: [
                                      Container(
                                        width: 80.sp,
                                        height: 80.sp,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                                        ),
                                        child: ClipOval(
                                          child: profileCtrl.image != null
                                              ? Image.file(
                                                  File(profileCtrl.image!),
                                                  width: 80.sp,
                                                  height: 80.sp,
                                                  fit: BoxFit.cover,
                                                )
                                              :  CommonImage(
                                                  imageSrc: AppImages.man,
                                                  height: 80.sp,
                                                  width: 80.sp,
                                                ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: profileCtrl.getProfileImage,
                                        child: const CommonText(
                                          text: 'Edit',
                                          fontSize: 16,
                                          underline: true,
                                          color: AppColors.colorPrimaryBlue,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  20.width,
                                  // Placeholder cover/banner image
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(14.r),
                                        child: profileCtrl.coverImage != null
                                            ? Image.file(
                                                File(profileCtrl.coverImage!),
                                                height: 82,
                                                width: 186,
                                                fit: BoxFit.cover,
                                              )
                                            : const CommonImage(
                                                imageSrc: AppImages.man,
                                                height: 82,
                                                width: 186,
                                                fill: BoxFit.cover,
                                              ),
                                      ),
                                      TextButton(
                                        onPressed: profileCtrl.getCoverImage,
                                        child: const CommonText(
                                          text: 'Edit',
                                          fontSize: 16,
                                          underline: true,
                                          color: AppColors.colorPrimaryBlue,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
            
                              12.height,
            
                              // FIRST NAME
                              CommonText(
                                text: AppString.firstName.toUpperCase(),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                              ),
                              CommonTextField(
                                controller: profileCtrl.nameController,
                                hintText: AppString.firstNameHint,
                                validator: OtherHelper.validator,
                                fillColor: AppColors.colourGreyScaleGreyTint40,
                                borderColor: AppColors.colourGreyScaleGreyTint60,
                                borderRadius: 8,
                              ),
            
                              16.height,
            
                              // LAST NAME
                              CommonText(
                                text: AppString.lastName.toUpperCase(),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                              ),
                              CommonTextField(
                                // Wire to ProfileController
                                controller: profileCtrl.lastNameController,
                                hintText: 'Last name',
                                validator: OtherHelper.validator,
                                fillColor: AppColors.colourGreyScaleGreyTint40,
                                borderColor: AppColors.colourGreyScaleGreyTint60,
                                borderRadius: 8,
                              ),
            
                              16.height,
            
                              // DATE OF BIRTH
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
                                      value: profileCtrl.selectedDay,
                                      hint: 'DD',
                                      items: profileCtrl.days,
                                      onChanged: (value) {
                                        profileCtrl.selectedDay = value;
                                        profileCtrl.update();
                                      },
                                    ),
                                  ),
                                  12.width,
                                  Expanded(
                                    child: _buildDropdown(
                                      value: profileCtrl.selectedMonth,
                                      hint: 'MM',
                                      items: profileCtrl.months,
                                      onChanged: (value) {
                                        profileCtrl.selectedMonth = value;
                                        profileCtrl.update();
                                      },
                                    ),
                                  ),
                                  12.width,
                                  Expanded(
                                    child: _buildDropdown(
                                      value: profileCtrl.selectedYear,
                                      hint: 'YYYY',
                                      items: profileCtrl.yearsOfBirth,
                                      onChanged: (value) {
                                        profileCtrl.selectedYear = value;
                                        profileCtrl.update();
                                      },
                                    ),
                                  ),
                                ],
                              ),
            
                              16.height,
            
                              // COUNTRY
                              CommonText(
                                text: AppString.country.toUpperCase(),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                              ),
                              _buildDropdown(
                                value: profileCtrl.selectedCountry,
                                hint: AppString.selectCountry,
                                items: profileCtrl.countries,
                                onChanged: (value) {
                                  profileCtrl.selectedCountry = value;
                                  profileCtrl.update();
                                },
                              ),
            
                              16.height,
            
                              // SKILL SET
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  CommonText(
                                    text: AppString.skillSet,
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
                                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                                  color: AppColors.colourGreyScaleGreyTint40,
                                ),
                                child: Wrap(
                                  spacing: 8.w,
                                  runSpacing: 8.h,
                                  children: [
                                    ...profileCtrl.selectedSkills.map((skill) {
                                      final bgColor = profileCtrl.skillColorMap[skill] ?? AppColors.colorPrimaryOrange;
                                      return GestureDetector(
                                        onTap: () => profileCtrl.removeSkill(skill),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
                                          decoration: BoxDecoration(
                                            color: bgColor,
                                            borderRadius: BorderRadius.circular(20.r),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.close, size: 20.sp, color: AppColors.colorPrimaryBlack),
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
                                      onTap: () => _showAddSkillDialog(profileCtrl),
                                      child: Container(
                                        width: 32.w,
                                        height: 32.h,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF4ECDC4),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.add, size: 18.sp, color: AppColors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
            
                              16.height,
            
                              // YEARS OF EXPERIENCE
                              CommonText(
                                text: AppString.yearsOfExperience.toUpperCase(),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                              ),
                              _buildDropdown(
                                value: profileCtrl.selectedYears,
                                hint: AppString.selectYears,
                                items: profileCtrl.years,
                                onChanged: (value) {
                                  profileCtrl.selectedYears = value;
                                  profileCtrl.update();
                                },
                              ),
            
                              16.height,
            
                              // LEVEL OF EXPERIENCE
                              CommonText(
                                text: AppString.levelOfExperience.toUpperCase(),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                              ),
                              _buildDropdown(
                                value: profileCtrl.selectedLevel,
                                hint: AppString.selectLevel,
                                items: profileCtrl.levels,
                                onChanged: (value) {
                                  profileCtrl.selectedLevel = value;
                                  profileCtrl.update();
                                },
                              ),
            
                              20.height,
            
                              // Save button styled similar to screenshot
                              CommonButton(
                                titleText: 'Save',
                                onTap: profileCtrl.editProfileRepo,
                                isLoading: profileCtrl.isLoading,
                                buttonColor: AppColors.colorPrimaryGreen,
                                borderColor: AppColors.colorSecondaryGreen,
                                titleColor: AppColors.colorPrimaryBlack,
                                buttonRadius: 12,
                                buttonHeight: 56,
                                titleSize: 18,
                                borderWidth: 2,
                                titleWeight: FontWeight.w600,
                              ),
            
                              16.height,
            
                              // Cancel link
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
                                      color: AppColors.colorNoticeError,
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
                                color: AppColors.colorPrimaryBlack,
                              ).center,
                            ],
                          ),
                        ),
                      ),
            
                      120.height,
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),

           bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.colourPrimaryPurple, // iOS safe area color
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.r),
            topRight: Radius.circular(28.r),
          ),
        ),

        child: SafeArea(top: false, child: CommonBottomNavBar(currentIndex: 8)),
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

  void _showAddSkillDialog(ProfileController controller) {
    final textController = TextEditingController();
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        title: const CommonText(
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
            child: const CommonText(
              text: AppString.cancel,
              fontSize: 14,
              color: AppColors.colorPrimaryBlack,
            ),
          ),
          TextButton(
            onPressed: () {
              final value = textController.text.trim();
              if (value.isEmpty) return;
              if (controller.selectedSkills.contains(value)) return;
              if (controller.selectedSkills.length >= 5) return;
              controller.addSkill(value);
              Get.back();
            },
            child: const CommonText(
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
