import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luna_spain/services/storage/storage_services.dart';
import 'package:luna_spain/utils/helpers/other_helper.dart';

import '../../../../config/api/api_end_point.dart';
import '../../../../config/route/app_routes.dart';
import '../../../../services/api/api_service.dart';
import '../../../../utils/app_utils.dart';

class ProfileController extends GetxController {
  /// Language List here
  List languages = ["English", "French", "Arabic"];

  /// form key here
  final formKey = GlobalKey<FormState>();

  /// select Language here
  String selectedLanguage = "English";

  /// select image here
  String? image;
  /// select cover image here
  String? coverImage;

  /// edit button loading here
  bool isLoading = false;

  /// all controller here
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  /// last name controller added for edit profile screen
  TextEditingController lastNameController = TextEditingController();

  // ================= Additional profile details (migrated from AddProfileDetailsController) =================
  // Dropdown values
  String? selectedCountry;
  String? selectedYears;
  String? selectedLevel;

  // Date of birth
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  // Skills
  List<String> selectedSkills = [];
  List<String> availableSkills = [
    'Grip strength',
    'Backbends',
    'Core flow',
    'Spin transitions',
  ];
  // Stable color for each skill chip
  final Map<String, Color> skillColorMap = {};
  final List<Color> _skillPalette = const [
    Color(0xFFF6C75A), // yellow
    Color(0xFFE57373), // red
    Color(0xFF81C784), // green
    Color(0xFF9575CD), // purple
    Color(0xFFB39DDB), // lilac
  ];

  // Email notification (kept for parity, optional in EditProfile)
  bool receiveEmails = true;

  // Dropdown options
  List<String> countries = [
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
    'Spain',
    'Italy',
    'Japan',
    'Other',
  ];

  List<String> years = [
    '0-1 years',
    '1-2 years',
    '2-3 years',
    '3-5 years',
    '5+ years',
  ];

  List<String> levels = [
    'Beginner',
    'Intermediate',
    'Advanced',
    'Expert',
  ];

  List<String> days = List.generate(31, (index) => (index + 1).toString().padLeft(2, '0'));
  List<String> months = [
    '01', '02', '03', '04', '05', '06',
    '07', '08', '09', '10', '11', '12'
  ];
  List<String> yearsOfBirth = List.generate(80, (index) => (DateTime.now().year - index).toString());

  void toggleSkill(String skill) {
    if (selectedSkills.contains(skill)) {
      removeSkill(skill);
    } else if (selectedSkills.length < 5) {
      _ensureColorFor(skill);
      selectedSkills.add(skill);
      update();
    } else {
      Get.snackbar('Limit reached', 'You can add up to 5 skills.');
    }
  }

  void addSkill(String raw) {
    final skill = raw.trim();
    if (skill.isEmpty) {
      Get.snackbar('Empty skill', 'Please enter a skill.');
      return;
    }
    if (selectedSkills.contains(skill)) {
      Get.snackbar('Already added', 'This skill is already in your list.');
      return;
    }
    if (selectedSkills.length >= 5) {
      Get.snackbar('Limit reached', 'You can add up to 5 skills.');
      return;
    }
    _ensureColorFor(skill);
    selectedSkills.add(skill);
    update();
  }

  void removeSkill(String skill) {
    selectedSkills.remove(skill);
    skillColorMap.remove(skill);
    update();
  }

  void _ensureColorFor(String skill) {
    if (!skillColorMap.containsKey(skill)) {
      final used = skillColorMap.values.toSet();
      final color = _skillPalette.firstWhere(
        (c) => !used.contains(c),
        orElse: () => _skillPalette[(selectedSkills.length) % _skillPalette.length],
      );
      skillColorMap[skill] = color;
    }
  }

  void toggleEmailNotification() {
    receiveEmails = !receiveEmails;
    update();
  }

  /// select image function here
  getProfileImage() async {
    image = await OtherHelper.openGalleryForProfile();
    update();
  }

  /// select cover image function here
  getCoverImage() async {
    coverImage = await OtherHelper.openGalleryForProfile();
    update();
  }

  /// select language  function here
  selectLanguage(int index) {
    selectedLanguage = languages[index];
    update();
    Get.back();
  }

  /// update profile function here
  Future<void> editProfileRepo() async {
    if (!formKey.currentState!.validate()) return;

    if (!LocalStorage.isLogIn) return;
    isLoading = true;
    update();

    Map<String, String> body = {
      "fullName": nameController.text,
      "phone": numberController.text,
    };

    var response = await ApiService.multipart(
      ApiEndPoint.user,
      body: body,
      imagePath: image,
      imageName: "image",
    );

    if (response.statusCode == 200) {
      var data = response.data;

      LocalStorage.userId = data['data']?["_id"] ?? "";
      LocalStorage.myImage = data['data']?["image"] ?? "";
      LocalStorage.myName = data['data']?["fullName"] ?? "";
      LocalStorage.myEmail = data['data']?["email"] ?? "";

      LocalStorage.setString("userId", LocalStorage.userId);
      LocalStorage.setString("myImage", LocalStorage.myImage);
      LocalStorage.setString("myName", LocalStorage.myName);
      LocalStorage.setString("myEmail", LocalStorage.myEmail);

      Utils.successSnackBar("Successfully Profile Updated", response.message);
      Get.toNamed(AppRoutes.profile);
    } else {
      Utils.errorSnackBar(response.statusCode, response.message);
    }

    isLoading = false;
    update();
  }

  @override
  void onClose() {
    nameController.dispose();
    numberController.dispose();
    lastNameController.dispose();
    super.onClose();
  }
}
