import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import '../controller/confirm_account_controller.dart';
import '../../../../../../config/route/app_routes.dart';

class ConfirmAccountScreen extends StatelessWidget {
  const ConfirmAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.splashBg, fit: BoxFit.cover),
          SafeArea(
            child: GetBuilder<ConfirmAccountController>(
              init: ConfirmAccountController(),
              builder: (controller) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                  child: Column(
                    children: [
                      // Top logo
                      CommonImage(
                        imageSrc: AppImages.finalLogoText,
                        height: 61.h,
                        width: 176.w,
                        fill: BoxFit.contain,
                      ).center,

                      24.height,

                      // Center card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          children: [
                            // Envelope illustration
                            Container(
                              width: 92.w,
                              height: 92.w,
                              decoration: BoxDecoration(
                                color: AppColors.colourGreyScaleGreyTint40,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(Icons.mail_outline, size: 44.sp, color: AppColors.colorPrimaryBlack),
                            ),
                            16.height,
                            CommonText(
                              text: AppString.confirmAccount,
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              color: AppColors.colourPrimaryPurple,
                              bottom: 8,
                            ),
                            CommonText(
                              text: AppString.confirmAccountDetails,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorPrimaryBlack,
                              maxLines: 2,
                            ).center,
                            21.height,
                            Container(height: 1, color: AppColors.colourGreyScaleGreyTint60),
                            14.height,
                            CommonText(
                              text: AppString.notReceivedEmail,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorPrimaryBlack,
                              maxLines: 3,
                            ).center,
                            14.height,
                            _ResendButton(
                              borderColor: AppColors.colourGreyScaleGreyTint40,
                              borderWidth: 2,
                              
                              enabled: controller.remaining == 0,
                              label: "${AppString.resend} (${controller.remaining}s)",
                              onTap: controller.resend,
                            ),
                          ],
                        ),
                      ),

                      28.height,

                      // Footer
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
                            child: CommonText(
                              text: AppString.termsOfServices,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white.withOpacity(0.9),
                            ),
                          ),
                          CommonText(
                            text: "  •  ",
                            fontSize: 12,
                            color: AppColors.white.withOpacity(0.7),
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.privacyPolicy),
                            child: CommonText(
                              text: AppString.privacyPolicy,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ResendButton extends StatelessWidget {
  final bool enabled;
  final String label;
  final VoidCallback onTap;
  final Color borderColor;
  final double borderWidth;

  const _ResendButton({
    required this.enabled,
    required this.label,
    required this.onTap,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg = enabled ? AppColors.colorPrimaryGreen : AppColors.colourGreyScaleGreyTint60;
    final Color text = AppColors.colorPrimaryBlack;
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) => bg),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.r),
              side: BorderSide(color: borderColor, width: borderWidth.w),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
          overlayColor: WidgetStateProperty.all(AppColors.colourGreyScaleGreyTint60.withOpacity(0.4)),
        ),
        child: CommonText(
          text: label,
          fontSize: 16,
          color: text,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
