import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/features/another_screen/manage_class/presentation/controller/create_new_class_overview_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class CreateNewClassOverviewScreen extends StatelessWidget {
  const CreateNewClassOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CreateNewClassOverviewController>()) {
      Get.put(CreateNewClassOverviewController());
    }
    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<CreateNewClassOverviewController>(builder: (c) {
        return Column(
          children: [
            const _TopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _headerWithBadge('Class Overview'),
                          12.height,

                          // Chips row: Attending, Waits, Tickets
                          Row(
                            children: [
                              _chip('${c.attendees} Attends', Color(0xffA8D5BA)),
                              8.width,
                              _chip('${c.waitlist} Waits', Color(0xffF3DFA2)),
                              8.width,
                              _chip('${c.tickets} Tickets', Color(0xffF9CABD)),
                            ],
                          ),
                          10.height,

                          // Attendee Details quick link
                          _navRow(title: 'Attendee Details', onTap: () {
                            // TODO: navigate to attendee details if exists
                          }),

                          // Edit Class quick link
                          _navRow(title: 'Edit Class', onTap: () {
                            // TODO: navigate to edit class if exists
                          }),
                          6.height,

                          // Class Status dropdown-like section
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.colourGreyScaleGreyTint40,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                            ),
                            child: ExpansionTile(
                              tilePadding: EdgeInsets.symmetric(horizontal: 12.w),
                              iconColor: AppColors.colorPrimaryBlack,
                              collapsedIconColor: AppColors.colorPrimaryBlack,
                              title: const CommonText(
                                text: 'CLASS STATUS',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.colorPrimaryBlack,
                              ),
                              children: [
                                Column(
                                  children: [
                                    _radioRow(
                                      title: 'Available',
                                      selected: c.classStatus == 'Available',
                                      onTap: () => c.setStatus('Available'),
                                    ),
                                    _radioRow(
                                      title: 'Closed',
                                      selected: c.classStatus == 'Closed',
                                      onTap: () => c.setStatus('Closed'),
                                    ),
                                    8.height,
                                  ],
                                ),
                              ],
                            ),
                          ),

                          14.height,

                          // Details card (80% similar to Confirm screen)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.w,
                            vertical: 14.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            color: AppColors.colourPrimaryPurple,
                          ),
                          child: Column(
                            children: [
                              CommonText(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                                text: "Choreography",
                              ).center,

                              14.height,
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.colorPrimaryPinkTint40,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    topRight: Radius.circular(10.r),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14.w,
                                  vertical: 14.h,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonText(
                                            text: "Friday, 14 February",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.colorPrimaryBlack,
                                          ),
                                          2.height,
                                          CommonText(
                                            text: "7:00PM - 60mins",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                AppColors.colorGreyScalBlack60,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CommonText(
                                          text: 'Spaces\nremaining',
                                          fontSize: 12,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w400,
                                          right: 5,
                                          color: AppColors.colorGreyScalBlack60,
                                          textAlign: TextAlign.end,
                                        ),
                                        6.height,
                                        //_pill(c.spaces.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              //===========profile info
                              Container(
                                padding: EdgeInsets.all(14.r),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColors.colorGreyScalGrey,
                                      width: 1.w,
                                    ),
                                  ),
                                  color: AppColors.colourGreyScaleGreyTint20,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: CommonImage(
                                          imageSrc: AppImages.man,
                                          height: 40.h,
                                          width: 40.w,
                                          fill: BoxFit.contain,
                                        ),
                                      ),
                                    ),

                                    7.width,

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: "Class with",
                                          fontSize: 16,
                                          textAlign: TextAlign.start,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.colourPrimaryPurple,
                                        ),

                                        CommonText(
                                          text: "@georginaleon",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.colorPrimaryBlue,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 28.w,
                                  vertical: 14.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14.r), bottomRight: Radius.circular(14.r))
                                ),

                                child: Column(
                                  children: [
                                    CommonText(
                                      textAlign: TextAlign.start,
                                      maxLines: 30,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.colourPrimaryPurple,
                                      text: """
Choreography class focusing on movement around the pole, exploring our sensual side! You should have some experience of using heels to attend this class. The following is a good foundation:""",
                                    ),
                                    CommonText(
                                      top: 10,
                                      left: 10,

                                      textAlign: TextAlign.start,
                                      maxLines: 30,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.colourPrimaryPurple,
                                      text: """
.Confident pirouettes, diamond turns, pathways to and from the floor in heels.
.Understanding of using the toe box of the platform.
.Comfortable with different grips in heels i.e. forearm, split, true.
""",
                                    ),

                                    CommonText(
                                      textAlign: TextAlign.start,
                                      maxLines: 30,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.colourPrimaryPurple,
                                      text: """
Please bring knee pads with you. Heels not compulsory but highly encouraged.""",
                                    ),

                                    20.height,

                                    Row(
                                      children: [
                                        CommonText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          right: 7,
                                          color: AppColors.colourPrimaryPurple,
                                          text: "Level:",
                                        ),

                                        CommonText(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.colourPrimaryPurple,
                                          text: "Intermediate",
                                        ),
                                      ],
                                    ),
                                    12.height,
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Instructions: ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  AppColors.colourPrimaryPurple,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "Bring your dry hands, water, a towel and shorts. Please remember we operate a 24 hour cancellation policy and any bookings cancelled in 24 hours from the class starting are non-refundable.",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  AppColors.colourPrimaryPurple,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    CommonImage(
                                      imageSrc: AppImages.map,
                                      height: 240.h,
                                      width: double.infinity,
                                      fill: BoxFit.contain,
                                    ),

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          fontSize: 16,
                                          right: 30,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.colourPrimaryPurple,
                                          text: "Address:",
                                        ),

                                        CommonText(
                                          maxLines: 3,
                                          textAlign: TextAlign.start,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.colorPrimaryBlack,
                                          text: """Fresh Gym
Govett Avenue
Shepperton
TW178AB""",
                                        ),
                                      ],
                                    ),
                             
                             
                             
                             28.height,
                                       Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          fontSize: 16,
                                          right: 30,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.colourPrimaryPurple,
                                          text: "Directions:",
                                        ),

                                        Expanded(
                                          child: CommonText(
                                            maxLines: 3,
                                            textAlign: TextAlign.start,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.colorPrimaryBlack,
                                                                              
                                                                              
                                            text: "We are located upstairs just past reception on the right.",
                                          ),
                                        ),
                                      ],
                                    ),
                            
                             
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
  ],
                      ),
                    ),
                  ],
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
}

class _TopBar extends StatelessWidget {
  const _TopBar();
  @override
  Widget build(BuildContext context) {
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
          InkWell(onTap: () => Get.back(), child: Icon(Icons.arrow_back, color: AppColors.white, size: 40.h)),
          const CommonImage(imageSrc: AppImages.logoWithBg, height: 40, width: 115, fill: BoxFit.contain),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.white, width: 2)),
            child: const ClipOval(child: CommonImage(imageSrc: AppImages.man, height: 48, width: 48, fill: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}

Widget _headerWithBadge(String title) {
  return Row(
    children: [
      CommonText(text: title, fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.colourPrimaryPurple),
      8.width,
      Expanded(child: Container(height: 1.5.h, color: AppColors.colourPrimaryPurple)),
      8.width,
      Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, border: Border.all(color: AppColors.colorGreyScalBlack60, width: 2)),
        child: const ClipOval(child: CommonImage(imageSrc: AppImages.clubLogo, fill: BoxFit.contain)),
      ),
    ],
  );
}

Widget _chip(String text, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20.r),
      border: Border.all(color: AppColors.colourGreyScaleGreyTint40),
    ),
    child: CommonText(text: text, fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.colourPrimaryPurple),
  );
}

Widget _navRow({required String title, required VoidCallback onTap}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4.w),
          decoration: BoxDecoration(
            color: AppColors.colourGreyScaleGreyTint40,

            borderRadius: BorderRadius.circular(7.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            children: [

              14.width,
              Expanded(child: CommonText(
                
                textAlign: TextAlign.start,
                text: title, fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack)),
              const Icon(Icons.arrow_forward, size: 25, color: AppColors.colorPrimaryBlack),

              12.width
            ],
          ),
        ),
      ),
     // Container(height: 1, color: AppColors.colourGreyScaleGreyTint60),
    ],
  );
}

Widget _radioRow({required String title, required bool selected, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        children: [
          Container(
            width: 18.w,
            height: 18.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.colourGreyscaleGrey, width: 2),
              color: Colors.transparent,
            ),
            child: selected
                ? Center(
                    child: Container(
                      width: 10.w,
                      height: 10.h,
                      decoration: const BoxDecoration(color: AppColors.colourPrimaryPurple, shape: BoxShape.circle),
                    ),
                  )
                : null,
          ),
          10.width,
          CommonText(text: title, fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
        ],
      ),
    ),
  );
}