import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/component/text_field/common_text_field.dart';
import 'package:luna_spain/features/another_screen/create_club/presentation/controller/create_club_details_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class CreateClubDetailsScreen extends StatelessWidget {
  const CreateClubDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CreateClubDetailsController>()) {
      Get.put(CreateClubDetailsController());
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.splashBg, fit: BoxFit.cover),
          SafeArea(
            child: GetBuilder<CreateClubDetailsController>(
              builder: (controller) {
                return Column(
                  children: [
                    _topBar(),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            22.height,
                            _stepper(),
                            16.height,
                            _formCard(controller),
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

  Widget _stepper() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          // Step 1 (done)
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.colorPrimaryGreen,
                  AppColors.colorPrimaryOrange,
                ]),
              ),
            ),
          ),
          // Step 2 (current)
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
              color: AppColors.colourGreyscaleGrey,
            ),
          ),
          // Step 3 (upcoming)
          Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.colourGreyscaleGrey, width: 4),
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

  Widget _formCard(CreateClubDetailsController c) {
    return Container(
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
            CommonText(
              text: 'Club details',
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: AppColors.colourPrimaryPurple,
              bottom: 28,
            ).center,

            // Club Name
            CommonText(
              text: 'CLUB NAME',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.colorPrimaryBlack,
              bottom: 8,
            ),
            CommonTextField(
              controller: c.clubNameCtrl,
              hintText: 'Club name...',
              fillColor: AppColors.colourGreyScaleGreyTint40,
              borderColor: AppColors.colourGreyScaleGreyTint60,
              borderRadius: 8,
            ),

            16.height,

            // Description
            CommonText(
              text: 'DESCRIPTION',
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

            // Established Date
            CommonText(
              text: 'ESTABLISHED DATE',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.colorPrimaryBlack,
              bottom: 8,
            ),
            Row(
              children: [
                Expanded(child: _dropdown(value: c.selectedDay, hint: 'DD', items: c.days, onChanged: (v){c.selectedDay=v; c.update();})),
                12.width,
                Expanded(child: _dropdown(value: c.selectedMonth, hint: 'MM', items: c.months, onChanged: (v){c.selectedMonth=v; c.update();})),
                12.width,
                Expanded(child: _dropdown(value: c.selectedYear, hint: 'YYYY', items: c.years, onChanged: (v){c.selectedYear=v; c.update();})),
              ],
            ),

            16.height,

            // Country
            CommonText(
              text: 'COUNTRY',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.colorPrimaryBlack,
              bottom: 8,
            ),
            _dropdown(value: c.selectedCountry, hint: 'Select country...', items: c.countries, onChanged: (v){c.selectedCountry=v; c.update();}),

            16.height,

            // Postcode
            CommonText(
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

            // Club Speciality
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                  ...c.specialties.map((s) => GestureDetector(
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
                              CommonText(text: s, fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
                            ],
                          ),
                        ),
                      )),
                  GestureDetector(
                    onTap: () {
                      c.toggleSpecialtySearch();
                    },
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: const BoxDecoration(color: Color(0xFF4ECDC4), shape: BoxShape.circle),
                      child: Icon(Icons.add, size: 18.sp, color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),

            if (c.showSpecialtySearch.value) ...[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                  color: AppColors.colourGreyScaleGreyTint40,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.r), bottomRight: Radius.circular(12.r)),
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

            16.height,

            // Club Managers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
            // Selected chips container (always visible, like Club Speciality)
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
                  ...c.selectedManagers.map((m) => Container(
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
                              child: CommonText(
                                text: '×',
                                fontSize: 16,
                                color: AppColors.colorPrimaryBlack,
                                fontWeight: FontWeight.w600,
                              ),
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
                      )),
                  // Inline add button (same position as Club Speciality)
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
                                  child: CommonImage(
                                    imageSrc: AppImages.man,
                                    height: 36.w,
                                    width: 36.w,
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
                                    decoration: const BoxDecoration(color: Color(0xFF4ECDC4), shape: BoxShape.circle),
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

            20.height,
            CommonButton(
              titleText: 'Continue',
              onTap: c.onContinue,
              buttonColor: AppColors.colorPrimaryGreen,
              borderColor: AppColors.colorSecondaryGreen,
              titleColor: AppColors.colorPrimaryBlack,
              buttonRadius: 12,
              buttonHeight: 56,
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
}
