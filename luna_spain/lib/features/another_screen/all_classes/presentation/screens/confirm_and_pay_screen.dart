import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import '../controller/confirm_and_pay_controller.dart';

class ConfirmAndPayScreen extends StatelessWidget {
  const ConfirmAndPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ConfirmAndPayController>()) {
      Get.put(ConfirmAndPayController());
    }

    return Scaffold(
      backgroundColor: AppColors.colourGreyScaleGreyTint60,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<ConfirmAndPayController>(builder: (c) {
        return Column(
          children: [
            _TopBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(7.h),
                  padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(14.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _screenTitle('Confirm & Pay'),
                      14.height,
                      _stepper(),
                      18.height,
                      _introText(c),
                      14.height,
                      _totalDue(c),
                      18.height,
                      _paymentOptions(c),
                      14.height,
                      _inPersonLink(c),
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



  Widget _screenTitle(String title) {
    return Row(
      children: [
        CommonText(text: title, fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.colourPrimaryPurple),
        8.width,
        Expanded(child: Container(height: 1.5.h, color: AppColors.colourPrimaryPurple)),
        8.width,
        Container(
          height: 48.r,
          width: 48.r,
          decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white, border: Border.all(color: AppColors.colorGreyScalBlack60, width: 2)),
          child: ClipOval(child: CommonImage(imageSrc: AppImages.clubLogo, fill: BoxFit.contain)),
        )
      ],
    );
  }

  Widget _stepper() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16.r)),
      child: Column(children: [
        Row(children: [
          10.width,
          _circleCheck(color: AppColors.colorPrimaryGreen),
          Expanded(child: _line(gradientColors: [AppColors.colorPrimaryGreen, AppColors.colorPrimaryGreen])),
          _circleCheck(color: AppColors.colorPrimaryGreen),
          Expanded(child: _line(gradientColors: [AppColors.colorPrimaryGreen, AppColors.colorPrimaryOrange])),
          _circleNumber('3', active: true),
          10.width,
        ]),
        6.height,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
          CommonText(text: 'Review Class', fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryGreen),
          CommonText(text: 'Checkout', fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryGreen),
          CommonText(text: 'Confirm & Pay', fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryOrange),
        ])
      ]),
    );
  }

  Widget _circleCheck({required Color color}) => Container(
        height: 45.h,
        width: 45.w,
        padding: EdgeInsets.all(7.r),
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: color, width: 4)),
        child: CommonImage(imageSrc: AppIcons.check, height: 20.h, width: 20.w, fill: BoxFit.contain),
      );
  Widget _circleNumber(String n, {bool active = false}) => Container(
        height: 45.h,
        width: 45.w,
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.colorPrimaryOrange, width: 4)),
        child: Center(
          child: CommonText(text: n, fontSize: 22, fontWeight: FontWeight.w500, color: AppColors.colorPrimaryBlack),
        ),
      );
  Widget _line({required List<Color> gradientColors}) => Container(
        height: 5.h,
        decoration: BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
      );

  Widget _introText(ConfirmAndPayController c) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.colorPrimaryBlack),
        children: [
          const TextSpan(text: 'Confirm your '),
          TextSpan(text: "Choreography", style: const TextStyle(
            
            fontSize: 18,
            fontWeight: FontWeight.w600)),
          TextSpan(text: c.title, style: const TextStyle(fontWeight: FontWeight.w700)),
          const TextSpan(text: ' booking, for '),
          TextSpan(text: "Friday 14th February", style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600)),
          TextSpan(text: c.dateLine, style: const TextStyle(fontWeight: FontWeight.w700)),
          const TextSpan(text: ', by making a payment using one of the below options.'),
        ],
      ),
    );
  }

  Widget _totalDue(ConfirmAndPayController c) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(color: AppColors.colourGreyScaleGreyTint60, borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          const CommonText(text: 'Total Due', fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.colorPrimaryBlack),
          const Spacer(),
          Row(
            children: [
              CommonText(text: '£${c.total.toStringAsFixed(2)}  ', fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.colorPrimaryBlack),
              CommonText(text: 'inc. charges', fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.colorPrimaryBlack),
            ],
          ),
        ],
      ),
    );
  }

  Widget _paymentOptions(ConfirmAndPayController c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [
            Expanded(child: Container(
              height: 1,
              color: AppColors.colourPrimaryPurple,
            )),
CommonText(
  
    left: 14,
    right: 14,
  text: 'Payment options', fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.colourPrimaryPurple),

              Expanded(child: Container(
              height: 1,
              color: AppColors.colourPrimaryPurple,
            )),
          ],
        ),
  
        14.height,
        _optionButton(
          'G Pay',
          bg: AppColors.colourGreyScaleGreyTint40,
          borderCLr: AppColors.colourGreyScaleGreyTint60,
          fg: AppColors.colorPrimaryBlack,
          icon: AppIcons.googleAuth,
          onTap: () => Get.toNamed(
            AppRoutes.bookingComplete,
            arguments: {
              'title': c.title,
              'bookingId': 'BK${DateTime.now().millisecondsSinceEpoch % 1000000}',
              'amount': c.total,
              'status': 'Paid',
            },
          ),
        ),
        10.height,
        _optionButton(
          'Pay',
          bg: AppColors.colorPrimaryBlack,
          borderCLr: AppColors.colorPrimaryBlack,
          fg: AppColors.white,
          icon: AppIcons.appleAuth,
          onTap: () => Get.toNamed(
            AppRoutes.bookingComplete,
            arguments: {
              'title': c.title,
              'bookingId': 'BK${DateTime.now().millisecondsSinceEpoch % 1000000}',
              'amount': c.total,
              'status': 'Paid',
            },
          ),
        ),
        10.height,
        _optionButton(
          'Pay',
          bg: AppColors.colorYoullowBg,
          borderCLr: AppColors.colorYoullowbr,
          fg: AppColors.colorPrimaryBlack,
          icon: AppImages.paypal,
          onTap: () => Get.toNamed(
            AppRoutes.bookingComplete,
            arguments: {
              'title': c.title,
              'bookingId': 'BK${DateTime.now().millisecondsSinceEpoch % 1000000}',
              'amount': c.total,
              'status': 'Paid',
            },
          ),
        ),
        10.height,
      ],
    );
  }

  Widget _optionButton(String label, {required Color bg, required Color borderCLr, required Color fg, required String icon, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: borderCLr),
          color: bg, borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonImage(imageSrc: icon, height: 40.sp, width: 40.sp, fill: BoxFit.contain),
            8.width,
            CommonText(text: label, fontSize: 16, fontWeight: FontWeight.w700, color: fg),
          ],
        ),
      ),
    );
  }

  Widget _inPersonLink(ConfirmAndPayController c) {
    return Center(
      child: CommonText(
        text: 'Pay £${c.total.toStringAsFixed(2)} in-person',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.colorPrimaryBlue,
        underline: true,
      ),
    );
  }
}


class _TopBar extends StatelessWidget {
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
          InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back, color: AppColors.white, size: 40.h),
          ),
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
