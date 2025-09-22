import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import '../../../../../../config/route/app_routes.dart';
import '../controller/check_inbox_controller.dart';

class CheckInboxScreen extends StatelessWidget {
  const CheckInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CheckInboxController>(
        init: CheckInboxController(),
        builder: (_) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(AppImages.splashBg, fit: BoxFit.cover),
              SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      80.height,
                      CommonImage(
                        imageSrc: AppImages.finalLogoText,
                        height: 61.h,
                        width: 176.w,
                        fill: BoxFit.contain,
                      ).center,

                      65.height,

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          children: [
                            CommonImage(
                              imageSrc: AppIcons.inboxEmail,
                              height: 92.h,
                              width: 92.w,
                              fill: BoxFit.contain,
                            ),
                            21.height,
                            CommonText(
                              text: AppString.checkYourInbox,
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              color: AppColors.colourPrimaryPurple,
                              bottom: 8,
                            ),
                            CommonText(
                              text: AppString.checkYourInboxDetails,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorPrimaryBlack,
                              maxLines: 3,
                            ).center,
                          ],
                        ),
                      ),

                      28.height,

                      CommonText(
                        text: " 2025 LunaSpin App.",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                        bottom: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.termsOfServices),
                            child: Column(
                              children: [
                                CommonText(
                                  text: AppString.termsOfServices,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white.withOpacity(0.9),
                                ),

                                Container(
                                  height: 1.h,
                                  width: 105.w,
                                  color: AppColors.white.withOpacity(0.9),
                                )
                              ],
                            ),
                          ),
                          CommonText(
                            text: "  •  ",
                            fontSize: 12,
                            color: AppColors.white.withOpacity(0.7),
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.privacyPolicy),
                            child: Column(
                              children: [
                                CommonText(
                                  text: AppString.privacyPolicy,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white.withOpacity(0.9),
                                ),

                                Container(
                                  height: 1.h,
                                  width: 90.w,
                                  color: AppColors.white.withOpacity(0.9),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
