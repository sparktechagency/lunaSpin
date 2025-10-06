import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/features/another_screen/booking_settings_screen/presentation/controller/payment_setting_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class PaymentSettingScreen extends StatelessWidget {
  const PaymentSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<PaymentSettingController>()) {
      Get.put(PaymentSettingController());
    }
    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<PaymentSettingController>(builder: (c) {
        return Column(
          children: [
            const _TopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(12.w),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _headerWithBadge('Payment Settings'),
                      12.height,
                      const CommonText(
                        textAlign: TextAlign.start,
                        text:
                            "Give users the option to pay for classes at the time of booking or in-person. If an online payment processor has also been set up and in-person is enabled, then both payment options will be available to users booking classes.",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorGreyScalBlack60,
                        maxLines: 8,
                      ),
                      16.height,

                      // CURRENCY
                      const CommonText(
                        text: 'CURRENCY',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.colorPrimaryBlack,
                      ),
                      8.height,
                      _dropdownTile<String>(
                        hint: 'Select...',
                        value: c.selectedCurrency,
                        items: c.currencies,
                        onChanged: c.setCurrency,
                      ),
                      16.height,

                      // PAYMENT PROCESSORS
                      const CommonText(
                        text: 'PAYMENT PROCESSORS',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.colorPrimaryBlack,
                      ),
                      6.height,
                      const CommonText(
                        textAlign: TextAlign.start,
                        text:
                            "We currently only support Stripe as an integrated payment provider. We are looking to extend to other payment platforms in the future.",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorGreyScalBlack60,
                        maxLines: 5,
                      ),
                      10.height,
                      _stripeButton(connected: c.stripeConnected, onTap: c.connectStripe),
                      16.height,

                      // IN-PERSON PAYMENT
                      const CommonText(
                        text: 'IN-PERSON PAYMENT',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.colorPrimaryBlack,
                      ),
                      6.height,
                      _dropdownTile<String>(
                        hint: 'Select...',
                        value: c.selectedInPerson,
                        items: c.inPersonOptions,
                        onChanged: c.setInPerson,
                      ),
                      22.height,

                      // Save / Cancel
                      _primaryButton(
                        title: 'Save',
                        color: AppColors.colorPrimaryGreen,
                        border: AppColors.colorSecondaryGreen,
                        onTap: () async => c.save(),
                      ),
                      10.height,
                      Center(
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: const CommonText(
                            text: 'Cancel',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.colorNoticeError,
                            underline: true,
                          ),
                        ),
                      ),
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
          borderRadius: BorderRadius.only(topLeft: Radius.circular(28.r), topRight: Radius.circular(28.r)),
        ),
        child: const SafeArea(top: false, child: CommonBottomNavBar(currentIndex: 58)),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 14.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.colorPrimaryPink.withOpacity(0.6), width: 1.w)),
        color: AppColors.colourPrimaryPurple,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 2), blurRadius: 4)],
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: () => Get.back(), child: Icon(Icons.arrow_back, color: AppColors.white, size: 40.h)),
          const CommonImage(imageSrc: AppImages.logoWithBg, height: 40, width: 115, fill: BoxFit.contain),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.white, width: 2)),
            child: const ClipOval(child: CommonImage(imageSrc: AppImages.man, height: 48, width: 48, fill: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}

Widget _headerWithBadge(String title) {
  return Row(
    children: [
      CommonText(text: title, fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.colourPrimaryPurple),
      8.width,
      Expanded(child: Container(height: 1.5.h, color: AppColors.colourPrimaryPurple)),
      8.width,
      Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, border: Border.all(color: AppColors.colorGreyScalBlack60, width: 2)),
        child: const ClipOval(child: CommonImage(imageSrc: AppImages.clubLogo, fill: BoxFit.contain)),
      ),
    ],
  );
}

Widget _dropdownTile<T>({
  required String hint,
  required T? value,
  required List<T> items,
  required void Function(T?) onChanged,
}) {
  return Container(

    decoration: BoxDecoration(
      color: AppColors.colourGreyScaleGreyTint40,
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
    ),
    child: ExpansionTile(
   //   tilePadding: EdgeInsets.symmetric(horizontal: 12.w),
      iconColor: AppColors.colorPrimaryBlack,
      collapsedIconColor: AppColors.colorPrimaryBlack,
      title: CommonText(
        text: value == null ? hint : value.toString(),
        fontSize: 14,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w600,
        color: AppColors.colourGreyscaleBlackTint40,
      ),
      children: items
          .map((e) => InkWell(
                onTap: () => onChanged(e),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(border: Border(top: BorderSide(color: AppColors.colourGreyScaleGreyTint60))),
                  child: CommonText(
                    text: e.toString(),
                    fontSize: 14,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w600,
                    color: AppColors.colorPrimaryBlack,
                  ),
                ),
              ))
          .toList(),
    ),
  );
}

Widget _stripeButton({required bool connected, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 3.h),
      decoration: BoxDecoration(
        color: connected ? AppColors.colorPrimaryBlue.withOpacity(0.5) : AppColors.colorPrimaryBlue,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [

CommonText(
                text:"S",
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                right: 8,
              ),

              CommonText(
                text: connected ? 'Stripe Connected' : 'Connect to Stripe',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _primaryButton({
  required String title,
  required Color color,
  required Color border,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: border, width: 2),
      ),
      child: Center(
        child: CommonText(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.colorPrimaryBlack,
        ),
      ),
    ),
  );
}