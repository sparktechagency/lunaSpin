import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/utils/helpers/other_helper.dart';
import '../../../../../../../utils/extensions/extension.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../controller/sign_up_controller.dart';
import '../../../../../../../utils/constants/app_string.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/features/auth/sign in/presentation/widgets/social_button.dart';
import '../../../../../../../config/route/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image (same as splash/sign-in)
          Image.asset(
            AppImages.splashBg,
            fit: BoxFit.cover,
          ),

          SafeArea(
            child: GetBuilder<SignUpController>(
              init: SignUpController(),
              builder: (controller) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Top logo
                      CommonImage(
                        imageSrc: AppImages.finalLogoText,
                        height: 61.h,
                        width: 176.w,
                        fill: BoxFit.contain,
                      ).center,

                      24.verticalSpace,

                      // Center card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Form(
                          key: controller.signUpFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title and subtitle
                              CommonText(
                                text: AppString.letsGetStarted,
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                                color: AppColors.colourPrimaryPurple,
                              ).center,
                              6.height,
                              CommonText(
                                text: AppString.enterEmailCreatePasswordBelow,
                                fontSize: 14,
                                maxLines: 2,
                                color: AppColors.black_300,
                              ).center,

                              20.height,

                              // Email label and field
                              CommonText(
                                text: AppString.emailAddress.toUpperCase(),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                              ),
                              CommonTextField(
                                controller: controller.emailController,
                                hintText: "name@domain.com...",
                                validator: OtherHelper.emailValidator,
                                fillColor: AppColors.colourGreyScaleGreyTint40,
                                borderColor: AppColors.colourGreyScaleGreyTint60,
                                borderRadius: 8,
                                
                                textColor: AppColors.black,
                                hintTextColor: AppColors.black_200,
                              ),

                              // Password label and field
                              CommonText(
                                text: AppString.password.toUpperCase(),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorPrimaryBlack,
                                bottom: 8,
                                top: 16,
                              ),
                              CommonTextField(
                                controller: controller.passwordController,
                                isPassword: true,
                                hintText: AppString.password,
                                validator: OtherHelper.passwordValidator,
                                fillColor: AppColors.colourGreyScaleGreyTint40,
                                borderColor: AppColors.colourGreyScaleGreyTint60,
                                borderRadius: 8,
                                textColor: AppColors.black,
                                hintTextColor: AppColors.black_200,
                                onChanged: controller.evaluatePassword,
                              ),

                              10.height,
                              // Password rules box
                              _PasswordRulesBox(),

                              // Confirm password label and field
                              CommonText(
                                text: AppString.confirmPassword.toUpperCase(),
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
                                validator: (value) => OtherHelper.confirmPasswordValidator(
                                  value,
                                  controller.passwordController,
                                ),
                                fillColor: AppColors.colourGreyScaleGreyTint40,
                                borderColor: AppColors.colourGreyScaleGreyTint60,
                                borderRadius: 8,
                                textColor: AppColors.black,
                                hintTextColor: AppColors.black_200,
                              ),

                              14.height,

                              // Agree to terms checkbox + text
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 24.w,
                                    height: 24.w,
                                    child: Checkbox(
                                      value: controller.agreeToTerms,
                                      onChanged: controller.toggleAgreeTerms,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  ),
                                  10.width,
                                  Expanded(
                                    child: Wrap(
                                      children: [
                                        CommonText(
                                          text: AppString.iHaveReadAgree,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.colorPrimaryBlack,
                                        ),
                                        4.width,
                                        GestureDetector(
                                          onTap: () => Get.toNamed(AppRoutes.termsOfServices),
                                          child: Column(
                                            children: [
                                              CommonText(
                                                text: AppString.termsOfServices,
                                                fontSize: 14,
                                                textAlign: TextAlign.start,
                                                color: AppColors.colorPrimaryBlack,
                                                fontWeight: FontWeight.w600,
                                              ),

                                              Container(
                                                height: 1,
                                                width: 130.w,
                                                color: AppColors.colorPrimaryBlack,
                                              ),
                                            ],
                                          ),
                                        ),
                                        CommonText(
                                          text: " and ",
                                          fontSize: 14,
                                          color: AppColors.colorPrimaryBlack,
                                        ),
                                        GestureDetector(
                                          onTap: () => Get.toNamed(AppRoutes.privacyPolicy),
                                          child: Column(
                                            children: [
                                              CommonText(
                                                text: AppString.privacyPolicy,
                                                fontSize: 14,
                                                textAlign: TextAlign.start,
                                                color: AppColors.colorPrimaryBlack,
                                                fontWeight: FontWeight.w600,
                                              ),
                                                Container(
                                                height: 1,
                                                width: 110.w,
                                                color: AppColors.colorPrimaryBlack,
                                              ),
                                            ],
                                          ),
                                        ),
                                        CommonText(
                                          text: ".",
                                          fontSize: 14,
                                          color: AppColors.colorPrimaryBlack,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              8.height,

                              // Confirm adult checkbox
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 24.w,
                                    height: 24.w,
                                    child: Checkbox(
                                      value: controller.confirmAdult,
                                      onChanged: controller.toggleConfirmAdult,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  ),
                                  10.width,
                                  Expanded(
                                    child: CommonText(
                                      text: AppString.iConfirmAdult,
                                      fontSize: 14,
                                      textAlign: TextAlign.start,
                                      color: AppColors.black_300,
                                    ),
                                  ),
                                ],
                              ),

                              16.height,

                              // Create account button
                              CommonButton(
                                titleText: AppString.createAccount,
                                isLoading: controller.isLoading,
                                onTap: controller.signUpUser,
                                buttonColor: AppColors.colorPrimaryGreen,
                                borderColor: AppColors.colorSecondaryGreen,
                                titleColor: AppColors.colorPrimaryBlack,
                                buttonRadius: 8,
                                buttonHeight: 52,
                                titleSize: 20,
                                borderWidth: 2,
                                titleWeight: FontWeight.w600,
                              ),

                              16.height,

                              // Divider with text
                              Row(
                                children: [
                                  Expanded(child: Container(height: 1, color: AppColors.colourPrimaryPurple)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                                    child: CommonText(
                                      text: AppString.signUpWith,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.colourPrimaryPurple,
                                    ),
                                  ),
                                  Expanded(child: Container(height: 1, color: AppColors.colourPrimaryPurple)),
                                ],
                              ),

                              12.height,

                              // Google
                              SocialButton(
                                borderColor: AppColors.colourGreyScaleGreyTint40,
                                borderWidth: 2,
                                bgColor: AppColors.colourGreyScaleGreyTint60,
                                textColor: AppColors.black_400,
                                iconSrc: AppIcons.googleAuth,
                                label: "Sign up with Google",
                                onTap: () {},
                              ),

                              10.height,

                              // Apple
                              SocialButton(
                                borderColor: AppColors.colourGreyScaleGreyTint40,
                                borderWidth: 2,
                                bgColor: AppColors.colorPrimaryBlack,
                                textColor: AppColors.white,
                                iconSrc: AppIcons.appleAuth,
                                label: "Sign up with Apple",
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),

                      28.verticalSpace,

                      // Bottom sign-in pill
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(28.r),
                        ),
                        child: Column(
                          children: [
                            CommonText(
                              text: AppString.alreadyHaveAccount,
                              fontSize: 20,
                              color: AppColors.colourPrimaryPurple,
                              bottom: 10,
                              fontWeight: FontWeight.w600,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(28.r),
                               onTap: () => Get.toNamed(AppRoutes.signIn)
,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CommonText(
                                          text: "Welcome back.",
                                          fontSize: 16,
                                          right: 5,
                                          color: AppColors.colorPrimaryBlack,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        Column(
                                          children: [
                                            CommonText(
                                              text: "${AppString.logInHere} ",
                                              fontSize: 16,
                                              color: AppColors.colorPrimaryBlue,
                                              fontWeight: FontWeight.w600,
                                            ),
 
                                              Container(
                                                width: 100.w,
                                                height: 1.h,
                                                color: AppColors.colorPrimaryBlue,
                                              ),
 
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      28.verticalSpace,

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

class _PasswordRulesBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (c) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.colourGreyScaleGreyTint40,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "Your password must:",
                fontSize: 12,
                color: AppColors.black_300,
                bottom: 8,
              ),
              _rule(
                ok: c.hasMinLength,
                text: "contain at least 8 characters",
              ),
              _rule(
                ok: c.hasUpperAndLower,
                text: "contain lower and UPPERCASE letters",
              ),
              _rule(
                ok: c.hasNumber,
                text: "contain at least 1 number",
              ),
              _rule(
                ok: c.hasSpecial,
                text: "contain at least 1 special character ~! @#\$%^&*",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _rule({required bool ok, required String text}) {
    final Color color = ok ?  AppColors.colorPrimaryOrange:AppColors.colorPrimaryGreen ;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
           Icons.check_circle,
            size: 26.sp,
            color: color,
          ),
          8.width,
          Expanded(
            child: CommonText(
              textAlign: TextAlign.start,
              text: text,
              fontSize: 13,
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
