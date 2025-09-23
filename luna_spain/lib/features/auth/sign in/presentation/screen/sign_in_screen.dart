import 'package:flutter/material.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/features/auth/sign%20in/presentation/widgets/social_button.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import '../../../../../../../config/route/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../controller/sign_in_controller.dart';
import '../../../../../../../utils/constants/app_string.dart';
import '../../../../../../../utils/helpers/other_helper.dart';
import '../../../../../../../utils/constants/app_colors.dart';
import '../../../../../../../utils/constants/app_images.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            AppImages.splashBg,
            fit: BoxFit.cover,
          ),

          // Content
          SafeArea(
            child: GetBuilder<SignInController>(
              init: SignInController(),
              builder: (controller) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     
                      CommonImage(
                        imageSrc: AppImages.finalLogoText,
                        height: 61.h,
                        width: 176.w,
                        fill: BoxFit.contain,
                      ).center,

                      24.verticalSpace,

                      // Center white card
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              CommonText(
                                text: AppString.welcomeBack,
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                                color: AppColors.colourPrimaryPurple,
                                bottom: 20,
                              ).center,

                              // Email
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
                                borderColor: Colors.transparent,
                                borderRadius: 8,
                                textColor: AppColors.black,
                                hintTextColor: AppColors.black_200,
                              ),

                              // Password
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
                                borderColor: Colors.transparent,
                                borderRadius: 8,
                                textColor: AppColors.black,
                                hintTextColor: AppColors.black_200,
                              ),

                              15.verticalSpace,

                         

                              // Login button
                              CommonButton(
                                titleText: AppString.logIn,
                                isLoading: controller.isLoading,
                                onTap: controller.signInUser,
                                buttonColor: AppColors.colorPrimaryGreen,
                                borderColor: AppColors.colorSecondaryGreen,
                                titleColor: AppColors.colorPrimaryBlack,
                                buttonRadius: 8,
                                buttonHeight: 52,
                                titleSize: 20,
                                borderWidth: 2,
                                titleWeight: FontWeight.w600,
                              ),


                               // Forgot password
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                                  child: Wrap(
                                    children: [
                                      Column(
                                        
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CommonText(
                                            text: AppString.forgotPasswordQuestion,
                                            top: 12,
                                            color: AppColors.colorPrimaryBlue,
                                            fontSize: 16,
                                            underline: true,
                                            fontWeight: FontWeight.w600,
                                          ),
                                       
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              20.height,

                              // Divider with text
                              Row(
                                children: [
                                  Expanded(child: Container(height: 1, color: AppColors.colourPrimaryPurple)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                                    child: CommonText(
                                      text: AppString.signInWith,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.colourPrimaryPurple,
                                    ),
                                  ),
                                  Expanded(child: Container(height: 1, color: AppColors.colourPrimaryPurple)),
                                ],
                              ),

                              12.verticalSpace,

                              // Google button
                              SocialButton(
                                borderColor: AppColors.colourGreyScaleGreyTint40,
                                borderWidth: 2,
                                bgColor: AppColors.colourGreyScaleGreyTint60,
                                textColor: AppColors.black_400,
                                iconSrc: AppIcons.googleAuth,
                                label: "Log In with Google",
                                onTap: () {},
                              ),

                              10.verticalSpace,

                              // Apple button
                              SocialButton(
                                borderColor: AppColors.colourGreyScaleGreyTint40,
                                borderWidth: 2,
                                bgColor: AppColors.colorPrimaryBlack,
                                textColor: AppColors.white,
                                iconSrc: AppIcons.appleAuth,
                                label: "Log In with Apple",
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),

                      28.verticalSpace,

                      // Bottom sign-up pill
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
                              text: AppString.dontHaveAccountQuestion,
                              fontSize: 20,
                              color: AppColors.colourPrimaryPurple,
                              bottom: 10,
                              
                              fontWeight: FontWeight.w600,
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.signUp),
                              child: Column(
                                children: [
                                  CommonText(
                                    text: AppString.createYourAccountToday,
                                    fontSize: 16,
                                    underline: true,
                                    color: AppColors.colorPrimaryBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                               
                              
                                ],
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
                              underline: true,
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
                              underline: true,
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