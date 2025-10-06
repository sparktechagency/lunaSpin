import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../../component/image/common_image.dart';
import '../../../../../component/text/common_text.dart';
import '../../../../../config/route/app_routes.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/constants/app_icons.dart';
import '../../../../../utils/extensions/extension.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = _demoMessages;

    return Scaffold(
      backgroundColor: AppColors.colorGreyScalGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: Column(
        children: [
          _TopBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.colorGreyScalGreyTint20,
                  borderRadius: BorderRadius.circular(12.r),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CommonText(
                          text: 'Messages',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.colourPrimaryPurple,
                        ),
                      ),
                      14.height,
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: messages.length,
                        separatorBuilder: (_, __) => Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.colourGreyScaleGreyTint60,
                        ),
                        itemBuilder: (context, index) {
                          final m = messages[index];
                          return Dismissible(
                            key: ValueKey('msg-$index-${m.handle}'),
                            direction: DismissDirection.endToStart,
                            background: _DeleteBg(),
                            onDismissed: (_) {
                              // TODO: hook delete
                            },
                            child: InkWell(
                              onTap: () => Get.toNamed(AppRoutes.lunaChat),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _Avatar(image: m.avatar),
                                    10.width,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CommonText(
                                                text: m.handle,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.colorPrimaryBlue,
                                                textAlign: TextAlign.start,
                                              ),

                                              7.width,
                                              Container(
                                                height: 6.h,
                                                width: 6.w,
                                                decoration: BoxDecoration(
                                                  color: AppColors.colorPrimaryBlack,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),

                                                8.width,


                                              CommonText(
                                                text: m.time,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.colorPrimaryBlack,
                                              ),
                                            ],
                                          ),
                                          6.height,
                                          CommonText(
                                            text: m.preview,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.colorPrimaryBlack,
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
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
          child: CommonBottomNavBar(currentIndex: 2),
        ),
      ),
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
}

class _Avatar extends StatelessWidget {
  final String image;
  const _Avatar({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.w,
      width: 44.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white, width: 2),
        color: AppColors.white,
      ),
      child: ClipOval(
        child: CommonImage(
          imageSrc: image,
          height: 44.w,
          width: 44.w,
          fill: BoxFit.cover,
        ),
      ),
    );
  }
}

class _DeleteBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      color: AppColors.red,
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }
}

class _Msg {
  final String avatar;
  final String handle;
  final String time;
  final String preview;
  _Msg(this.avatar, this.handle, this.time, this.preview);
}

final _demoMessages = <_Msg>[
  _Msg(AppImages.man, '@georginaleon', '2m ago', 'Lorem ipsum dolor sit amet, consect…'),
  _Msg(AppImages.man, '@kerrypole', '1h ago', 'Maecenas ut sollicitudin justo…'),
  _Msg(AppImages.man, '@joshahd', '4h ago', 'Morbi dapibus justo at hendrerit rhonc…'),
  _Msg(AppImages.man, '@profile4eva', '3d ago', 'Phasellus sed eget ligula laoreet…'),
  _Msg(AppImages.man, '@trexpolein', '8d ago', 'In tincidunt mi vel nunc ultrices…'),
  _Msg(AppImages.man, '@profokatie', '12d ago', 'In finibus, elit id ornare varius…'),
  _Msg(AppImages.man, '@spinningfree', '23d ago', 'Maecenas at sollicitudin justo…'),
  _Msg(AppImages.man, '@joshahd', '132d ago', 'Morbi dapibus justo at hendrerit rhonc…'),
  _Msg(AppImages.man, '@sindyhoophope', '141d ago', 'Morbi dapibus justo at hendrerit rhonc…'),
];