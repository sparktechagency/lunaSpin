import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luna_spain/utils/helpers/other_helper.dart';
import '../../../services/storage/storage_services.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_string.dart';
import '../button/common_button.dart';
import '../text/common_text.dart';
import '../text_field/common_text_field.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onTap,
    this.height = 30,
    this.selectedColor = AppColors.primaryColor,
    this.unselectedColor = Colors.transparent,
    this.style,
    this.isContainer = false,
    this.iconColor = AppColors.black,
    this.iconData = Icons.keyboard_arrow_down_outlined,
  });

  final List items;
  final List selectedItem;
  final Color selectedColor;
  final Color iconColor;
  final Color unselectedColor;
  final double height;
  final Function(int index) onTap;
  final TextStyle? style;
  final bool isContainer;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: PopupMenuButton<String>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: selectedColor),
        ),
        offset: const Offset(1, 1),
        padding: EdgeInsets.zero,
        itemBuilder:
            (BuildContext context) =>
        <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'option1',
            child: Column(
              children: List.generate(
                items.length,
                    (index) =>
                    GestureDetector(
                      onTap: () async {
                        await AnimationPopUpState.closeDialog();
                        onTap(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: selectedColor),
                                color:
                                selectedItem.contains(
                                  items[index].toString(),
                                )
                                    ? selectedColor
                                    : unselectedColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(items[index].toString(), style: style),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
          ),
        ],
        icon: Padding(
          padding: EdgeInsets.only(left: isContainer ? 40 : 0),
          child: Icon(iconData, color: iconColor, size: height),
        ),
      ),
    );
  }
}




logOutPopUp() {
  showDialog(
    context: Get.context!,
    builder: (context) {
      // Controller for the animation
      return AnimationPopUp(
        child: AnimatedBuilder(
          animation: CurvedAnimation(
            parent: ModalRoute.of(context)!.animation!,
            curve: Curves.easeIn,
          ),
          builder: (context, child) {
            return FadeTransition(
              opacity: ModalRoute.of(context)!.animation!,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                contentPadding: EdgeInsets.all(12.sp),
                title: const CommonText(
                  text: AppString.youSureWantToLogout,
                  maxLines: 2,
                  fontWeight: FontWeight.w600,
                ),
                actions: [
                  Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          titleText: AppString.no,
                          borderWidth: 1.5,
                          borderColor: AppColors.primaryColor,
                          buttonColor: AppColors.transparent,
                          titleColor: AppColors.primaryColor,
                          onTap: () => Get.back(),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: CommonButton(
                          titleText: AppString.yes,
                          onTap: () {
                            LocalStorage.removeAllPrefData();
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

deletePopUp({
  required TextEditingController controller,
  required VoidCallback onTap,
  bool isLoading = false,
}) {
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: Get.context!,
    builder: (context) {
      return AnimationPopUp(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: const EdgeInsets.only(bottom: 12),
          title: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CommonText(
                    text: AppString.areYouSure,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                    maxLines: 1,
                    bottom: 24.h,
                  ),
                ),
                CommonText(
                  text: AppString.deleteDetails,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  maxLines: 2,
                  bottom: 20.h,
                ),
                CommonTextField(
                  controller: controller,
                  labelText: AppString.enterYouPassword,
                  validator: OtherHelper.validator,
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    titleText: AppString.cancel,
                    titleColor: AppColors.black,
                    borderColor: AppColors.black,
                    buttonColor: AppColors.transparent,
                    buttonRadius: 4.r,
                    buttonHeight: 48.h,
                    onTap: AnimationPopUpState.closeDialog,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CommonButton(
                    titleText: AppString.done,
                    titleColor: AppColors.white,
                    buttonRadius: 4.r,
                    buttonHeight: 48.h,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await AnimationPopUpState.closeDialog();
                        onTap();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

logOutPopUps() {
  showDialog(
    context: Get.context!,
    builder: (context) {
      return AnimationPopUp(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          contentPadding: EdgeInsets.all(12.sp),
          title: const CommonText(
            text: AppString.youSureWantToLogout,
            maxLines: 2,
            fontWeight: FontWeight.w600,
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    titleText: AppString.no,
                    borderWidth: 1.5,
                    borderColor: AppColors.primaryColor,
                    buttonColor: AppColors.transparent,
                    titleColor: AppColors.primaryColor,
                    onTap: () {
                      AnimationPopUpState.closeDialog();
                    },
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CommonButton(
                    titleText: AppString.yes,
                    onTap: () async {
                      await AnimationPopUpState.closeDialog();
                      LocalStorage.removeAllPrefData();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

class AnimationPopUp extends StatefulWidget {
  const AnimationPopUp({super.key, required this.child});

  final Widget child;

  @override
  AnimationPopUpState createState() => AnimationPopUpState();
}

class AnimationPopUpState extends State<AnimationPopUp>
    with TickerProviderStateMixin {
  static late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  static Future<void> closeDialog() async {
    await _animationController.reverse();
    if (Get.context!.mounted) {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: FadeTransition(
            opacity: ModalRoute.of(context)!.animation!,
            child: widget.child,
          ),
        );
      },
    );
  }
}
