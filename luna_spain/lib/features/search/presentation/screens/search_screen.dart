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
import '../controller/search_controller.dart' as s;

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<s.SearchController>()) {
      Get.put(s.SearchController());
    }

    return Scaffold(
      backgroundColor: AppColors.colourGreyScaleGreyTint60,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(backgroundColor: AppColors.colourPrimaryPurple),
      ),
      body: GetBuilder<s.SearchController>(builder: (c) {
        return Column(
          children: [
            _topBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    12.height,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: _SearchField(),
                    ),
                    12.height,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: _FilterChips(),
                    ),
                    7.height,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                      child: c.selectedFilter == 'Clubs'
                          ? _ClubsList(clubs: c.clubs)
                          : _PostsGrid(images: c.images),
                    ),
                  ],
                ),
              ),
            ),
            100.height,
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
        child: const SafeArea(top: false, child: CommonBottomNavBar(currentIndex: 1)),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: TextField(
        onTap: () {
          Get.toNamed(AppRoutes.searchResults);
        },
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: AppColors.colorPrimaryBlack.withOpacity(0.5)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Icon(Icons.search, color: AppColors.colourPrimaryPurple),
          ),
        ),
        onChanged: (val) {
          // In future: call controller to filter items
        },
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<s.SearchController>(builder: (c) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (final f in c.filters)
            InkWell(
              onTap: () => c.selectFilter(f),
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: c.selectedFilter == f ? AppColors.colorPrimaryBlue : AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: CommonText(
                  text: f,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: c.selectedFilter == f ? AppColors.white : AppColors.colourPrimaryPurple,
                ),
              ),
            ),
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
  const _ImageTile({required this.img});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.r),
      child: CommonImage(imageSrc: img, fill: BoxFit.cover),
    );
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
        children: const [
          CommonText(
            text: 'Lorem ipsum dolor sit amet, consecte tur adipiscing elit.',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
            color: AppColors.colourPrimaryPurple,
            maxLines: 3,
          ),
          SizedBox(height: 7),
          CommonText(
            text: 'Hardcore workout...',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            bottom: 5,
            color: AppColors.colorPrimaryBlack,
          ),
          CommonText(
            text: 'confidance-booster: for',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.colorGreyScalBlack60,
          ),
          SizedBox(height: 15),
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

class _ClubsList extends StatelessWidget {
  final List<s.Club> clubs;
  const _ClubsList({required this.clubs});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: clubs.length,
      separatorBuilder: (_, __) => 8.height,
      itemBuilder: (context, index) {
        final club = clubs[index];
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
            leading: ClipOval(
              child: CommonImage(
                imageSrc: club.avatar,
                height: 44.w,
                width: 44.w,
                fill: BoxFit.cover,
              ),
            ),
            title: CommonText(
              text: club.name,
              fontSize: 18,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w700,
              color: AppColors.colourPrimaryPurple,
            ),
            subtitle: CommonText(
              text: '${club.members.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => '${m[1]},')} Members',
              fontSize: 16,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600,
              color: AppColors.colorPrimaryBlue,
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}

Widget _topBar(BuildContext context) {
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
