import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import '../controller/class_details_controller.dart';

class ClassDetailsScreen extends StatelessWidget {
  const ClassDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ClassDetailsController>()) {
      Get.put(ClassDetailsController());
    }

    return Scaffold(
      backgroundColor: AppColors.colourGreyScaleGreyTint60,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<ClassDetailsController>(
        builder: (c) {
          return Column(
            children: [
              _topBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 12.h,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 36.h,
                      horizontal: 28.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _screenTitle('Review Class'),
                        14.height,
                        stepperSection(),
                        14.height,

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            color: AppColors.colourPrimaryPurple,
                          ),
                          child: Column(
                            children: [
                              CommonText(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                                text: c.title,
                              ).center,

                              14.height,
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.colorPrimaryPinkTint40,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    topRight: Radius.circular(10.r),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 14.h,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonText(
                                            text: c.dateLine,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.colorPrimaryBlack,
                                          ),
                                          2.height,
                                          CommonText(
                                            text: c.time,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                AppColors.colorGreyScalBlack60,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CommonText(
                                          text: 'Spaces\nremaining',
                                          fontSize: 12,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w400,
                                          right: 5,
                                          color: AppColors.colorGreyScalBlack60,
                                          textAlign: TextAlign.end,
                                        ),
                                        6.height,
                                        _pill(c.spaces.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              //===========profile info
                              Container(
                                padding: EdgeInsets.all(14.r),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColors.colorGreyScalGrey,
                                      width: 2.w,
                                    ),
                                  ),
                                  color: AppColors.colourGreyScaleGreyTint20,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: CommonImage(
                                          imageSrc: AppImages.man,
                                          height: 40.h,
                                          width: 40.w,
                                          fill: BoxFit.contain,
                                        ),
                                      ),
                                    ),

                                    7.width,

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: "Class with",
                                          fontSize: 16,
                                          textAlign: TextAlign.start,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.colourPrimaryPurple,
                                        ),

                                        CommonText(
                                          text: "@georginaleon",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.colorPrimaryBlue,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 28.w,
                                  vertical: 14.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14.r), bottomRight: Radius.circular(14.r))
                                ),

                                child: Column(
                                  children: [
                                    CommonText(
                                      textAlign: TextAlign.start,
                                      maxLines: 30,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.colourPrimaryPurple,
                                      text: """
Choreography class focusing on movement around the pole, exploring our sensual side! You should have some experience of using heels to attend this class. The following is a good foundation:""",
                                    ),
                                    CommonText(
                                      top: 10,
                                      left: 10,

                                      textAlign: TextAlign.start,
                                      maxLines: 30,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.colourPrimaryPurple,
                                      text: """
.Confident pirouettes, diamond turns, pathways to and from the floor in heels.
.Understanding of using the toe box of the platform.
.Comfortable with different grips in heels i.e. forearm, split, true.
""",
                                    ),

                                    CommonText(
                                      textAlign: TextAlign.start,
                                      maxLines: 30,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.colourPrimaryPurple,
                                      text: """
Please bring knee pads with you. Heels not compulsory but highly encouraged.""",
                                    ),

                                    20.height,

                                    Row(
                                      children: [
                                        CommonText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          right: 7,
                                          color: AppColors.colourPrimaryPurple,
                                          text: "Level:",
                                        ),

                                        CommonText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.colourPrimaryPurple,
                                          text: "Intermediate",
                                        ),
                                      ],
                                    ),
                                    12.height,
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Instructions: ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  AppColors.colourPrimaryPurple,
                                            ),
                                          ),
                                          TextSpan(
                                            text: c.instructions,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  AppColors.colourPrimaryPurple,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    CommonImage(
                                      imageSrc: AppImages.map,
                                      height: 240.h,
                                      width: double.infinity,
                                      fill: BoxFit.contain,
                                    ),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          fontSize: 16,
                                          right: 30,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.colourPrimaryPurple,
                                          text: "Address:",
                                        ),

                                        CommonText(
                                          maxLines: 3,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.colorPrimaryBlack,
                                          text: """Fresh Gym
Govett Avenue
Shepperton
TW178AB""",
                                        ),
                                      ],
                                    ),
                             
                             
                             
                             28.height,
                                       Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          fontSize: 16,
                                          right: 30,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.colourPrimaryPurple,
                                          text: "Directions:",
                                        ),

                                        Expanded(
                                          child: CommonText(
                                            maxLines: 3,
                                            textAlign: TextAlign.start,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.colorPrimaryBlack,
                                                                              
                                                                              
                                            text: "We are located upstairs just past reception on the right.",
                                          ),
                                        ),
                                      ],
                                    ),
                            
                             
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                  
                  
                  14.height,
                  
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 14.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: AppColors.colourGreyScaleGreyTint60,
                      
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,                      children: [

                        CommonText(
                          
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          text: "Total "),



                          CommonText(
                          
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          text: "£16.00 ")
                      ],
                    ),
                  )
                     
                     
                     ,


                     14.height,
                     CommonButton(
                      buttonHeight: 52.h,
                      borderWidth: 2,
                      onTap: (){
                        Get.toNamed(AppRoutes.checkout);
                      },
                      buttonColor: AppColors.colorPrimaryGreen,
                      borderColor: AppColors.colorSecondaryGreen,
                      titleText: "Book Class")
                     
                      ],
                    ),
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
        child: const SafeArea(
          top: false,
          child: CommonBottomNavBar(currentIndex: 58),
        ),
      ),
   

    );
  }

  Widget _topBar() {
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
          GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
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

  Widget _screenTitle(String title) {
    return Row(
      children: [
        CommonText(
          text: title,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.colourPrimaryPurple,
        ),
        8.width,
        Expanded(
          child: Container(height: 1.5.h, color: AppColors.colourPrimaryPurple),
        ),
        8.width,
        Container(
          height: 48.h,
          width: 48.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: AppColors.colorGreyScalBlack60, width: 2),
          ),
          child: ClipOval(
            child: CommonImage(
              imageSrc: AppImages.clubLogo,
              fill: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }


  Widget _pill(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: CommonText(
        text: text,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.colourPrimaryPurple,
      ),
    );
  }


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
    child: Column(
      children: [
        Row(
          children: [
            10.width,
            Container(
              height: 45.h,
              width: 45.w,
              padding: EdgeInsets.all(7.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.colorPrimaryOrange,
                  width: 4,
                ),
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
            Expanded(
              child: Container(
                height: 5.h,
                decoration: BoxDecoration(color: AppColors.colourGreyscaleGrey),
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

            10.width,
          ],
        ),

        5.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: "Review Class",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.colorPrimaryOrange,
            ),
            CommonText(
              text: "Checkout",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.colorPrimaryBlack.withOpacity(0.6),
            ),
            CommonText(
              text: "Confirm & Pay",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.colorPrimaryBlack.withOpacity(0.6),
            ),
          ],
        ),
      ],
    ),
  );
}
