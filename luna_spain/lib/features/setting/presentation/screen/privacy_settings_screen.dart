import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/features/setting/presentation/controller/privacy_settings_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<PrivacySettingsController>()) {
      Get.put(PrivacySettingsController());
    }

    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<PrivacySettingsController>(builder: (c) {
        return Column(
          children: [
            _TopBar(),
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
                        text: AppString.privacy,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorPrimaryBlack,
                        bottom: 16.h,
                      ).center,

                      // Info card
                      if (c.showInfoCard)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(14.w),
                          decoration: BoxDecoration(
                            color: AppColors.colourGreyScaleGreyTint40,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: AppString.yourDataAndOutsideWorld,
                                    fontSize: 18,
                                    maxLines: 2,
                                  
                                    fontWeight: FontWeight.w600,

                                    color: AppColors.colorPrimaryBlack,
                                  ),
                                  InkWell(
                                    onTap: c.dismissInfoCard,
                                    child: const Icon(Icons.close, size: 22, color: AppColors.colorPrimaryBlack),
                                  )
                                ],
                              ),
                              8.height,
                              CommonText(
                                text: AppString.privacyCardBody,
                                fontSize: 16,
                                maxLines: 20,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                                color: AppColors.colorPrimaryBlack,
                              ),
                              10.height,
                         ],
                          ),
                        ),

                        14.height,

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: CommonText(
                                      text: AppString.termsOfService,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.colorPrimaryBlue,
                                      underline: true,
                                    ),
                                  ),
                                     12.width,

                                  Container(
                                    height: 5.h,
                                    width: 5.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.colorPrimaryBlack,
                                    ),
                                  ),
                                  12.width,
                                  InkWell(
                                    onTap: () {},
                                    child: CommonText(
                                      text: AppString.privacyLink,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.colorPrimaryBlue,
                                      underline: true,
                                    ),
                                  ),
                                ],
                              )
                           ,

                      18.height,
                      // Marketing permissions section
                      CommonText(
                        text: AppString.marketingPermissions,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.colorPrimaryBlack,
                        bottom: 8.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                        ),
                        child: Column(
                          children: [
                            _RadioRow(
                              label: AppString.marketingNo,
                              value: 0,
                              groupValue: c.marketingPermission,
                              onChanged: c.setMarketingPermission,
                            ),
                            _RadioRow(
                              label: AppString.marketingYes,
                              value: 1,
                              groupValue: c.marketingPermission,
                              onChanged: c.setMarketingPermission,
                            ),
                          ],
                        ),
                      ),

                      21.height,
                      // Danger Zone block
                      CommonText(
                        text: AppString.dangerZone,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.colorNoticeError,
                        bottom: 8.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: AppString.closeAccountInfo,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.colorPrimaryBlack,
                            bottom: 8.h,
                            textAlign: TextAlign.start,
                            maxLines: 50,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.closeAccount);
                            },
                            child: CommonText(
                              text: AppString.submitAccountClosure,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorNoticeError,
                              underline: true,
                            ),
                          )
                        ],
                      ),
                      10.height,
                    ],
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
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.r),
            topRight: Radius.circular(28.r),
          ),
        ),
        child: const SafeArea(top: false, child: CommonBottomNavBar(currentIndex: 8)),
      ),
    );
  }
}

class _RadioRow extends StatelessWidget {
  final String label;
  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;
  const _RadioRow({required this.label, required this.value, required this.groupValue, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    final bool selected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 22.w,
              height: 22.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF0F0F0),
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? AppColors.colourPrimaryPurple : Colors.transparent,
                  ),
                ),
              ),
            ),
            10.width,
            Flexible(
              child: CommonText(
                text: label,
                fontSize: 14,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w600,
                maxLines: 10,
                color: AppColors.colorPrimaryBlack,
              ),
            ),
          ],
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
