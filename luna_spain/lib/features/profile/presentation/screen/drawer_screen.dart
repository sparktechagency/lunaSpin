import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double panelWidth = MediaQuery.of(context).size.width * 0.78;

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size(0, 0),
      //   child: AppBar(
          
      //     backgroundColor:AppColors.colourPrimaryPurple,
      //     elevation: 0,
      //   ),
      // ),
      backgroundColor: AppColors.colourGreyscaleBlackTrans60,
      body: Stack(
        children: [
       
          Positioned(
            top: 75.h,
            left: 20.w,
            child:     GestureDetector(
                        onTap: Get.back,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 40.sp,
                        ),
                      ),),

          // Left panel
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: panelWidth,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.colourPrimaryPurple, // purple top
                    AppColors.colorPrimaryBlack, // indigo bottom
                  ],
                ),
            
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28.r),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      // Close button
                  
               

                      // User header
                      Row(
                        children: [
                          Container(
                            width: 48.w,
                            height: 48.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: ClipOval(
                              child: CommonImage(
                                imageSrc: AppImages.man,
                                height: 48.w,
                                width: 48.w,
                                fill: BoxFit.cover,
                              ),
                            ),
                          ),
                          14.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: 'Georgina Leon',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    CommonText(
                                      text: '621 Followers',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                    14.horizontalSpace,
                                    CommonText(
                                      text: '321 Following',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24.h),

                      // Menu items
                      _MenuItem(
                        label: 'Profile',
                        onTap: () {
                          Get.back();
                          Future.microtask(() => Get.toNamed(AppRoutes.userProfile));
                        },
                      ),
                      _MenuItem(
                        label: 'Likes',
                        onTap: () {
                          Get.back();
                          Future.microtask(() => Get.toNamed(AppRoutes.likes));
                        },
                      ),
                      _MenuItem(
                        label: 'Notifications',
                        onTap: () => Get.toNamed(AppRoutes.notifications),
                      ),


                      Row(
                    
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                       _SectionHeader(title: 'Club'),
                      _DividerLine(),

                      ],),

                    
                      _MenuItem(
                        label: 'Join Club',
                        onTap: () {},
                      ),
                      // Clubs section
               
                      8.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.searchClubProfile);
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25.r,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: CommonImage(
                                      imageSrc: AppImages.clubLogo,
                                      height: 45.r,
                                      width: 45.r,
                                      fill: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                14.horizontalSpace,
                                Expanded(
                                  child: CommonText(
                                    text: 'Pole Ninja',
                                    fontSize: 20,
                            
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      
                          10.verticalSpace,
                      
                          _MenuItem(
                            label: 'Manage Classes',
                            onTap: () {},
                          ),

                      
                      
                          _MenuItem(
                            label: 'Club Management',
                            onTap: () {
                              Get.toNamed(AppRoutes.clubManagement);
                              
                            },
                          ),



                          _MenuItem(
                            label: 'Booked Classes',
                            onTap: () {
                              Get.toNamed(AppRoutes.bookedClasses);
                            },
                          ),

                             _MenuItem(
                            label: 'Available Classes',
                            onTap: () {
                              Get.toNamed(AppRoutes.availableClasses);
                            },
                          ),
                        ],
                      ),
                      Row(
                    
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                       _SectionHeader(title: 'Account'),
                      _DividerLine(),

                      ],),


                    
                      _MenuItem(
                        label: 'Settings & Privacy',
                        onTap: () {
                          Get.back();
                          Future.microtask(() => Get.toNamed(AppRoutes.settingsPrivacy));
                        },
                      ),

                      14.verticalSpace,
                      CommonText(
                        text: 'Help Centre',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.colorPrimaryPink,
                      ),
                      14.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          Future.microtask(() => Get.toNamed(AppRoutes.createNewClub));
                        },
                        child: CommonText(
                          text: 'Create a Club',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.colorPrimaryPink,
                        ),
                      ),
14.verticalSpace,
                         GestureDetector(
                        onTap: () {
                          Get.back();
                          Future.microtask(() => Get.toNamed(AppRoutes.leaveClub, arguments: {'clubName': 'Club'}));
                        },
                        child: CommonText(
                          text: 'Leave a Club',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.colorPrimaryPink,
                        ),
                      ),
                      14.verticalSpace,
                      CommonText(
                        text: 'Logout',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.colorPrimaryPink,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _MenuItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(Icons.north_east, color: Colors.white, size: 25.sp),
            12.horizontalSpace,
            Expanded(
              child: CommonText(
                text: label,
                textAlign: TextAlign.start,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 6.h),
      child: CommonText(
        text: title,
        fontSize: 18,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w600,
        right: 10,
        color: AppColors.colourPrimaryVanilla,
      ),
    );
  }
}

class _DividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        
        height: 1,
        
        color: AppColors.colourPrimaryVanilla,
       margin: EdgeInsets.only(top: 10.h),
      ),
    );
  }
}
