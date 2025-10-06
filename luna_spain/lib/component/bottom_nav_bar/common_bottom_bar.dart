import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/route/app_routes.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_icons.dart';
import '../../../utils/log/app_log.dart';

class CommonBottomNavBar extends StatefulWidget {
  // logical index: 0=home, 1=search, 2=chat, 3=profile
  final int currentIndex;
  // optional override for the center "+" action
  final VoidCallback? onCenterTap;

  const CommonBottomNavBar({
    required this.currentIndex,
    this.onCenterTap,
    super.key,
  });

  @override
  State<CommonBottomNavBar> createState() => _CommonBottomNavBarState();
}

class _CommonBottomNavBarState extends State<CommonBottomNavBar> {
  // visual index used for highlighting on the 5-item bar (skips center when needed)
  late int visualSelectedIndex;

  @override
  void initState() {
    visualSelectedIndex = _logicalToVisual(widget.currentIndex);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CommonBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      visualSelectedIndex = _logicalToVisual(widget.currentIndex);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final double barHeight = 72.h;
    final Radius corner = Radius.circular(28.r);

    return SafeArea(
      top: false,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: barHeight,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.colourPrimaryPurple,
          borderRadius: BorderRadius.only(topLeft: corner, topRight: corner),
          border: Border(
            top: BorderSide(
              color: AppColors.colorPrimaryPink60.withOpacity(0.6),
              width: 2.h,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _SvgNavItem(
              isSelected: visualSelectedIndex == 0,
              asset: AppIcons.homeIcon,
              onTap: () => _onVisualTap(0),
            ),
            _SvgNavItem(
              isSelected: visualSelectedIndex == 1,
              asset: AppIcons.searchIcon,
              onTap: () => _onVisualTap(1),
            ),
            // Center "+" button
            _CenterActionButton(
              // Route tap through the same handler so default sheet appears
              onTap: () => _onVisualTap(2),
            ),
            _SvgNavItem(
              isSelected: visualSelectedIndex == 3,
              asset: AppIcons.sendIcon,
              onTap: () => _onVisualTap(3),
            ),
            _SvgNavItem(
              isSelected: visualSelectedIndex == 4,
              asset: AppIcons.profileIcon,
              onTap: () => _onVisualTap(4),
            ),
          ],
        ),
      ),
    );
  }

  int _logicalToVisual(int logical) {
    // logical: 0,1,2,3 -> visual: 0,1,(skip 2),3,4
    if (logical >= 2) return logical + 1;
    return logical;
  }

  int? _visualToLogical(int visual) {
    // visual 0->0, 1->1, 2->center (null), 3->2, 4->3
    if (visual == 2) return null; // center button has no logical index
    if (visual >= 3) return visual - 1;
    return visual;
  }

  void _onVisualTap(int visualIndex) async {
    appLog(widget.currentIndex, source: "common bottombar");

    // handle center action
    if (visualIndex == 2) {
      if (widget.onCenterTap != null) {
        widget.onCenterTap!.call();
      } else {
        _showCreatePostSheet(context);
      }
      return;
    }

    final int? logicalIndex = _visualToLogical(visualIndex);
    if (logicalIndex == null) return;

    if (logicalIndex == 0) {
      if (widget.currentIndex != 0) {
        Get.toNamed(AppRoutes.userHome);
      }
    } else if (logicalIndex == 1) {
      if (widget.currentIndex != 1) {
        Get.toNamed(AppRoutes.search);
      }
    } else if (logicalIndex == 2) {
      if (widget.currentIndex != 2) {
        Get.toNamed(AppRoutes.message);
      }
    } else if (logicalIndex == 3) {
      if (widget.currentIndex != 3) {
        Get.toNamed(AppRoutes.profileEmpty);
      }
    }
  }
}

class _SvgNavItem extends StatelessWidget {
  final bool isSelected;
  final String asset;
  final VoidCallback onTap;

  const _SvgNavItem({
    required this.isSelected,
    required this.asset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Widget iconWidget = SvgPicture.asset(
      asset,
      width: 26.sp,
      height: 26.sp,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: isSelected
            ? Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.16),
                  shape: BoxShape.circle,
                ),
                child: iconWidget,
              )
            : iconWidget,
      ),
    );
  }
}

class _CenterActionButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _CenterActionButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 48.sp,
        height: 48.sp,
        padding: EdgeInsets.all(2.sp),
        decoration: BoxDecoration(
          color: AppColors.colourPrimaryPurple,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.colourPrimaryPurple80, width: 5),
        ),
        alignment: Alignment.center,
        child: Container(
          height: 40.sp,
          width: 40.sp,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            Icons.add,
            color: AppColors.colourPrimaryPurple,
            size: 28.sp,
          ),
        ),
      ),
    );
  }
}

// Default modal sheet matching the provided design
void _showCreatePostSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (_) {
      Widget divider() => Divider(
            height: 1,
            thickness: 1,
            color: AppColors.colourGreyScaleGreyTint60,
          );

      Widget actionItem(String label, ) {
        return InkWell(
     
          child: SizedBox(
            height: 56.h,
            width: double.infinity,
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: AppColors.colorPrimaryBlue,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }

      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
     
        
            InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.createImagePost);
              },
              child: actionItem(
                
                
                'Photo Library'),
            ),
            divider(),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.createTextPost);
              },
              child: actionItem('Text Only')),
            divider(),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.postDraft);
              },
              child: actionItem('Drafts')),
          ],
        ),
      );
    },
  );
}