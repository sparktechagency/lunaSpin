import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../config/route/app_routes.dart';

class AddProfileDetailsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  
  // Text controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  
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
  
  // Email notification
  bool receiveEmails = true;
  
  // Loading state
  bool isLoading = false;
  
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
  
  void continueToNext() {
    if (formKey.currentState!.validate()) {
      // Navigate to Add Profile Picture screen (step 3)
      Get.offNamed(AppRoutes.addProfilePicture);
    }
  }
  
  
  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }
}
