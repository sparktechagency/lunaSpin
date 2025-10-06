import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/features/another_screen/manage_class/presentation/controller/create_new_class_ticket_and_cost_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class CreateNewClassTicketAndCostScreen extends StatelessWidget {
  const CreateNewClassTicketAndCostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CreateNewClassTicketAndCostController>()) {
      Get.put(CreateNewClassTicketAndCostController());
    }

    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<CreateNewClassTicketAndCostController>(builder: (c) {
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
                          text: 'Ticket & Cost',
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorPrimaryBlack,
                          bottom: 16.h,
                        ).center,

                        stepperSection(),
                        28.height,

                        const _Label('COST PER TICKET'),
                        _CurrencyInput(
                          controller: c.costCtrl,
                          hint: '12.50',
                          validator: c.validateCost,
                        ),
                        8.height,
                        const CommonText(
                          text: 'Please note, an additional fee of £0.45 will be added to the attendees online payment total to cover transaction charges.',
                          fontSize: 12,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w500,
                          color: AppColors.colourGreyscaleBlackTint40,
                        ),
                        18.height,

                        const _Label('MAXIMUM ATTENDEES'),
                        _BoxInput(
                          controller: c.maxAttendeesCtrl,
                          hint: 'Number of max attendees...',
                          keyboardType: TextInputType.number,
                          validator: c.validateMax,
                        ),

                        20.height,
                        CommonButton(
                          titleText: 'Next',
                          onTap:(){
                            Get.toNamed(AppRoutes.createNewClassConfirmClass);
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

                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.manageClasses);
                          },
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
      fontWeight: FontWeight.w600,
      color: AppColors.colorPrimaryBlack,
      bottom: 6,
    );
  }
}

class _CurrencyInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  const _CurrencyInput({required this.controller, required this.hint, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
      ),
    //  padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: AppColors.colourGreyScaleGreyTint40,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), bottomLeft: Radius.circular(8.r)),
            ),

            child: Center(
              child: const CommonText(
                text: '£',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.colorPrimaryBlack,
              ),
            ),
          ),
          8.width,
          Expanded(
            child: TextFormField(
              controller: controller,
              validator: validator,
              
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                fillColor: AppColors.white,
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  color: AppColors.colourGreyscaleBlackTint40,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: TextStyle(
                color: AppColors.colorPrimaryBlack,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BoxInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const _BoxInput({required this.controller, required this.hint, this.keyboardType, this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colourGreyScaleGreyTint40,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          fillColor: AppColors.colourGreyScaleGreyTint40,
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
                    
                  color: AppColors.colorPrimaryGreen
              
              ),
                ),
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
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
        
              
              gradient: LinearGradient(colors: [
                AppColors.colorPrimaryGreen,
                AppColors.colorPrimaryOrange,
              ]),),
                ),
              ),
        
              Container(
                height: 45.h,
                width: 45.w,
        
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.colorPrimaryOrange,
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
        color: AppColors.colorPrimaryGreen,
        text: "Information")   ,


          CommonText(
        
        
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.colorPrimaryGreen,
        text: "Date & Time")   ,


            CommonText(
        
        
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.colorPrimaryOrange,
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
