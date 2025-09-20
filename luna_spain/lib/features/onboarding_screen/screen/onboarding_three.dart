import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/features/onboarding_screen/widgets/indicatior.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';


class OnboardingThree extends StatelessWidget {
  const OnboardingThree({
    super.key,
    required this.currentIndex,
    required this.controller,
  });

  final int currentIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          120.height,
          CommonImage(
            imageSrc: AppImages.onboarding_3,
            height: 286,
            width: 200,
          ),
          CommonText(
            text: AppString.onboarding4,
            color: AppColors.black_300,
            fontWeight: FontWeight.w400,
            top: 18,
            maxLines: 4,
          ),

          87.height,
          indicator(currentIndex),

          69.height,
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  titleText: AppString.back,
                  titleColor: AppColors.black_400,
                  borderColor: AppColors.black,
                  buttonColor: AppColors.white,
                  onTap:
                      () => controller.previousPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      ),
                ),
              ),
              15.width,
              Expanded(
                child: CommonButton(
                  titleText: AppString.next,
                  onTap: () => Get.toNamed(AppRoutes.signInSignUp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
