import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/component/text_field/common_text_field.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/features/another_screen/manage_class/presentation/controller/create_new_class_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class CreateNewClassScreen extends StatelessWidget {
  const CreateNewClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CreateNewClassController>()) {
      Get.put(CreateNewClassController());
    }

    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<CreateNewClassController>(builder: (c) {
        return Column(
          children: [
            const _TopBar(),
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
                        CommonText(
                          text: 'Class information',
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorPrimaryBlack,
                          bottom: 16.h,
                        ).center,

                 //
                 //
                   stepperSection(),
                        
                      28.height,

                        // Class name
                        const _Label('CLASS NAME'),
                        _InputBox(
                          controller: c.nameCtrl,
                          hint: 'Name of the class...',
                          validator: c.requiredValidator,
                        ),
                        12.height,

                        // Description
                        const _Label('DESCRIPTION'),
                        _InputBox(
                          controller: c.descCtrl,
                          hint: 'Describe the class so viewers know what to expect when attending the class...',
                          validator: c.requiredValidator,
                          maxLines: 4,
                        ),
                        12.height,

                        // Attendee instructions
                        const _Label('ATTENDEE INSTRUCTIONS'),
                        _InputBox(
                          controller: c.attendeeCtrl,
                          hint: 'Do attendees need to bring equipment or wear certain clothing, etc...',
                          maxLines: 3,
                        ),
                        12.height,

                        // Location of class
                        const _Label('LOCATION OF CLASS'),
                        _DropdownBox<String>(
                          value: c.selectedLocation,
                          items: c.locations,
                          onChanged: c.setLocation,
                        ),
                    
                        14.height,

                        classLeaderSection(),
                        14.height,
                               // Level of experience
                        const _Label('LEVEL OF EXPERIENCE'),
                        _DropdownBox<String>(
                          value: c.selectedExperience,
                          items: c.experienceLevels,
                          onChanged: c.setExperience,
                        ),
                        14.height,

                        featuredSkillsSection(),

                  
            
                        14.height,

                 

                 

                        20.height,
                        // Continue button
                        CommonButton(
                          titleText: 'Next',
                          onTap: () {
                            Get.toNamed(AppRoutes.createNewClassDateTime);
                          },
                          buttonColor: AppColors.colorPrimaryGreen,
                          borderColor: AppColors.colorSecondaryGreen,
                          titleColor: AppColors.colorPrimaryBlack,
                          buttonRadius: 10,
                          buttonHeight: 48,
                          titleSize: 20,
                          borderWidth: 2,
                          titleWeight: FontWeight.w600,
                        ),
                        10.height,

                        // Cancel
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: SizedBox(
                            width: double.infinity,
                            height: 44.h,
                            child: const Center(
                              child: CommonText(
                                underline: true,
                                text: 'Cancel',
                                fontSize: 16,
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
        child: const SafeArea(top: false, child: CommonBottomNavBar(currentIndex: 58)),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);
  @override
  Widget build(BuildContext context) {
    return CommonText(
      text: text,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.colorPrimaryBlack,
      bottom: 6,
    );
  }
}

class _InputBox extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final String? Function(String?)? validator;
  const _InputBox({required this.controller, required this.hint, this.maxLines = 1, this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colourGreyScaleGreyTint40,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: AppColors.colourGreyscaleBlackTint40,
            fontSize: 14.sp,

            fontWeight: FontWeight.w600,
          ),
          border: InputBorder.none,
          hintText: hint,
        ),
        style: TextStyle(
          color: AppColors.colorPrimaryBlack,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _DropdownBox<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  const _DropdownBox({required this.value, required this.items, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colourGreyScaleGreyTint40,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: DropdownButton<T>(
        isExpanded: true,
        value: value,
        underline: const SizedBox.shrink(),
        items: items
            .map(
              (e) => DropdownMenuItem<T>(
                value: e,
                child: CommonText(
                  text: '$e',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.colourGreyscaleBlackTint40,
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.colorPrimaryBlack),
      ),
    );
  }
}


Widget featuredSkillsSection() {
  return GetBuilder<CreateNewClassController>(
    builder: (c) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CommonText(
                text: 'FEATURED SKILLS',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.colorPrimaryBlack,
              ),
              CommonText(
                text: 'max. 5 skills',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.colorGreyScalBlack60,
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
                ...c.featuredSkills.map(
                  (s) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: c.colorForFeatureSkill(s),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => c.toggleFeaturesSkill(s),
                          child: Icon(Icons.clear, size: 16.sp, color: AppColors.colorPrimaryBlack),
                        ),
                        6.width,
                        CommonText(
                          text: s,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colourPrimaryPurple,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: c.toggleFeaturedSearch,
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
          if (c.showFeaturedSkillsSearch.value) ...[
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
                    controller: c.featuredSkillsController,
                    hintText: 'Search skills...',
                    fillColor: AppColors.white,
                    borderColor: AppColors.colourGreyScaleGreyTint60,
                    borderRadius: 8,
                    onChanged: (_) => c.update(),
                  ),
                  10.height,
                  SizedBox(
                    height: 260.h,
                    child: ListView.separated(
                      itemCount: c.filteredFeaturedSkills.length,
                      separatorBuilder: (_, __) => 8.height,
                      itemBuilder: (ctx, i) {
                        final s = c.filteredFeaturedSkills[i];
                        final selected = c.featuredSkills.contains(s);
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
                                onTap: () => c.toggleFeaturesSkill(s),
                                child: Container(
                                  width: 28.w,
                                  height: 28.w,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF4ECDC4),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    selected ? Icons.check : Icons.add,
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

  // CLUB SPECIALITY (chips + search list)
  Widget classLeaderSection() {
    return GetBuilder<CreateNewClassController>(
      builder: (c) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CommonText(
                  text: 'Class leaders',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorPrimaryBlack,
                ),
                CommonText(
                  text: 'Max. 2 class leaders',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorGreyScalBlack60,
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
                      onTap: () => c.removeLeader(s),
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
                      controller: c.classLeaderController,
                      hintText: 'Search leaders...',
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



class _TopBar extends StatelessWidget {
  const _TopBar();
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

 Widget stepperSection() {
    return // Progress indicator
    Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 5),
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
                  border: Border.all(color: AppColors.colorPrimaryOrange, width: 4),
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
                    
                    gradient: LinearGradient(colors: [
                      AppColors.colorPrimaryOrange,
                      AppColors.colourGreyscaleGrey,
                    ])
              
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
         
          
              Expanded(
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
        
              
              color: AppColors.colourGreyscaleGrey ),
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
                    text: "3",
                  ),
                ),
              ),
          
          
          
               Expanded(
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    
              
              color: AppColors.colourGreyscaleGrey ),
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
                    text: "4",
                  ),
                ),
              ),
         
          
            ],
          ),
        ),

        3.height,
   
   
   
   Row(
    mainAxisAlignment: MainAxisAlignment
    
    .spaceBetween,
    children: [

      CommonText(
        
        
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.colorPrimaryOrange,
        text: "Information")   ,


          CommonText(
        
        
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.colorGreyScalGrey,
        text: "Date & Time")   ,


            CommonText(
        
        
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.colorGreyScalGrey,
        text: "Ticket & Cost")   ,

               CommonText(
        
        
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.colorGreyScalGrey,
        text: "Confirm")   ,



        
        
        
        
        
         ],
   ),

   
   
   
      ],
    );
  }



