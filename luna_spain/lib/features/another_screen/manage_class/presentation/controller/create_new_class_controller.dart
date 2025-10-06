import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewClassController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Text fields
  final nameCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final attendeeCtrl = TextEditingController();
    final TextEditingController classLeaderController = TextEditingController();
    final TextEditingController featuredSkillsController = TextEditingController();

  final addressCtrl = TextEditingController();

  // Dropdowns / selectors
  final locations = <String>['Select location...', '[ADDRESS-OF-CLUB]', 'Other'];
  String selectedLocation = 'Select location...';

  final experienceLevels = <String>[
    'Select experience level...',
    'Beginner',
    'Intermediate',
    'Advanced',
    'All levels',
  ];
  String selectedExperience = 'Select experience level...';

  // Class leaders (max 2)
  final availableLeaders = <String>['Steph Johnson', 'Alex Doe', 'Jamie Lee'];
  final leaders = <String>[]; // chosen

  // Featured skills chips (max 5)
  final availableSkills = <String>[
    'Balance & stability',
    'Pole flow',
    'Core strength',
    'Flexibility',
    'Grip technique',
  ];
  final featuredSkills = <String>[];

  // Info helpers
  bool get canAddLeader => leaders.length < 2;
  bool get canAddSkill => featuredSkills.length < 5;

  void setLocation(String? v) {
    if (v == null) return;
    selectedLocation = v;
    update();
  }

  void setExperience(String? v) {
    if (v == null) return;
    selectedExperience = v;
    update();
  }

  void addLeader(String name) {
    if (!leaders.contains(name) && canAddLeader) {
      leaders.add(name);
      update();
    }
  }

  void removeLeader(String name) {
    leaders.remove(name);
    update();
  }

  void addSkill(String skill) {
    if (!featuredSkills.contains(skill) && canAddSkill) {
      featuredSkills.add(skill);
      update();
    }
  }

  void removeSkill(String skill) {
    featuredSkills.remove(skill);
    update();
  }

  String? requiredValidator(String? v) {
    if ((v ?? '').trim().isEmpty) return 'This field is required';
    return null;
  }

  Future<void> onNext() async {
    final form = formKey.currentState;
    if (form == null) return;
    if (!form.validate()) return;
    if (leaders.isEmpty) {
      Get.snackbar('Validation', 'Please select at least 1 class leader');
      return;
    }
    if (selectedLocation == 'Select location...') {
      Get.snackbar('Validation', 'Please select a location');
      return;
    }
    if (selectedExperience == 'Select experience level...') {
      Get.snackbar('Validation', 'Please select a level of experience');
      return;
    }
    // Stub: navigate to next step/date-time screen later
    Get.snackbar('Saved', 'Step 1 completed (stub)');
  }


  //==================== class leaders 


  // Specialties
  final RxBool showSpecialtySearch = false.obs;
  final int specialtiesLimit = 10;
  final RxList<String> specialties = <String>[].obs;
  final List<String> allSpecialties = const [
    'Pole Dancing',
    'Pole Fitness',
    'Floor Work',
    'Heels',
    'Aerial Hoop',
    'Aerial Silk',
    'Dance',
    'Flexibility',
    'Strength & Conditioning',
    'Choreography',
  ];

  final List<Color> specialtyPalette = const [
    Color(0xFFFFE29A),
    Color(0xFFFFC3B4),
    Color(0xFFD6C4FF),
    Color(0xFFB4E9FF),
    Color(0xFFB6F2E5),
    Color(0xFFFFE5B4),
    Color(0xFFE3F0A6),
  ];
  final Map<String, Color> specialtyColorMap = {};
  Color colorForSpecialty(String s) {
    return specialtyColorMap.putIfAbsent(
      s,
      () => specialtyPalette[specialtyColorMap.length % specialtyPalette.length],
    );
  }

  List<String> get filteredSpecialties {
    final q = classLeaderController.text.trim().toLowerCase();
    if (q.isEmpty) return allSpecialties;
    return allSpecialties.where((s) => s.toLowerCase().contains(q)).toList();
  }

  void toggleSpecialtySearch() {
    showSpecialtySearch.value = !showSpecialtySearch.value;
    update();
  }

  void removeSpecialty(String s) {
    specialties.remove(s);
    update();
  }

  void toggleSpecialty(String s) {
    if (specialties.contains(s)) {
      specialties.remove(s);
    } else {
      if (specialties.length >= specialtiesLimit) return;
      specialties.add(s);
      colorForSpecialty(s);
      classLeaderController.clear();
      showSpecialtySearch.value = false;
    }
    update();
  }


  /// ============Featured skilss
  /// 
  
  // Managers



  // Featured Skill
  final RxBool showFeaturedSkillsSearch = false.obs;
  final int featuredSkillsLimit = 10;
  final RxList<String> featuredSkill = <String>[].obs;
  final List<String> allFeaturedSkills = const [
    'Balance & stability',
    'Pole flow',
    'Core strength',
    'Flexibility',
    'Grip technique',
    'Dance',
    'Flexibility',
    'Strength & Conditioning',
    'Choreography',
  ];

  final List<Color> featureSkillColor = const [
    Color(0xFFFFE29A),
    Color(0xFFFFC3B4),
    Color(0xFFD6C4FF),
    Color(0xFFB4E9FF),
    Color(0xFFB6F2E5),
    Color(0xFFFFE5B4),
    Color(0xFFE3F0A6),
  ];
  final Map<String, Color> featureSkillColorMap = {};
  Color colorForFeatureSkill(String s) {
    return featureSkillColorMap.putIfAbsent(
      s,
      () => featureSkillColor[featureSkillColorMap.length % featureSkillColor.length],
    );
  }

  List<String> get filteredFeaturedSkills {
    final q = featuredSkillsController.text.trim().toLowerCase();
    if (q.isEmpty) return allFeaturedSkills;
    return allFeaturedSkills.where((s) => s.toLowerCase().contains(q)).toList();
  }

  void toggleFeaturedSearch() {
    showFeaturedSkillsSearch.value = !showFeaturedSkillsSearch.value;
    update();
  }

  void removeFeaturesSkill(String s) {
    featuredSkill.remove(s);
    update();
  }

  void toggleFeaturesSkill(String s) {
    if (featuredSkill.contains(s)) {
      featuredSkill.remove(s);
    } else {
      if (featuredSkill.length >= featuredSkillsLimit) return;
      featuredSkill.add(s);
      colorForFeatureSkill(s);
      featuredSkillsController.clear();
      showFeaturedSkillsSearch.value = false;
    }
    update();
  }




  @override
  void onClose() {
    nameCtrl.dispose();
    descCtrl.dispose();
    attendeeCtrl.dispose();
    addressCtrl.dispose();
    super.onClose();
  }}
