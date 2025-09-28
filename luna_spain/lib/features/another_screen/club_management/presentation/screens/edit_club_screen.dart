import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/component/text_field/common_text_field.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/controller/edit_club_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import 'package:luna_spain/utils/helpers/other_helper.dart';

class EditClubScreen extends StatefulWidget {
  const EditClubScreen({super.key});

  @override
  State<EditClubScreen> createState() => _EditClubScreenState();
}

class _EditClubScreenState extends State<EditClubScreen> {
  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<EditClubController>()) {
      Get.put(EditClubController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<EditClubController>(
        builder: (c) {
          return Column(
            children: [
              const _TopBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Column(
                    children: [
                      8.height,
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(24.w),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Form(
                          key: c.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CommonText(
                                text: 'Edit Club Profile',
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 28,
                              ).center,

                              // Images row (Profile + Cover)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Profile
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
                                          child: c.image != null
                                              ? Image.file(
                                                  File(c.image!),
                                                  width: 80.sp,
                                                  height: 80.sp,
                                                  fit: BoxFit.cover,
                                                )
                                              : const CommonImage(
                                                  imageSrc: AppImages.clubLogo,
                                                  height: 80,
                                                  width: 80,
                                                ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: c.getProfileImage,
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
                                  // Cover
                                  Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(14.r),
                                        child: c.coverImage != null
                                            ? Image.file(
                                                File(c.coverImage!),
                                                height: 82,
                                                width: 186,
                                                fit: BoxFit.cover,
                                              )
                                            : const CommonImage(
                                                imageSrc: AppImages.todayImageFour,
                                                height: 82,
                                                width: 186,
                                                fill: BoxFit.cover,
                                              ),
                                      ),
                                      TextButton(
                                        onPressed: c.getCoverImage,
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

                              // Club name
                              CommonText(
                                text: "Club name",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                              ),
                              CommonTextField(
                                controller: c.clubNameCtrl,
                                hintText: "Club name",
                                validator: OtherHelper.validator,
                                fillColor: AppColors.colourGreyScaleGreyTint40,
                                borderColor: AppColors.colourGreyScaleGreyTint60,
                                borderRadius: 8,
                              ),

                              16.height,

                              // Description
                              CommonText(
                                text: "Description",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.colourGreyScaleGreyTint40,
                                  border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                child: TextField(
                                  controller: c.descriptionCtrl,
                                  maxLines: 4,
                                  style: TextStyle(fontSize: 14.sp, color: AppColors.colorPrimaryBlack),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'How would you describe your club to our community...',
                                  ),
                                ),
                              ),

                              16.height,

                              // Established date
                              CommonText(
                                text: "Established date",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: _dropdown(
                                      value: c.selectedDay,
                                      hint: 'DD',
                                      items: c.days,
                                      onChanged: (v) {
                                        c.selectedDay = v;
                                        c.update();
                                      },
                                    ),
                                  ),
                                  12.width,
                                  Expanded(
                                    child: _dropdown(
                                      value: c.selectedMonth,
                                      hint: 'MM',
                                      items: c.months,
                                      onChanged: (v) {
                                        c.selectedMonth = v;
                                        c.update();
                                      },
                                    ),
                                  ),
                                  12.width,
                                  Expanded(
                                    child: _dropdown(
                                      value: c.selectedYear,
                                      hint: 'YYYY',
                                      items: c.years,
                                      onChanged: (v) {
                                        c.selectedYear = v;
                                        c.update();
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
                              _dropdown(
                                value: c.selectedCountry,
                                hint: AppString.selectCountry,
                                items: c.countries,
                                onChanged: (v) {
                                  c.selectedCountry = v;
                                  c.update();
                                },
                              ),

                              16.height,

                              // Postcode
                              const CommonText(
                                text: 'POSTCODE / ZIPCODE',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                              ),
                              CommonTextField(
                                controller: c.postcodeCtrl,
                                hintText: 'Post/zip of club location...',
                                fillColor: AppColors.colourGreyScaleGreyTint40,
                                borderColor: AppColors.colourGreyScaleGreyTint60,
                                borderRadius: 8,
                                keyboardType: TextInputType.text,
                              ),

                              16.height,

                              // Club speciality
                              _clubSpecialitySection(),

                              16.height,

                              // Club managers
                              _clubManagersSection(),

                              16.height,

                              // Enable public club
                              const CommonText(
                                text: 'ENABLE PUBLIC CLUB',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                              ),
                              _dropdown(
                                value: c.selectedVisibility,
                                hint: 'Select...',
                                items: c.visibilityOptions,
                                onChanged: (v) {
                                  c.selectedVisibility = v;
                                  c.update();
                                },
                              ),

                              20.height,

                              // Save button
                              CommonButton(
                                titleText: 'Save',
                                onTap: c.onSave,
                                isLoading: c.isLoading,
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

  Widget _dropdown({
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
          icon: Icon(Icons.expand_more, color: AppColors.colorPrimaryBlack),
          value: value,
          hint: CommonText(text: hint, fontSize: 14, color: AppColors.black_200),
          isExpanded: true,
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: CommonText(text: item, fontSize: 14, color: AppColors.colorPrimaryBlack),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  // CLUB SPECIALITY (chips + search list)
  Widget _clubSpecialitySection() {
    return GetBuilder<EditClubController>(
      builder: (c) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CommonText(
                  text: 'CLUB SPECIALITY',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorPrimaryBlack,
                ),
                CommonText(
                  text: 'max. 10 specialties',
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
                  ...c.specialties.map(
                    (s) => GestureDetector(
                      onTap: () => c.removeSpecialty(s),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
                        decoration: BoxDecoration(
                          color: c.colorForSpecialty(s),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.close, size: 18.sp, color: AppColors.colorPrimaryBlack),
                            4.width,
                            CommonText(
                              text: s,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.colorPrimaryBlack,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: c.toggleSpecialtySearch,
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
            if (c.showSpecialtySearch.value) ...[
              8.height,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.colourGreyScaleGreyTint40,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextField(
                      controller: c.specialtySearchCtrl,
                      hintText: 'Search specialties...',
                      fillColor: AppColors.white,
                      borderColor: AppColors.colourGreyScaleGreyTint60,
                      borderRadius: 8,
                      onChanged: (_) => c.update(),
                    ),
                    10.height,
                    SizedBox(
                      height: 260.h,
                      child: ListView.separated(
                        itemCount: c.filteredSpecialties.length,
                        separatorBuilder: (_, __) => 8.height,
                        itemBuilder: (ctx, i) {
                          final s = c.filteredSpecialties[i];
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CommonText(
                                    text: s,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.colourPrimaryPurple,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => c.toggleSpecialty(s),
                                  child: Container(
                                    width: 28.w,
                                    height: 28.w,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4ECDC4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      c.specialties.contains(s) ? Icons.check : Icons.add,
                                      size: 18.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  // CLUB MANAGERS (chips + search list)
  Widget _clubManagersSection() {
    return GetBuilder<EditClubController>(
      builder: (c) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CommonText(
                  text: 'CLUB MANAGERS',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorPrimaryBlack,
                ),
                CommonText(
                  text: 'max. 3 managers',
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
                  ...c.selectedManagers.map(
                    (m) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: c.colorForManager(m),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => c.toggleManager(m),
                            child: Icon(Icons.clear, size: 16.sp, color: AppColors.colorPrimaryBlack),
                          ),
                          6.width,
                          CommonText(
                            text: m.name,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.colourPrimaryPurple,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => c.toggleManagerSearch(),
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
            if (c.showManagerSearch.value)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.colourGreyScaleGreyTint40,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                ),
                child: Column(
                  children: [
                    CommonTextField(
                      controller: c.managerSearchCtrl,
                      hintText: 'Search managers...',
                      fillColor: AppColors.white,
                      borderColor: AppColors.colourGreyScaleGreyTint60,
                      borderRadius: 8,
                      onChanged: (_) => c.update(),
                    ),
                    10.height,
                    SizedBox(
                      height: 260.h,
                      child: ListView.separated(
                        itemCount: c.filteredManagers.length,
                        separatorBuilder: (_, __) => 8.height,
                        itemBuilder: (ctx, i) {
                          final m = c.filteredManagers[i];
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                            ),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: const CommonImage(
                                    imageSrc: AppImages.man,
                                    height: 36,
                                    width: 36,
                                    fill: BoxFit.cover,
                                  ),
                                ),
                                10.width,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                        text: m.name,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.colourPrimaryPurple,
                                      ),
                                      CommonText(
                                        text: m.handle,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.colorPrimaryBlue,
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => c.toggleManager(m),
                                  child: Container(
                                    width: 28.w,
                                    height: 28.w,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4ECDC4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      c.selectedManagers.any((e) => e.handle == m.handle) ? Icons.check : Icons.add,
                                      size: 18.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

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
          const CommonImage(
            imageSrc: AppImages.logoWithBg,
            height: 40,
            width: 115,
            fill: BoxFit.contain,
          ),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 2),
            ),
            child: const ClipOval(
              child: CommonImage(
                imageSrc: AppImages.man,
                height: 48,
                width: 48,
                fill: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}