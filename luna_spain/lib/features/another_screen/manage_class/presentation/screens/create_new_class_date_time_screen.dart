import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/features/another_screen/manage_class/presentation/controller/create_new_class_date_and_time_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class CreateNewClassDateAndTimeScreen extends StatelessWidget {
  const CreateNewClassDateAndTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CreateNewClassDateAndTimeController>()) {
      Get.put(CreateNewClassDateAndTimeController());
    }
    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<CreateNewClassDateAndTimeController>(builder: (c) {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: 'Date & Time',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorPrimaryBlack,
                        bottom: 16.h,
                      ).center,
                      stepperSection(),
                      28.height,

                      // DATE OF CLASS
                      const _Label('DATE OF CLASS'),
                      Row(
                        children: [
                          Expanded(child: _dropdown(value: c.selectedDay, hint: 'DD', items: c.days, onChanged: (v) { c.selectedDay = v; c.update(); })),
                          10.width,
                          Expanded(child: _dropdown(value: c.selectedMonth, hint: 'MM', items: c.months, onChanged: (v) { c.selectedMonth = v; c.update(); })),
                          10.width,
                          Expanded(child: _dropdown(value: c.selectedYear, hint: 'YYYY', items: c.years, onChanged: (v) { c.selectedYear = v; c.update(); })),
                        ],
                      ),
                      14.height,

                      // START TIME (HH:MM)
                      const _Label('START TIME (HH:MM)'),
                      Row(
                        children: [
                          Expanded(child: _dropdown(value: c.startHour, hint: 'HH', items: c.hours, onChanged: (v) { c.startHour = v; c.update(); })),
                          10.width,
                          Expanded(child: _dropdown(value: c.startMinute, hint: 'MM', items: c.minutes, onChanged: (v) { c.startMinute = v; c.update(); })),
                        ],
                      ),
                      14.height,

                      // DURATION (HH:MM)
                      const _Label('DURATION (HH:MM)'),
                      Row(
                        children: [
                          Expanded(child: _dropdown(value: c.durationHour, hint: 'HH', items: c.hours, onChanged: (v) { c.durationHour = v; c.update(); })),
                          10.width,
                          Expanded(child: _dropdown(value: c.durationMinute, hint: 'MM', items: c.minutes, onChanged: (v) { c.durationMinute = v; c.update(); })),
                        ],
                      ),
                      14.height,

                      // REOCCURRING CLASS
                      const _Label('REOCCURRING CLASS'),
                      _dropdown(
                        value: c.selectedRecurrence,
                        hint: 'Select occurrence...',
                        items: c.recurrenceOptions,
                        onChanged: (v) { c.selectedRecurrence = v; c.update(); },
                      ),


                     
                   

                    // Weekly recurrence details
                     if (c.selectedRecurrence == 'Repeats weekly') ...[                       14.height,
                        const _Label('REPEAT EVERY NUMBER OF WEEKS'),
                        _dropdown(
                          value: c.weeklyInterval,
                          hint: 'Select number...',
                          items: c.weeklyIntervals,
                          onChanged: (v) { c.weeklyInterval = v; c.update(); },
                        ),
                        14.height,
                        const _Label('REPEAT ON DAYS OF WEEK'),
                     
                     Container(
  width: double.infinity,
  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
  decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(12.r),
    border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
  ),
  child: Column(
    children: c.weekDays.map((d) {
      final selected = c.selectedWeekDays.contains(d);
      return InkWell(
        onTap: () => c.toggleWeekDay(d),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: Row(
            children: [
              // Circle indicator
              Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.colourGreyScaleGreyTint60,
                    width: 2,
                  ),
                  color: Colors.transparent,
                ),
                child: selected
                    ? Center(
                        child: Container(
                          width: 12.w,
                          height: 12.h,
                          decoration: const BoxDecoration(
                            color: AppColors.colourPrimaryPurple,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
              ),
              10.width,
              Expanded(
                child: CommonText(
                  text: d,
                  textAlign: TextAlign.start,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.colorPrimaryBlack,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList(),
  ),
),
                     
                       14.height,
                      const _Label('REPEAT UNTIL'),
                        _dropdown(
                         value: c.repeatUntil,
                          hint: 'Select period...',
                      items: c.repeatUntilOptions,
                         onChanged: (v) { c.repeatUntil = v; c.update(); },
                        ),                    if (c.repeatUntil == 'Until set date') ...[
                          10.height,
                          Row(
                            children: [
                            Expanded(child: _dropdown(value: c.endDay, hint: 'DD', items: c.days, onChanged: (v) { c.endDay = v; c.update(); })),
                             10.width,
                             Expanded(child: _dropdown(value: c.endMonth, hint: 'MM', items: c.months, onChanged: (v) { c.endMonth = v; c.update(); })),
                             10.width,
                           Expanded(child: _dropdown(value: c.endYear, hint: 'YYYY', items: c.years, onChanged: (v) { c.endYear = v; c.update(); })),
                           ],
                         ),
                       ] else if (c.repeatUntil == 'After occurrences') ...[
                         10.height,
                         _dropdown(
                           value: c.occurrencesCount,
                            hint: 'Select occurrences...',
                           items: c.occurrencesOptions,
                           onChanged: (v) { c.occurrencesCount = v; c.update(); },
                          ),
                     ],
                     

                    ],
                    
                    
                         20.height,
                      CommonButton(
                        titleText: 'Next',
                        onTap:(){
                          Get.toNamed(AppRoutes.createNewClassTicketAndCost);
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
                        onTap: () => Get.toNamed(AppRoutes.manageClasses),
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
                 
                    
                    ]
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
          borderRadius: BorderRadius.only(topLeft: Radius.circular(28.r), topRight: Radius.circular(28.r)),
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
        icon: const Icon(Icons.expand_more, color: AppColors.colorPrimaryBlack),
        value: value,
        hint: CommonText(text: hint, fontSize: 14, color: AppColors.colourGreyscaleBlackTint40, fontWeight: FontWeight.w600),
        isExpanded: true,
        items: items.map((item) => DropdownMenuItem<String>(value: item, child: CommonText(text: item, fontSize: 14, color: AppColors.colorPrimaryBlack, fontWeight: FontWeight.w600))).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}

class _TopBar extends StatelessWidget {
  const _TopBar();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 14.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.colorPrimaryPink.withOpacity(0.6), width: 1.w)),
        color: AppColors.colourPrimaryPurple,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 2), blurRadius: 4)],
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: () => Get.back(), child: Icon(Icons.arrow_back, color: AppColors.white, size: 40.h)),
          const CommonImage(imageSrc: AppImages.logoWithBg, height: 40, width: 115, fill: BoxFit.contain),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.white, width: 2)),
            child: const ClipOval(child: CommonImage(imageSrc: AppImages.man, height: 48, width: 48, fill: BoxFit.cover)),
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
                    
                    gradient: LinearGradient(colors: [
                      AppColors.colorPrimaryGreen,
                      AppColors.colorPrimaryOrange,
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
                    color: AppColors.colorPrimaryOrange,
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
        color: AppColors.colorPrimaryGreen,
        text: "Information")   ,


          CommonText(
        
        
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.colorPrimaryOrange,
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
