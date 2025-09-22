import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/features/another_screen/profile_details/presentation/widgets/do_this_latter_popup.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import '../controller/account_confirmed_controller.dart';

class AccountConfirmedScreen extends StatelessWidget {
  const AccountConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.splashBg, fit: BoxFit.cover),
          SafeArea(
            child: GetBuilder<AccountConfirmedController>(
              init: AccountConfirmedController(),
              builder: (controller) {
                return Column(
                  children: [
                    
                    Container(
                      padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 40.h, bottom: 14.h),
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
                          
                        )
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
                          // Profile picture placeholder
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
                    ),

                    22.height,
                    
                    // Main content
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Center card
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(25.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Column(
                              children: [
                          3.height,
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 16.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.colorSecondaryGreen, // Light green
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: CommonText(
                                    text: AppString.accountConfirmed,
                                    fontSize: 16.sp,
                                    maxLines: 2,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.colorPrimaryBlack, // Dark green
                                  ).center,
                                ),
                                
                                32.height,
                                
                                // Hand illustration with sparkles
                                CommonImage(
                                  height: 120.h,
                                  width: 120.w,
                                  imageSrc: AppIcons.goodToSee),
                                32.height,
                                
                                CommonText(
                                  text: AppString.goodToSeeYou,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.colourPrimaryPurple,
                                  bottom: 10,
                                ).center,
                                
                                CommonText(
                                  text: AppString.accountConfirmedDetails,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.colorPrimaryBlack,
                                  maxLines: 3,
                                ).center,
                                
                                21.height,
                                
                                // Get started button
                                CommonButton(
                                  titleText: AppString.getStarted,
                                  onTap: controller.getStarted,
                                  buttonColor: AppColors.colorPrimaryGreen, // Teal color from design
                                  borderColor: AppColors.colorSecondaryGreen,
                                  titleColor: AppColors.white,
                                  buttonRadius: 12,
                                  buttonHeight: 56,
                                  titleSize: 18,
                                  borderWidth: 2,
                                  titleWeight: FontWeight.w600,
                                ),

                                14.height,




                                
                               Container(
                             
                                height: 3,
                                width: double.infinity,
                                color: AppColors.colourGreyScaleGreyTint60,
                               ),
                                
                                // I'll do this later button
                                GestureDetector(
                                  onTap: () => DoThisLaterPopup.show(onYes: controller.doThisLater),
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.h,
                                    child: Center(
                                      child: CommonText(
                                        text: AppString.illDoThisLater,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.colorPrimaryBlue,
                                       
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
}
