import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class SocialButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String iconSrc;
  final String label;
  final VoidCallback onTap;
  final Color borderColor;
  final double borderWidth;

  SocialButton({
    required this.bgColor,
    required this.textColor,
    required this.iconSrc,
    required this.label,
    required this.onTap,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(bgColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(color: borderColor, width: borderWidth.w),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonImage(imageSrc: iconSrc, height: 40.h, width: 40.h),
            10.width,
            CommonText(
              text: label,
              fontSize: 16,
              color: textColor,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}