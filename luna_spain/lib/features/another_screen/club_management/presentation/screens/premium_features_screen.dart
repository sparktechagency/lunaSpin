import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/controller/premium_features_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class PremiumFeaturesScreen extends StatelessWidget {
  const PremiumFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<PremiumFeaturesController>()) {
      Get.put(PremiumFeaturesController());
    }

    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<PremiumFeaturesController>(builder: (c) {
        return Column(
          children: [
            const _TopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    12.height,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Beta banner
                          _BetaBanner(visible: c.isBetaFree),
                          14.height,
                          CommonText(
                            text: 'Club Premium Features',
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: AppColors.colorPrimaryBlack,
                            bottom: 12,
                          ).center,

                          25.height,

                          // Community & Articles
                          _SectionHeader(title: 'COMMUNITY & ARTICLES', price: '£${c.communityArticlesPrice.toStringAsFixed(2)} per month'),
                          _CardRadioTwo(
                            groupValue: c.communityArticles,
                            onChanged: c.setCommunityArticles,
                          ),

                          16.height,

                          // Booking System
                          _SectionHeader(title: 'BOOKING SYSTEM', price: '£${c.bookingSystemPrice.toStringAsFixed(2)} per month'),
                          _CardRadioTwo(
                            groupValue: c.bookingSystem,
                            onChanged: c.setBookingSystem,
                          ),

                          16.height,

                          // Coming Soon
                          const CommonText(
                            text: 'COMING SOON',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.colorPrimaryBlack,
                            bottom: 10,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(18.w),
                            decoration: BoxDecoration(
                              color: AppColors.colorPrimaryVanilaTint20,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [

                                _Bullet(text: 'Sponsorship & Affiliate'),
                                _Bullet(text: 'Community Direct Messaging'),
                                _Bullet(text: 'Club Advertising'),
                                _Bullet(text: 'Shows & Events'),
                          
                          
                                _Bullet(text: 'Feedback & Reviews'),
                                _Bullet(text: 'Option 03'),
                                _Bullet(text: 'Option 03'),
                              ],
                            ),
                          ),

                          16.height,

                          // Total + Note
                          _TotalCard(total: c.calculatedTotal, isBetaFree: c.isBetaFree),

                          16.height,

                          // Update button
                          CommonButton(
                            titleText: 'Update',
                            onTap: c.onUpdate,
                            isLoading: c.isSaving,
                            buttonColor: AppColors.colorPrimaryGreen,
                            borderColor: AppColors.colorSecondaryGreen,
                            titleColor: AppColors.colorPrimaryBlack,
                            buttonRadius: 12,
                            buttonHeight: 56,
                            titleSize: 18,
                            borderWidth: 2,
                            titleWeight: FontWeight.w600,
                          ),

                          12.height,

                          // Cancel
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: SizedBox(
                              width: double.infinity,
                              height: 44.h,
                              child: const Center(
                                child: CommonText(
                                  underline: true,
                                  text: 'Cancel',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.colorNoticeError,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    100.height,
                  ],
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

class _SectionHeader extends StatelessWidget {
  final String title;
  final String price;
  const _SectionHeader({required this.title, required this.price});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.colorPrimaryBlack,
          bottom: 8,
        ),
        CommonText(
          text: price,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.colorGreyScalBlack60,
          bottom: 8,
        ),
      ],
    );
  }
}

class _CardRadioTwo extends StatelessWidget {
  final int groupValue; // 0 Off, 1 On
  final ValueChanged<int> onChanged;
  const _CardRadioTwo({required this.groupValue, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          _RadioRow(label: 'Off', value: 0, groupValue: groupValue, onChanged: onChanged),
          _RadioRow(label: 'On', value: 1, groupValue: groupValue, onChanged: onChanged),
        ],
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
          children: [
            Container(
              width: 22.w,
              height: 22.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colourGreyScaleGreyTint40,
              ),
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? AppColors.colourPrimaryPurple : AppColors.colourGreyScaleGreyTint40,
                  ),
                ),
              ),
            ),
            11.width,
            CommonText(
              text: label,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.colourGreyScaleBlack,
            ),
          ],
        ),
      ),
    );
  }
}

class _BetaBanner extends StatelessWidget {
  final bool visible;
  const _BetaBanner({required this.visible});
  @override
  Widget build(BuildContext context) {
    if (!visible) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.colorNoticeWaring,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
      ),
      child: const CommonText(
        text:
            "While LunaSpin is still in Beta version, all our club premium features will be FREE of charge. This includes all our current and upcoming features.\n\nThis is subject to change. Club Managers will be notified by email 45 days prior to platform exiting Beta and charges being applied.",
        fontSize: 16,
        maxLines: 23,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w600,
        color: AppColors.colorPrimaryBlack,
      ),
    );
  }
}

class _TotalCard extends StatelessWidget {
  final double total;
  final bool isBetaFree;
  const _TotalCard({required this.total, required this.isBetaFree});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.colourGreyScaleGreyTint60,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CommonText(
                text: 'Total',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.colorPrimaryBlack,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                     const CommonText(
                    text: 'Beta discount applied.',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.colorNoticeError,
                  ),

                  Row(
                    children: [

                      CommonText(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorGreyScalBlackTint80,
                        right: 10,
                        text: "£8.98"),


                      CommonText(
                        text: '£${total.toStringAsFixed(2)}',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.colorPrimaryBlack,
                      ),


                        CommonText(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorGreyScalBlackTint80,
                        left: 10,
                        text: "per month"),
                    ],
                  ),
               
                ],
              ),
            ],
          ),
          15.height,
          const CommonText(
            text:
                'Your next invoice will be issued on 16th February 2025. Billing is pro-rated, based on the amount of time you access a service or product.',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.start,

            maxLines: 5,
            color: AppColors.colorGreyScalBlackTint80,
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();
  @override
  Widget build(BuildContext context) {
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
          InkWell(onTap: () => Get.back(), child: Icon(Icons.arrow_back, color: AppColors.white, size: 40.h)),
          const CommonImage(
            imageSrc: AppImages.logoWithBg,
            height: 40,
            width: 115,
            fill: BoxFit.contain,
          ),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 2),
            ),
            child: const ClipOval(
              child: CommonImage(
                imageSrc: AppImages.man,
                height: 48,
                width: 48,
                fill: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bullet dot
          Container(
            margin: EdgeInsets.only(top: 7.h),
            width: 6.w,
            height: 6.w,
            decoration: const BoxDecoration(
              color: AppColors.colorPrimaryBlack,
              shape: BoxShape.circle,
            ),
          ),
          8.width,
          // Bullet text
          Expanded(
            child: CommonText(
              text: text,
              fontSize: 16,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600,
              color: AppColors.colorPrimaryBlack,
            ),
          ),
        ],
      ),
    );
  }
}