import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/features/another_screen/all_drawer_screens/presentation/controller/likes_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Register controller once
    if (!Get.isRegistered<LikesController>()) {
      Get.put(LikesController());
    }
    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<LikesController>(builder: (controller) {
        return Column(
          children: [
            _TopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 14.h),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: AppString.likes,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colourPrimaryPurple,
                        bottom: 13.h,
                      ).center,

                      _Section(title: AppString.today),
                      13.height,
                      _LikesGrid(items: controller.todayImages),

                      16.height,
                      _Section(title: AppString.yesterday),
                      8.height,
                      _LikesGrid(items: controller.yesterdayImages),

                      16.height,
                      _Section(title: AppString.twoDaysAgo),
                      8.height,
                      _LikesGrid(items: controller.twoDaysAgoImages),
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

class _Section extends StatelessWidget {
  final String title;
  const _Section({required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(right: 12.w),
            color: AppColors.colourPrimaryPurple,
          ),
        ),
        CommonText(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.colourPrimaryPurple,
        ),
        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(left: 12.w),
            color: AppColors.colourPrimaryPurple,
          ),
        ),
      ],
    );
  }
}

class _LikesGrid extends StatelessWidget {
  final List<String> items;
  const _LikesGrid({required this.items});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 7.h,
        crossAxisSpacing: 7.w,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.colourGreyScaleGreyTint40,
            borderRadius: BorderRadius.circular(7.r),
            border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
          ),
          clipBehavior: Clip.antiAlias,
          child: CommonImage(
            imageSrc: items[index],
            fill: BoxFit.cover,
          ),
        );
      },
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
