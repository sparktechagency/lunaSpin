import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';

class DoThisLaterPopup {
  static Future<void> show({required VoidCallback onYes}) async {
    Get.dialog(
      Center(
        child: Material(
          color: Colors.transparent,
          child: Container
          (
            width: 280.w,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonText(
                  text: 'Are you sure you want to skip?',
                  fontSize: 18,
                  maxLines: 2,
                  fontWeight: FontWeight.w600,
                  color: AppColors.colorPrimaryBlack,
                  bottom: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44.h,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF4ECDC4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          onPressed: () => Get.back(),
                          child: CommonText(
                            text: 'Cancel',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.colorPrimaryBlack,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: SizedBox(
                        height: 44.h,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.colourGreyScaleGreyTint40,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          onPressed: () {
                            Get.back();
                            onYes();
                          },
                          child: CommonText(
                            text: 'Yes',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.colorPrimaryBlack,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}