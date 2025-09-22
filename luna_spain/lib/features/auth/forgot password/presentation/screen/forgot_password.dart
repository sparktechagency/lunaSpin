import 'package:flutter/material.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import '../../../../../../../utils/extensions/extension.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../component/button/common_button.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../component/text_field/common_text_field.dart';
import '../controller/forget_password_controller.dart';
import '../../../../../../../utils/constants/app_string.dart';
import '../../../../../../../utils/helpers/other_helper.dart';
import '../../../../../../config/route/app_routes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder: (controller) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background
            Image.asset(AppImages.splashBg, fit: BoxFit.cover),

            SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    60.height,
                    CommonImage(
                      imageSrc: AppImages.finalLogoText,
                      height: 61.h,
                      width: 176.w,
                      fill: BoxFit.contain,
                    ).center,

                    65.height,

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
                            // Title and subtitle
                            CommonText(
                              text: AppString.notAProblem,
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              color: AppColors.colourPrimaryPurple,
                            ).center,
                            8.height,
                            CommonText(
                              text: AppString.enterEmailToReset,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorPrimaryBlack,
                              maxLines: 2,
                            ).center,

                            28.height,

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

                            16.height,

                            // Submit button
                            CommonButton(
                              titleText: AppString.submit,
                              isLoading: controller.isLoadingEmail,
                            onTap: () {
  if (formKey.currentState!.validate()) {
    controller.forgotPasswordRepo(formKey);
    
  }
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

                            // Cancel link
                            10.height,
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () => Get.back(),
                                child: CommonText(
                                  text: AppString.cancel,
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                          child: Column(
                            children: [
                              CommonText(
                                text: AppString.termsOfServices,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white.withOpacity(0.9),
                              ),

                              Container(width: 120.w, height: 1.h, color: AppColors.white.withOpacity(0.9),)
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

                              Container(width: 95.w, height: 1.h, color: AppColors.white.withOpacity(0.9),)
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
        ),
      ),
    );
  }
}
