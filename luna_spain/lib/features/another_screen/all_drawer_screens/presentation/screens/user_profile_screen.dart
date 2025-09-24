import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';
import 'package:luna_spain/features/another_screen/all_drawer_screens/presentation/controller/user_profile_controller.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<UserProfileController>()) {
      Get.put(UserProfileController());
    }
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: Stack(
        children: [
          // Full-screen background image
          Positioned.fill(
            child: CommonImage(
              imageSrc: AppImages.userProfileBg,
              fill: BoxFit.cover,
            ),
          ),
          // Foreground content
          GetBuilder<UserProfileController>(builder: (c) {
            return Column(
              children: [
             _topBar(context),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Header(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 14.h),
                          child: _PostsGrid(images: c.images),
                        )
                      ],
                    ),
                  ),
                ),

                100.height
              ],
            );
          }),
        ],
      ),
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

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(builder: (c) {
      return Container(
        color: Colors.transparent,
        child: Column(
          children: [

            150.height,
            // Space for top background area and center avatar
            SizedBox(
              height: 180.h,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2.sp),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(colors: [Colors.white, Colors.white70]),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 6, offset: const Offset(0, 2)),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 75.r,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: CommonImage(imageSrc: AppImages.man, height: 145.r, width: 145.r, fill: BoxFit.cover),
                        ),
                      ),
                    ),
                    // Small circular badge on top-right
                    Positioned(
                      right: 18.w,
                      top: -6.h,
                      child: Container(
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 4, offset: const Offset(0, 2)),
                          ],
                        ),
                        child: ClipOval(
                          child: CommonImage(
                            imageSrc: AppImages.logoWithBg,
                            height: 40.w,
                            width: 40.w,
                            fill: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.height,

            // Action row (share + follow)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: AppColors.colorNotice,
                   shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.share, color: AppColors.white),
                ),
                12.width,
                GestureDetector(
                  onTap: c.toggleFollow,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: c.isFollowing ? Colors.white : AppColors.colorPrimaryGreen,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6, offset: const Offset(0, 2)),
                      ],
                      border:  Border.all(color: AppColors.colorSecondaryGreen, width: 2) ,
                    ),
                    child: CommonText(
                      text: c.isFollowing ? 'Following' : 'Follow',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.colorPrimaryBlack,
                    ),
                  ),
                ),
              ],
            ),
            14.height,

            // Stats
            CommonText(
              text: '${c.followers} Followers  ${c.following} Following',
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.colorPrimaryPink,
            ),
            6.height,
            CommonText(
              text: c.name,
              fontSize: 36,
              fontWeight: FontWeight.w600,
                     color: AppColors.white,
            ),
            10.height,

            // Chips
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              alignment: WrapAlignment.center,
              children: [
                _Chip(text: c.location),
                _Chip(text: c.experience),
                _Chip(text: c.level),
              ],
            ),
            16.height,
          ],
        ),
      );
    });
  }
}

class _PostsGrid extends StatelessWidget {
  final List<String> images;
  const _PostsGrid({required this.images});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 0.9,
      ),
      itemCount: images.isEmpty ? 0 : images.length * 2,
      itemBuilder: (context, index) {
        final row = index ~/ 2; 
        final isLeft = index % 2 == 0;
        final isTextPost = (row % 2 == 0 && !isLeft) || (row % 2 == 1 && isLeft);

        if (isTextPost) {
          return _PostCard();
        } else {
          final img = images[index % images.length];
          return _ImageTile(img: img);
        }
      },
    );
  }
}

class _ImageTile extends StatelessWidget {
  final String img;
   _ImageTile({required this.img});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(7.r), child: CommonImage(imageSrc: img, fill: BoxFit.cover));
  }
}

class _PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2)),
        ],
        border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          CommonText(
            text: 'Lorem ipsum dolor sit amet, consecte tur adipiscing elit.',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
            color: AppColors.colourPrimaryPurple,
            maxLines: 3,
          ),
          SizedBox(
            height: 7,
          ),

            CommonText(
            text: 'Hardcore workout...',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            bottom: 5,
            color: AppColors.colorPrimaryBlack.withOpacity(0.8),
          ),
          CommonText(
            text: 'confidance-booster: for',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.colorPrimaryBlack.withOpacity(0.2),
          ),
          SizedBox(
            height: 15,
          ),
          CommonText(
            text: '4m read • 3d ago',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.colorPrimaryBlack,
          ),
        ],
      ),
    );
  }
}


class _Chip extends StatelessWidget {
  final String text;
  const _Chip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.colorGreyScalBlack60,
        borderRadius: BorderRadius.circular(20.r),
       
      ),
      child: CommonText(
        text: text,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}

  Widget _topBar(context) {
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

         GestureDetector(
  onTap: () => Get.toNamed(AppRoutes.drawer),
  child: CommonImage(
    imageSrc: AppIcons.drawer,
    height: 40.h,
    width: 40.w,
    fill: BoxFit.contain,
  ),
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
