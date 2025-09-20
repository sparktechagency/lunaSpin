import 'package:flutter/material.dart';
import 'package:luna_spain/features/onboarding_screen/widgets/indicatior.dart';
import '../../../../component/button/common_button.dart';
import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../../utils/constants/app_string.dart';
import '../../../../utils/extensions/extension.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({
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
          CommonImage(imageSrc: AppImages.onboarding),
          CommonText(
            text: AppString.onboarding2,
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
                  onTap:
                      () => controller.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
