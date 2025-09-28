import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_icons.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class BookedClassesScreen extends StatelessWidget {
  const BookedClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colourGreyScaleGreyTint60,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: Column(
        children: [
          _TopBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(28.h),
                margin: EdgeInsets.all(7.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _screenTitle('Booked Classes'),
                
                    22.height,

                    CommonButton(
                      buttonHeight: 52.h,
                      borderColor: AppColors.colorSecondaryGreen,
                      titleColor: AppColors.colorPrimaryBlack,
                      titleSize: 20,
                      onTap: () {
                        Get.toNamed(AppRoutes.availableClasses);
                      },
                      titleWeight: FontWeight.w600,
                      buttonColor: AppColors.colorPrimaryGreen,
                      titleText: "Book more classes"),
                
                
                   14.height,
                    _sectionHeader('Today'),
                    14.height,
                    _dayCard(
                      weekday: 'Friday',
                      month: 'February',
                      day: '14',
                      items: [
                        _ClassTileData(
                          'Choreography',
                          '7:00PM - 60mins',
                          0,
                         
                        )
                      ],
                    ),
                    16.height,
                    _sectionHeader('This Week'),
                    10.height,
                    _dayCard(
                      weekday: 'Saturday',
                      month: 'February',
                      day: '15',
                      items: const [
                      
                        _ClassTileData('Mixed Ability', '8:30PM • 60mins', 4),
                      ],
                    ),
                    12.height,
                    _dayCard(
                      weekday: 'Sunday',
                      month: 'February',
                      day: '15',
                      items: const [
                    
                        _ClassTileData(
                          'Sunday Service',
                          '1:15PM • 60mins',
                          8,
                          icon: AppIcons.remainingIcon,
                        ),
                        _ClassTileData('Mixed Ability', '8:05PM • 60mins', 6),
                     
                      ],
                    ),
                    16.height,
                    _sectionHeader('Next Week'),
                    10.height,
                    _dayCard(
                      weekday: 'Monday',
                      month: 'February',
                      day: '17',
                      items: const [
                        _ClassTileData('Mixed Ability', '7:00PM • 60mins', 12),
                      ],
                    ),
                    12.height,
                    _dayCard(
                      weekday: 'Tuesday',
                      month: 'February',
                      day: '18',
                      items: const [
                        _ClassTileData('Spinny Pole', '9:00PM - 120mins', 12),
                      ],
                    ),
                 
                  ],
                ),
              ),
            ),
          ),
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
        child: const SafeArea(
          top: false,
          child: CommonBottomNavBar(currentIndex: 58),
        ),
      ),
    );
  }

  Widget _screenTitle(String title) {
    return Row(
      children: [
        CommonText(
          text: title,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.colourPrimaryPurple,
        ),
        8.width,
        Expanded(
          child: Container(height: 1.5.h, color: AppColors.colourPrimaryPurple),
        ),
        8.width,
        Container(
          height: 48.r,
          width: 48.r,
          padding: EdgeInsets.all(6.r),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: AppColors.colourGreyScaleGreyTint60,
            ),
            shape: BoxShape.circle,
            color: AppColors.colorGreyScalBlack60,
          ),
          child: ClipOval(
            child: CommonImage(
              imageSrc: AppImages.clubLogo,
              fill: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: AppColors.colourPrimaryPurple, height: 1.h),
        ),
        10.width,
        CommonText(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.colourPrimaryPurple,
        ),
        10.width,
        Expanded(
          child: Divider(color: AppColors.colourPrimaryPurple, height: 1.h),
        ),
      ],
    );
  }

  Widget _dayCard({
    required String weekday,
    required String month,
    required String day,
    required List<_ClassTileData> items,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.colourPrimaryPurple,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: weekday,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  CommonText(
                    text: month,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ],
              ),
              8.width,
              CommonText(
                text: day,
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ],
          ),
          10.height,
          for (int i = 0; i < items.length; i++)
            _classTile(
              items[i],
              index: i,
              isFirst: i == 0,
              isLast: i == items.length - 1,
              dateLine: '$weekday, $day $month',
            ),
        ],
      ),
    );
  }

  Widget _classTile(
    _ClassTileData d, {
    required int index,
    bool isFirst = false,
    bool isLast = false,
    required String dateLine,
  }) {
    // Alternate background color per item (matches screenshot pattern)
    final Color rowBg = index.isEven
        ? AppColors.colorPrimaryPinkTint40
        : AppColors.blueLight; // soft bluish tint
    final BorderRadius radius = BorderRadius.only(
      topLeft: isFirst ? Radius.circular(10.r) : Radius.zero,
      topRight: isFirst ? Radius.circular(10.r) : Radius.zero,
      bottomLeft: isLast ? Radius.circular(10.r) : Radius.zero,
      bottomRight: isLast ? Radius.circular(10.r) : Radius.zero,
    );
    return InkWell(
      onTap: () => Get.toNamed(
        AppRoutes.bookedClassDetails,
        arguments: {
          'title': d.title,
          'dateLine': dateLine,
          'time': d.time,
          'spaces': d.spaces,
        },
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: rowBg,
          borderRadius: radius,
          border: isLast
              ? null
              : const Border(
                  bottom: BorderSide(
                    color: AppColors.colorGreyScalGrey, // subtle divider between stacked rows
                    width: 1,
                  ),
                ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.
            start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(child: Container()),


            
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonText(
                    text: d.title,
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.colorPrimaryBlack,
                  ),

                  3.height,

                  CommonText(
                    text: d.time,
                    fontSize: 20,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorGreyScalBlack60,
                  ),
                ],
              ),
                      Row(
             
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: rowBg, // subtle same-color chip behind label + pill
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child:d.icon != null?  Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: CommonImage(
                        
                                imageSrc: d.icon!,
                                height: 30.sp,
                                width: 30.sp,
                                fill: BoxFit.contain,
                              ),
                    ):    SizedBox(),
                 
                  ),
                ],
              ),
       

        

           ],
          ),
        ),
      ),
    );
  }
}

class _ClassTileData {
  final String title;
  final String time;
  final int spaces;
  final String? icon;
  const _ClassTileData(this.title, this.time, this.spaces, {this.icon});
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
