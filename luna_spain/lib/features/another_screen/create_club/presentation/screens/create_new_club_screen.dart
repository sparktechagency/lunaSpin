import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/component/text_field/common_text_field.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import '../controller/create_new_club_controller.dart';

class CreateNewClubScreen extends StatelessWidget {
  const CreateNewClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure single controller instance (avoid init param as per app pattern)
    if (!Get.isRegistered<CreateNewClubController>()) {
      Get.put(CreateNewClubController());
    }
    final c = Get.find<CreateNewClubController>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.colourPrimaryPurple,
              AppColors.colorPrimaryBlack,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _TopBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 460.w),
                      child: Obx(
                        () => _FormCard(
                          websiteCtrl: c.websiteCtrl,
                          emailCtrl: c.emailCtrl,
                          isActiveClub: c.isActiveClub.value,
                          acceptReview: c.acceptReview.value,
                          acceptTerms: c.acceptTerms.value,
                          onToggleActive: c.toggleActive,
                          onToggleReview: c.toggleReview,
                          onToggleTerms: c.toggleTerms,
                          onSubmit: c.submit,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _TopBar extends StatelessWidget {
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
}



class _FormCard extends StatelessWidget {
  final TextEditingController websiteCtrl;
  final TextEditingController emailCtrl;
  final bool isActiveClub;
  final bool acceptReview;
  final bool acceptTerms;
  final ValueChanged<bool> onToggleActive;
  final ValueChanged<bool> onToggleReview;
  final ValueChanged<bool> onToggleTerms;
  final VoidCallback onSubmit;

  const _FormCard({
    required this.websiteCtrl,
    required this.emailCtrl,
    required this.isActiveClub,
    required this.acceptReview,
    required this.acceptTerms,
    required this.onToggleActive,
    required this.onToggleReview,
    required this.onToggleTerms,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top hands/celebration illustration placeholder
         CommonImage(
          
          height: 120,
          width: 120,
          imageSrc: AppIcons.goodToSee),
          10.verticalSpace,
          CommonText(
            text: 'Oh, new club?',
            textAlign: TextAlign.center,
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: AppColors.colourPrimaryPurple,
          ),
          6.verticalSpace,
          CommonText(
            text:
                'We love to see new and exciting clubs join the LunaSpin community.\nBefore getting started, we have a few questions we\'d like to ask you first.',
            textAlign: TextAlign.center,
            fontSize: 18,
            maxLines: 2,
            fontWeight: FontWeight.w400,
            color: AppColors.colorPrimaryBlack,
          ),

            CommonText(
            text:
                'Before getting started, we have a few questions we’d like to ask you first.',
            textAlign: TextAlign.center,
            fontSize: 18,
            maxLines: 2,
            top: 5,
            fontWeight: FontWeight.w400,
            color: AppColors.colorPrimaryBlack,
          ),
          21.verticalSpace,
          CommonText(
            text: 'WHAT IS YOUR CLUBS WEBSITE?',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.colorPrimaryBlack,
          ).start,
          7.verticalSpace,
          CommonTextField(
            controller: websiteCtrl,
            hintText: 'www.CLUB-NAME.com...',
            fillColor: AppColors.colourGreyScaleGreyTint60,
            borderColor: AppColors.colourGreyScaleGreyTint60,
            borderRadius: 8,
            keyboardType: TextInputType.url,
          ),
          12.verticalSpace,

          CommonText(
            text: 'CLUBS EMAIL ADDRESS?',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.colorPrimaryBlack,
          ).start,
          7.verticalSpace,
          CommonTextField(
            controller: emailCtrl,
            hintText: 'name@domain.com...',
            fillColor: AppColors.colourGreyScaleGreyTint60,
            borderColor: AppColors.colourGreyScaleGreyTint60,
            borderRadius: 8,
            keyboardType: TextInputType.emailAddress,
          ),
          28.verticalSpace,
          _checkbox(
            value: isActiveClub,
            onChanged: onToggleActive,
            text: 'I confirm this club is active and accepting new member enquiries.',
          ),
          21.verticalSpace,
          _checkbox(
            value: acceptReview,
            onChanged: onToggleReview,
            text:
                'I accept that the LunaSpin team will review and validate my club after creation, and that I may be contacted at anytime directly through the email address on my account for club validation, which could lead to the closure of this club on LunaSpin if checks fail.',
          ),
          21.verticalSpace,
          _checkbox(
            value: acceptTerms,
            onChanged: onToggleTerms,
            text:
                'I confirm that I have read and will comply with the Terms of Service and Privacy Policy, and that I am 18 years or over.',
            linkText: 'Terms of Service and Privacy Policy',
          ),
          21.verticalSpace,

          CommonButton(
            borderColor: AppColors.colorSecondaryGreen,
            borderWidth: 2,
            buttonRadius: 7,
            buttonHeight: 52,
            buttonColor: AppColors.colorPrimaryGreen,
            
            titleText: 'Get started', onTap: onSubmit),
     14.verticalSpace,
     Container(
      height: 1,
      color: AppColors.colourGreyScaleGreyTint60,
      width: double.infinity,),


      14.height,
          Center(
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.userHome),
              child: CommonText(
                text: 'Cancel',
                fontSize: 14,
                underline: true,
                fontWeight: FontWeight.w600,
                color: AppColors.colorNoticeError,
              ),
            ),
          ),
          8.verticalSpace,
          Center(
            child: CommonText(
              text: 'All form fields are required for form submission',
              fontSize: 12,
              bottom: 20,
              fontWeight: FontWeight.w400,
              color: AppColors.colorPrimaryBlack,
            ),
          ),
        ],
      ),
    );
  }

  

  Widget _checkbox({
    required bool value,
    required ValueChanged<bool> onChanged,
    required String text,
    String? linkText,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 30.w,
          height: 30.w,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
           
            ),
            child: Transform.scale(
              scale: 1.2,
              child: Checkbox(
                value: value,
                onChanged: (v) => onChanged(v ?? false),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                side: BorderSide(color: AppColors.colourGreyScaleGreyTint40),
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.colourPrimaryPurple;
                  }
                  return AppColors.colourGreyScaleGreyTint40; // light grey square when unchecked
                }),
              ),
            ),
          ),
        ),
         8.horizontalSpace,
         Expanded(
           child: RichText(
             text: TextSpan(
               style: TextStyle(
                 fontSize: 16.sp,
                
                 fontWeight: FontWeight.w400,
                 color: AppColors.colorPrimaryBlack,
               ),
               children: [
                 TextSpan(text: text),
                 if (linkText != null) ...[
                   const TextSpan(text: ' '),
                   TextSpan(
                     text: linkText,
                     style:  TextStyle(
                       fontSize: 16.sp,
                       fontWeight: FontWeight.w600,
                       color: AppColors.colorPrimaryBlack,
                       decoration: TextDecoration.underline,
                       decorationColor: AppColors.colorPrimaryBlack,
                     ),
                   ),
                 ],
               ],
             ),
           ),
         ),
       ],
     );
   }
   
 }

