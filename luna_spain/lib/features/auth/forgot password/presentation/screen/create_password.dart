import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../utils/extensions/extension.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../controller/forget_password_controller.dart';
import '../../../../../../../utils/constants/app_images.dart';
import '../../../../../../../utils/constants/app_string.dart';

class CreatePassword extends StatelessWidget {
  CreatePassword({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // Background image

       

              Image.asset(AppImages.splashBg, fit: BoxFit.cover),

              SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                             50.height,
                      // Top logo
                      CommonImage(
                        imageSrc: AppImages.finalLogoText,
                        height: 61.h,
                        width: 176.w,
                        fill: BoxFit.contain,
                      ).center,

                      24.height,

                      // Center white card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title + subtitle
                              CommonText(
                                text: AppString.resetPassword,
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                                color: AppColors.colourPrimaryPurple,
                              ).center,
                              6.height,
                              CommonText(
                                text: AppString.enterNewPasswordBelow,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.colorPrimaryBlack,
                              ).center,

                              28.height,

                              // NEW PASSWORD
                              CommonText(
                                text: AppString.newPassword.toUpperCase(),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                              ),
                              CommonTextField(
                                controller: controller.passwordController,
                                isPassword: true,
                                hintText: AppString.password,
                                fillColor: AppColors.colourGreyScaleGreyTint60,
                                borderColor: AppColors.colourGreyScaleGreyTint40,
                                borderRadius: 8,
                                textColor: AppColors.black,
                                hintTextColor: AppColors.black_200,
                                onChanged: controller.evaluatePassword,
                              ),
                              
                              _PasswordRulesBox(),

                              // CONFIRM NEW PASSWORD
                              CommonText(
                                text: AppString.confirmNewPassword.toUpperCase(),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                                top: 16,
                              ),
                              CommonTextField(
                                controller: controller.confirmPasswordController,
                                isPassword: true,
                                hintText: AppString.confirmPassword,
                                fillColor: AppColors.colourGreyScaleGreyTint60,
                                borderColor: AppColors.colourGreyScaleGreyTint40,
                                borderRadius: 8,
                                textColor: AppColors.black,
                                hintTextColor: AppColors.black_200,
                              ),

                              20.height,

                              // Reset password button
                              CommonButton(
                                titleText: AppString.resetPasswordCta,
                                isLoading: controller.isLoadingReset,
                                onTap: () {
                             
                                     controller.resetPasswordRepo(formKey);

                                },
                                buttonColor: AppColors.colorPrimaryGreen,
                                borderColor: AppColors.colorSecondaryGreen,
                                titleColor: AppColors.colorPrimaryBlack,
                                buttonRadius: 8,
                                buttonHeight: 52,
                                titleSize: 20,
                                borderWidth: 2,
                                titleWeight: FontWeight.w600,
                              ),

                              10.height,
                              CommonText(
                                text: AppString.allFieldsRequired,
                                fontSize: 12,
                                maxLines: 2,
                                color: AppColors.colorPrimaryBlack,
                              ).center,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PasswordRulesBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder: (c) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.colourGreyScaleGreyTint40,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.r), bottomRight: Radius.circular(8.r))),
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "Your password must:",
                fontSize: 12,
                color: AppColors.black_300,
                bottom: 8,
              ),
              _rule(ok: c.hasMinLength, text: "contain at least 8 characters"),
              _rule(ok: c.hasUpperAndLower, text: "contain lower and UPPERCASE letters"),
              _rule(ok: c.hasNumber, text: "contain at least 1 number"),
              _rule(ok: c.hasSpecial, text: "contain at least 1 special character ~! @#\$%^&*"),
            ],
          ),
        );
      },
    );
  }

  Widget _rule({required bool ok, required String text}) {
    final Color color = ok ? AppColors.colorPrimaryGreen : AppColors.colorPrimaryOrange;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon( Icons.check_circle, size: 20.sp, color: color),
          8.width,
          Expanded(
            child: CommonText(
              textAlign: TextAlign.start,
              text: text,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              maxLines: 2,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
