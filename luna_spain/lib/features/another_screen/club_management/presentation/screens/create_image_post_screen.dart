import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/component/button/common_button.dart';
import 'package:luna_spain/component/image/common_image.dart';
import 'package:luna_spain/component/text/common_text.dart';
import 'package:luna_spain/features/another_screen/club_management/presentation/controller/create_image_post_controller.dart';
import 'package:luna_spain/utils/constants/app_colors.dart';
import 'package:luna_spain/utils/constants/app_images.dart';
import 'package:luna_spain/utils/constants/app_string.dart';
import 'package:luna_spain/utils/extensions/extension.dart';

class CreateImagePostScreen extends StatelessWidget {
  const CreateImagePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CreateImagePostController>()) {
      Get.put(CreateImagePostController());
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 0.h),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: SafeArea(
        child: GetBuilder<CreateImagePostController>(builder: (c) {
          return Column(
            children: [
              _TopBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 14.h),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(28.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CommonText(text: 'New Post', fontSize: 36, fontWeight: FontWeight.w600, color: AppColors.colourPrimaryPurple),
                                  2.height,
                                  CommonText(
                                    text: 'from @[CLUB-NAME]', 
                                    fontSize: 16, 
                                    fontWeight: FontWeight.w600, 
                                    color: AppColors.colourPrimaryPurple),
                                ],
                              ),
                            ),
                        
                          ],
                        ),
                        28.height,
                        // Text + image preview row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.colourGreyScaleGreyTint40,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                                ),
                                child: TextField(
                                  controller: c.postCtrl,
                                  maxLines: 3,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "What a night 🎭 2024 showcase it was a pleasure.\n🥳 Just want to say a very big thank you to everyone.",
                                  ),
                                ),
                              ),
                            ),
                            10.width,
                            Container(
                              width: 120.w,
                              height: 120.w,
                              decoration: BoxDecoration(
                                color: AppColors.colourGreyScaleGreyTint40,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: c.selectedImagePath.isNotEmpty
                                    ? Image.asset(c.selectedImagePath.value, fit: BoxFit.cover)
                                    : CommonImage(imageSrc: AppImages.profileBg, height: 110.w, width: 110.w, fill: BoxFit.cover),
                              ),
                            ),
                          ],
                        ),

                        18.height,
                        // Tag People header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              
                              text: 'TAG PEOPLE', fontSize: 16, 
                              fontWeight: FontWeight.w500, 
                              color: AppColors.colorPrimaryBlack),
                            CommonText(
                              text: 'max. 10 tags', 
                              fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.colorPrimaryBlack),
                          ],
                        ),
                        8.height,
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: AppColors.colourGreyScaleGreyTint40,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                          ),
                          child: Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            children: [
                              ...c.taggedPeople.map((p) => Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                                    decoration: BoxDecoration(color: c.colorForPerson(p), borderRadius: BorderRadius.circular(16.r)),
                                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                                      GestureDetector(onTap: () => c.removeTag(p), child: CommonText(text: '×', fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.colorPrimaryBlack)),
                                      6.width,
                                      CommonText(text: p.name, fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
                                    ]),
                                  )),
                              GestureDetector(
                                onTap: c.togglePeopleSearch,
                                child: Container(
                                  width: 32.w,
                                  height: 32.h,
                                  decoration: const BoxDecoration(color: Color(0xFF4ECDC4), shape: BoxShape.circle),
                                  child: Icon(Icons.add, size: 18.sp, color: AppColors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (c.showPeopleSearch.value) ...[
                          10.height,
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: AppColors.colourGreyScaleGreyTint40,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.r), bottomRight: Radius.circular(12.r)),
                              border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.r), border: Border.all(color: AppColors.colourGreyScaleGreyTint60)),
                                  child: TextField(
                                    controller: c.peopleSearchCtrl,
                                    onChanged: (_) => c.update(),
                                    decoration: const InputDecoration(
                                      hintText: 'Joh',
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                    ),
                                  ),
                                ),
                                10.height,
                                SizedBox(
                                  height: 260.h,
                                  child: ListView.separated(
                                    itemCount: c.filteredPeople.length,
                                    separatorBuilder: (_, __) => 8.height,
                                    itemBuilder: (ctx, i) {
                                      final p = c.filteredPeople[i];
                                      return Container(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r), border: Border.all(color: AppColors.colourGreyScaleGreyTint60)),
                                        child: Row(
                                          children: [
                                            ClipOval(child: CommonImage(imageSrc: AppImages.man, height: 36.w, width: 36.w, fill: BoxFit.cover)),
                                            10.width,
                                            Expanded(
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                CommonText(text: p.name, fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.colourPrimaryPurple),
                                                CommonText(text: p.handle, fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.colorPrimaryBlue),
                                              ]),
                                            ),
                                            GestureDetector(
                                              onTap: () => c.toggleTag(p),
                                              child: Container(
                                                width: 28.w,
                                                height: 28.w,
                                                decoration: const BoxDecoration(color: Color(0xFF4ECDC4), shape: BoxShape.circle),
                                                child: Icon(c.taggedPeople.any((e) => e.handle == p.handle) ? Icons.check : Icons.add, size: 18.sp, color: AppColors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],

                        18.height,
                        // Featured Skills header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: 'FEATURED SKILLS', 
                              fontSize: 16, 
                              fontWeight: FontWeight.w500, 
                              color: AppColors.colorPrimaryBlack),
                            CommonText(
                              text: 'max. 5 skills',
                               fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.colorPrimaryBlack),
                          ],
                        ),
                        8.height,
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: AppColors.colourGreyScaleGreyTint40,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                          ),
                          child: Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            children: [
                              ...c.featuredSkills.map((s) => Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                                    decoration: BoxDecoration(color: c.colorForSkill(s), borderRadius: BorderRadius.circular(16.r)),
                                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                                      GestureDetector(onTap: () => c.toggleSkill(s), child: CommonText(text: '×', fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.colorPrimaryBlack)),
                                      6.width,
                                      CommonText(text: s, fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack),
                                    ]),
                                  )),
                              GestureDetector(
                                onTap: c.toggleSkillSearch,
                                child: Container(
                                  width: 32.w,
                                  height: 32.h,
                                  decoration: const BoxDecoration(color: Color(0xFF4ECDC4), shape: BoxShape.circle),
                                  child: Icon(Icons.add, size: 18.sp, color: AppColors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (c.showSkillSearch.value) ...[
                          10.height,
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: AppColors.colourGreyScaleGreyTint40,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.r), bottomRight: Radius.circular(12.r)),
                              border: Border.all(color: AppColors.colourGreyScaleGreyTint60),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.r), border: Border.all(color: AppColors.colourGreyScaleGreyTint60)),
                                  child: TextField(
                                    controller: c.skillSearchCtrl,
                                    onChanged: (_) => c.update(),
                                    decoration: const InputDecoration(hintText: 'Search skills...', border: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12)),
                                  ),
                                ),
                                10.height,
                                SizedBox(
                                  height: 260.h,
                                  child: ListView.separated(
                                    itemCount: c.filteredSkills.length,
                                    separatorBuilder: (_, __) => 8.height,
                                    itemBuilder: (ctx, i) {
                                      final s = c.filteredSkills[i];
                                      return Container(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r), border: Border.all(color: AppColors.colourGreyScaleGreyTint60)),
                                        child: Row(
                                          children: [
                                            Expanded(child: CommonText(text: s, fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.colorPrimaryBlack)),
                                            GestureDetector(
                                              onTap: () => c.toggleSkill(s),
                                              child: Container(
                                                width: 28.w,
                                                height: 28.w,
                                                decoration: const BoxDecoration(color: Color(0xFF4ECDC4), shape: BoxShape.circle),
                                                child: Icon(c.featuredSkills.contains(s) ? Icons.check : Icons.add, size: 18.sp, color: AppColors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],

                        25.height,
                        // Share button and links

                        CommonButton(
                          buttonHeight: 52,
                          borderColor: AppColors.colorSecondaryGreen,
                          borderWidth: 2,
                          buttonColor: AppColors.colorPrimaryGreen,
                          
                          titleText: AppString.share),




             
                        10.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (){
                                Get.back();
                              },
                              child: CommonText
                              (
                                text: 'Cancel',
                                 fontSize: 16, 
                                 underline: true,
                                 fontWeight: FontWeight.w600,
                                  color: AppColors.red),
                            ),
                            CommonText(
                              text: 'Save as draft', 
                              fontSize: 16,
                              underline: true,
                               fontWeight: FontWeight.w600, 
                               color: AppColors.colorPrimaryBlue),
                          ],
                        ),
                      ],
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
