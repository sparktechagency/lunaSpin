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
import '../controller/search_club_profile_controller.dart';

class SearchClubProfileScreen extends StatelessWidget {
  const SearchClubProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<SearchClubProfileController>()) {
      Get.put(SearchClubProfileController());
    }

    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size(0, 0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            top: 50.h,
            child: Image.asset(AppImages.searchClubBg, fit: BoxFit.cover),
          ),
         
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.05),
                  Colors.black.withOpacity(0.40),
                ],
              ),
            ),
          ),
         
         
          SafeArea(
            child: GetBuilder<SearchClubProfileController>(builder: (c) {
              return Column(
                children: [
                  _topBar(context),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          180.height,
                          _avatarSection(c.avatar, c),
                          14.height,
                          CommonText(
                            text: '${c.members.toString()} Members',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.colorPrimaryPink,
                          ),
                          14.height,
                          CommonText(
                            text: c.name,
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                          10.height,


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle, 
                                color: AppColors.colorPrimaryGreen
                              ),
                            ),
                            CommonText(
                              text: 'Last active 3h ago',
                              fontSize: 16,
                              left: 5,
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorPrimaryGreen,
                            ),



                          ],),

                          14.height,
                          Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            alignment: WrapAlignment.center,
                            children: [
                              _chip('London, UK', AppColors.colorPrimaryPurpleTint80),
                              _chip('All Levels', AppColors.colorPrimaryPurpleTint80),
                            ],
                          ),
                          14.height,
                          const CommonText(
                            text:
                                "We're a small pole family who share a passion for pole and movement. We run classes for complete beginners to advanced polers and everyone is welcome here.",
                            fontSize: 16,
                            left: 10,
                            right: 10,
                            maxLines: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                            textAlign: TextAlign.center,
                          ),
                          28.height,
                          _sectionTitle('Upcoming classes'),
                          10.height,
                          _UpcomingClasses(days: c.upcoming),
                          28.height,
                          _sectionTitle('Latest activity'),
                          10.height,
                          _LatestActivityGrid(images: c.activityImages),
                          20.height,
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.colourPrimaryPurple,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(28.r), topRight: Radius.circular(28.r)),
        ),
        child: const SafeArea(top: false, child: CommonBottomNavBar(currentIndex: 8)),
      ),
    );
  }

  Widget _topBar(context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h, bottom: 14.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.colorPrimaryPink.withOpacity(0.6), width: 1.w),
        ),
        color: AppColors.colourPrimaryPurple,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 2), blurRadius: 4),
        ],
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.drawer),
            child: CommonImage(imageSrc: AppIcons.drawer, height: 40.h, width: 40.w, fill: BoxFit.contain),
          ),
          CommonImage(imageSrc: AppImages.logoWithBg, height: 40.h, width: 115.w, fill: BoxFit.contain),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.white, width: 2)),
            child: ClipOval(
              child: CommonImage(imageSrc: AppImages.man, height: 48.h, width: 48.w, fill: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }

  Widget _avatarSection(String avatar, SearchClubProfileController c) {
    final hasAvatar = avatar.isNotEmpty;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4.r),
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Container(
            padding: EdgeInsets.all(2.r),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: CircleAvatar(
              radius: 64.r,
              backgroundColor: AppColors.colourGreyScaleGreyTint40,
              child: ClipOval(
                child: hasAvatar
                    ? CommonImage(imageSrc: avatar, height: 128.r, width: 128.r, fill: BoxFit.cover)
                    : CommonImage(imageSrc: AppImages.clubLogo, height: 128.r, width: 128.r, fill: BoxFit.fill),
              ),
            ),
          ),
        ),
        14.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _circleIconButton(AppIcons.share, onTap: () {}),

               12.width,
      GestureDetector(
        onTap: c.onJoinPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.colorPrimaryGreen, // green fill like screenshot
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.colorSecondaryGreen, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: CommonText(
            text: c.joined ? 'Available Classes' : 'Join club',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.colorPrimaryBlack,
          ),
        ),
      ),

          ],
        ),
      ],
    );
  }

  Widget _circleIconButton(String asset, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.h,
        width: 48.w,
        padding: EdgeInsets.all(10.r),
        decoration: const BoxDecoration(color: AppColors.colorNotice, shape: BoxShape.circle),
        child: Icon(Icons.share, color: AppColors.white, size: 30.sp),
      ),
    );
  }

  Widget _chip(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(color: color.withOpacity(0.9), borderRadius: BorderRadius.circular(14.r)),
      child: CommonText(text: label, fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.white),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonText(text: title, fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.white),
      ],
    );
  }
}

  class _UpcomingClasses extends StatelessWidget {
    final List<UpcomingDay> days;
    const _UpcomingClasses({required this.days});

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: 182.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: days.length,
          separatorBuilder: (_, __) => 12.width,
          itemBuilder: (context, index) {
            final d = days[index];
     

            return Container(
              width: 185.w,
                 padding: EdgeInsets.all(12.w),
                 decoration: BoxDecoration(
                   color: AppColors.colourPrimaryPurple,
                   borderRadius: BorderRadius.circular(16.r),
                   boxShadow: [
                     BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 10, offset: const Offset(0, 6)),
                   ],
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CommonText(
                              textAlign: TextAlign.start,
                              
                              text: d.weekday, fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.white),
                            CommonText(
                               textAlign: TextAlign.start,
                              text: d.month, fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.white),
                          ],
                        ),
                        
                        CommonText(text: d.day, fontSize: 36, fontWeight: FontWeight.w600, color: AppColors.white),
                      ],
                    ),

                    11.height,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(7.r),
                      decoration: BoxDecoration(
                        color: AppColors.colorPrimaryPinkTint40,
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                text: "Beginners Pole", 
                                fontSize: 14, 
                                fontWeight: FontWeight.w600, 
                                color: AppColors.colorPrimaryBlack),

                                5.width,
                              Container(
                                padding: EdgeInsets.all(5.r),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: CommonText(
                                  text: "4", fontSize: 12, 
                            
                                  fontWeight: FontWeight.w500, 
                                  color: AppColors.colorPrimaryBlack)),
                            ],
                          ),
                      
                      
                                Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                text: "Mixed ability", 
                                fontSize: 14, 
                                fontWeight: FontWeight.w600, 
                                color: AppColors.colorPrimaryBlack),

                                5.width,
                              Container(
                                padding: EdgeInsets.all(5.r),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: CommonText(
                                  text: "1", fontSize: 12, 
                            
                                  fontWeight: FontWeight.w500, 
                                  color: AppColors.colorPrimaryBlack)),
                            ],
                          ),
                    

                                     Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                text: "Spinny Pole", 
                                fontSize: 14, 
                                fontWeight: FontWeight.w600, 
                                color: AppColors.colorPrimaryBlack),

                                5.width,
                              Container(
                                padding: EdgeInsets.all(5.r),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: CommonText(
                                  text: "0", fontSize: 12, 
                            
                                  fontWeight: FontWeight.w500, 
                                  color: AppColors.colorPrimaryBlack)),
                            ],
                          ),
                    
                        
                        ],
                      ),

                    )

           ],
                 ),
              );
           },
         ),
       );
     }
   }


  class _LatestActivityGrid extends StatelessWidget {
    final List<String> images;
    const _LatestActivityGrid({required this.images});

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
            return _ActivityPostCard();
          } else {
            final img = images[index % images.length];
            return ClipRRect(
              borderRadius: BorderRadius.circular(7.r),
              child: CommonImage(imageSrc: img, fill: BoxFit.cover),
            );
          }
        },
      );
    }
  }

  class _ActivityPostCard extends StatelessWidget {
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
