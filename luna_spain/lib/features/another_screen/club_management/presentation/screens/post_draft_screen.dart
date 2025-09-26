import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/config/route/app_routes.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/controller/post_draft_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class PostDraftScreen extends StatelessWidget {
  const PostDraftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<PostDraftController>()) {
      Get.put(PostDraftController());
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 0.h),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: SafeArea(
        child: GetBuilder<PostDraftController>(builder: (c) {
          return Column(
            children: [
              _TopBar(),
              12.height,
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 24.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(text: 'Post Drafts', fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.colourPrimaryPurple),
                              Container(
                                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.colorGreyScalGrey)),
                                child: CircleAvatar(
                                  radius: 25.r,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(child: CommonImage(imageSrc: AppImages.clubLogo, height: 48.r, width: 48.r, fill: BoxFit.cover)),
                                ),
                              ),
                            ],
                          ),
                          22.height,

                          SizedBox(height: 140.h,
                         
                            child: ListView.builder(
                              
                              itemCount: c.postDraftList.length,
                              itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: InkWell(
                                  
                                  onTap: (){
                                    Get.toNamed(AppRoutes.createTextPost);
                                  },
                                  child: _rowTile(c.postDraftList[index])),
                              );
                            }),
                          ),
                      
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      bottomNavigationBar: SizedBox(height: MediaQuery.of(context).padding.bottom),
      backgroundColor: const Color(0xFFF4F6F8),
    );
  }

  Widget _rowTile(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.colourGreyScaleGreyTint40,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: CommonText(
              text: title,
              fontSize: 20,
              right: 15,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600,
              color: AppColors.colorPrimaryBlack,
            ),
          ),
          Icon(Icons.arrow_forward, size: 25.sp, color: AppColors.colorPrimaryBlack),
        ],
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
        border: Border(bottom: BorderSide(color: AppColors.colorPrimaryPink.withOpacity(0.6), width: 1.w)),
        color: AppColors.colourPrimaryPurple,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, 2), blurRadius: 4)],
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: () => Get.back(), child: Icon(Icons.arrow_back, color: AppColors.white, size: 40.h)),
          CommonImage(imageSrc: AppImages.logoWithBg, height: 40.h, width: 115.w, fill: BoxFit.contain),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.white, width: 2)),
            child: ClipOval(child: CommonImage(imageSrc: AppImages.man, height: 48.h, width: 48.w, fill: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}
