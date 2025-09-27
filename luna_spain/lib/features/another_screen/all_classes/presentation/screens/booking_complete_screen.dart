import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import '../controller/booking_complete_controller.dart';

class BookingCompleteScreen extends StatelessWidget {
  const BookingCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<BookingCompleteController>()) {
      Get.put(BookingCompleteController());
    }

    return Scaffold(
      backgroundColor: AppColors.colourGreyScaleGreyTint60,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<BookingCompleteController>(builder: (c) {
        return Column(
          children: [
            _topBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(7.h),
                  padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(14.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _screenTitle('Booking Complete'),
                      14.height,
                      _stepper(),
                      18.height,
                      Center(
                        child: CommonImage(
                          imageSrc: AppIcons.goodToSee,
                          height: 120.h,
                          width: 120.w,
                          fill: BoxFit.contain,
                        ),
                      ),
                      12.height,
                      Center(
                        child: CommonText(
                          text: 'Start warming up!',
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colourPrimaryPurple,
                        ),
                      ),
                      10.height,
                      _successText(c),
                      16.height,
                      _bookingDetails(c),
                      20.height,
                      CommonButton(
                        buttonHeight: 52.h,
                        borderWidth: 2,
                        titleColor: AppColors.colorPrimaryBlack,
                        buttonColor: AppColors.colorPrimaryGreen,
                        borderColor: AppColors.colorSecondaryGreen,
                        titleText: 'Add to my calendar',
                        titleSize: 18,
                      ),
                      12.height,
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        decoration: BoxDecoration(
                          color: AppColors.colourGreyScaleGreyTint60,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            
                            width: 2,
                            color: AppColors.colourGreyscaleGrey),
                        ),
                        child: const Center(
                          child: CommonText(
                            text: 'View my upcoming classes',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.colorPrimaryBlack,
                          ),
                        ),
                      ),
                      14.height,

                      Container(
                        height: 1,
                        color: AppColors.colourGreyScaleGreyTint40,
                      ),
                      14.height,
                      Center(
                        child: CommonText(
                          text: 'Back to class listing',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorPrimaryBlue,
                          underline: true,
                        ),
                      )
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

  Widget _topBar() {
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
          GestureDetector(onTap: () => Get.back(), child: const Icon(Icons.menu, color: Colors.white)),
          CommonImage(imageSrc: AppImages.logoWithBg, height: 40.h, width: 115.w, fill: BoxFit.contain),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.white, width: 2)),
            child: ClipOval(child: CommonImage(imageSrc: AppImages.man, height: 48.h, width: 48.w, fill: BoxFit.cover)),
          ),
        ],
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
          _circleCheck(),
          Expanded(child: _line()),
          _circleCheck(),
          Expanded(child: _line()),
          _circleCheck(),
          10.width,
        ]),
        6.height,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
          CommonText(text: 'Review Class', fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryGreen),
          CommonText(text: 'Checkout', fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryGreen),
          CommonText(text: 'Confirm & Pay', fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryGreen),
        ])
      ]),
    );
  }

  Widget _circleCheck() => Container(
        height: 45.h,
        width: 45.w,
        padding: EdgeInsets.all(7.r),
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.colorPrimaryGreen, width: 4)),
        child: CommonImage(imageSrc: AppIcons.check, height: 20.h, width: 20.w, fill: BoxFit.contain),
      );
  Widget _line() => Container(
        height: 5.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.colorPrimaryGreen, AppColors.colorPrimaryGreen]),
        ),
      );

  Widget _successText(BookingCompleteController c) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.colorPrimaryBlack),
          children: [
            const TextSpan(text: 'Your '),
            TextSpan(text: c.title, style: const TextStyle(fontWeight: FontWeight.w700)),
            const TextSpan(text: ' class has been successfully confirmed and booked.'),
          ],
        ),
      ).center,
    );
  }

  Widget _bookingDetails(BookingCompleteController c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(text: 'Booking ID:  ', fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.colorPrimaryBlack),
             CommonText(text: '${c.bookingId}', fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
          ],
        ),
        Row(
             mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(text: 'Payment Amount: ', fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.colorPrimaryBlack),
             CommonText(text: '${c.amount.toStringAsFixed(2)}', fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
          ],
        ),
        
        
         Row(
             mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(text: 'Payment Status:  ', fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.colorPrimaryBlack),
             CommonText(text: 'Paid', fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
          ],
        ),
        
        ],
    ).center;
  }
}
