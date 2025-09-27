import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/component/text_field/common_text_field.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import '../controller/checkout_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CheckoutController>()) {
      Get.put(CheckoutController());
    }

    return Scaffold(
      backgroundColor: AppColors.colourGreyScaleGreyTint60,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<CheckoutController>(builder: (c) {
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
                      _screenTitle('Checkout'),
                      14.height,
                      stepperSection(),
                      18.height,
                      _classSummary(c),
                      18.height,
                      _voucherInput(c),
                      14.height,
                      _feeNote(),
                      25.height,
                      _totalBar(c),
                      18.height,
                 

                 CommonButton(
                  buttonHeight: 52,
                  titleSize: 20,
                  onTap: () {
                    Get.toNamed(AppRoutes.confirmAndPay);
                    
                  },
                  
                  borderColor: AppColors.colorSecondaryGreen,
                  buttonColor: AppColors.colorPrimaryGreen,
                  titleColor: AppColors.black,
                  borderWidth: 2,
                  titleText: "Checkout",
                
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
          GestureDetector(onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white)),
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

   Widget stepperSection() {
    return // Progress indicator
    Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Container(
                height: 45.h,
                width: 45.w,
                padding: EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.colorPrimaryGreen, width: 4),
                ),
                child: CommonImage(
                  imageSrc: AppIcons.check,
                  height: 20.h,
                  width: 20.w,
                  fill: BoxFit.contain,
                ),
              ),
        
              Expanded(
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.colorPrimaryGreen,
                        AppColors.colorPrimaryOrange,
                      ],
                    ),
                  ),
                ),
              ),
        
              Container(
                height: 45.h,
                width: 45.w,
        
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.colorPrimaryOrange, width: 4),
                ),
                child: Center(
                  child: CommonText(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.colorPrimaryBlack,
                    text: "2",
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.colorPrimaryOrange,
                        AppColors.colourGreyscaleGrey,
                      ],
                    ),
                  ),
                ),
              ),
        
              Container(
                height: 45.h,
                width: 45.w,
        
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.colourGreyscaleGrey,
                    width: 4,
                  ),
                ),
                child: Center(
                  child: CommonText(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.colorPrimaryBlack,
                    text: "2",
                  ),
                ),
              ),
            ],
          ),
        ),

        5.height,
    
    
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: "Review Class",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.colorPrimaryGreen,
            ),
            CommonText(
              text: "Checkout",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.colorPrimaryOrange,
            ),
            CommonText(
              text: "Confirm & Pay",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.colorPrimaryBlack.withOpacity(0.6),
            ),
          ],
        ),
    
      ],
    );
  }




  Widget _classSummary(CheckoutController c) {
    return Container(
      decoration: BoxDecoration(color: AppColors.colorPrimaryPinkTint40, borderRadius: BorderRadius.circular(12.r)),
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
          
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
          
              15.height,
            CommonText(
              text: "Choreography", 
              fontSize: 18, 
              fontWeight: FontWeight.w600,
               color: AppColors.colorPrimaryBlack),
          
          
                    CommonText(
              text: "Friday, 14 February 2025", 
              fontSize: 16, 
              fontWeight: FontWeight.w600,
               color: AppColors.colorPrimaryBlack),
            6.height,
            CommonText(text: "7:00PM - 60mins", fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
            CommonText(text: c.time, fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorGreyScalBlack60),
          ]),
          CommonText(
            
            bottom: 15,
            text: '£${c.price.toStringAsFixed(2)}', fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.colorPrimaryBlack),
        ],
      ),
    );
  }

  Widget _voucherInput(CheckoutController c) {
    final controller = TextEditingController(text: c.voucher);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CommonText(text: 'DISCOUNT & VOUCHER CODE', fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.colorPrimaryBlack),
            CommonText(text: 'max. 10 characters', fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.colorGreyScalBlack60),
          ],
        ),
        8.height,


        CommonTextField(
          controller: controller,
          mexLength: 10,
          fillColor: AppColors.colourGreyScaleGreyTint60,
          borderRadius: 10.r,
          hintText: 'Enter discount or voucher code...',
          suffixIcon: const Icon(Icons.add),
         
          
       
          onChanged: (v) {},
        ),
     ],
    );
  }

  Widget _feeNote() {
    return const CommonText(
      text: 'Please note, an additional fee of £0.45 will be added to the online payment total to cover transaction charges.',
      fontSize: 12,
      maxLines: 5,
      textAlign: TextAlign.start,
      fontWeight: FontWeight.w400,
      color: AppColors.colorPrimaryBlack,
    );
  }

  Widget _totalBar(CheckoutController c) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(color: AppColors.colourGreyScaleGreyTint60, borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          const CommonText(text: 'Total', fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
          const Spacer(),
          Row(
            children: [
              CommonText(
                right: 10,
                text: '£${c.total.toStringAsFixed(2)}', fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.colorPrimaryBlack),
              CommonText(text: 'inc. Charges', fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.colorPrimaryBlack),
            ],
          ),
        ],
      ),
    );
  }

  Widget _primaryButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.colorPrimaryGreen,
          foregroundColor: AppColors.colorPrimaryBlack,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
        onPressed: () {},
        child: const CommonText(text: 'Checkout', fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.colorPrimaryBlack),
      ),
    );
  }
}
