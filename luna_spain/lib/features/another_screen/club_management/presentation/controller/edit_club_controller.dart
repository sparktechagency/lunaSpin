import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditClubController extends GetxController {
  // Form
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  // Text fields
  final TextEditingController clubNameCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();
  final TextEditingController postcodeCtrl = TextEditingController();
  final TextEditingController specialtySearchCtrl = TextEditingController();
  final TextEditingController managerSearchCtrl = TextEditingController();

  // Images
  String? image; // profile/logo path
  String? coverImage; // cover path

  Future<void> getProfileImage() async {
    // TODO: implement picker, then:
    // image = pickedPath; update();
  }

  Future<void> getCoverImage() async {
    // TODO: implement picker, then:
    // coverImage = pickedPath; update();
  }

  // Established date
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  final List<String> days = List.generate(31, (i) => (i + 1).toString().padLeft(2, '0'));
  // Use named months per the design screenshot
  final List<String> months = const [
    'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'
  ];
  final List<String> years = List.generate(120, (i) => (DateTime.now().year - i).toString());

  // Country
  String? selectedCountry;
  final List<String> countries = const [
    'United Kingdom',
    'United States',
    'Spain',
    'France',
    'Germany',
    'Italy',
    'Canada',
    'Australia',
  ];

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
    final q = specialtySearchCtrl.text.trim().toLowerCase();
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
      specialtySearchCtrl.clear();
      showSpecialtySearch.value = false;
    }
    update();
  }

  // Managers
  final RxBool showManagerSearch = false.obs;
  final int managersLimit = 3;

  final List<Color> managerPalette = const [
    Color(0xFFFFE29A),
    Color(0xFFFFC3B4),
    Color(0xFFD6C4FF),
    Color(0xFFB4E9FF),
    Color(0xFFB6F2E5),
    Color(0xFFFFE5B4),
    Color(0xFFE3F0A6),
  ];
  final Map<String, Color> managerColorMap = {};
  Color colorForManager(Manager m) {
    return managerColorMap.putIfAbsent(
      m.handle,
      () => managerPalette[managerColorMap.length % managerPalette.length],
    );
  }

  final RxList<Manager> selectedManagers = <Manager>[].obs;
  final List<Manager> allManagers = [
    Manager('Steph Johnson', '@steph', 'man'),
    Manager('John Kings', '@kinghslupin', 'man'),
    Manager('Scott Johns', '@scottyjohns', 'man'),
    Manager('Katherine Johns', '@kjones444', 'man'),
    Manager('Frankline Spins', '@franklinespins', 'man'),
  ];

  List<Manager> get filteredManagers {
    final q = managerSearchCtrl.text.trim().toLowerCase();
    if (q.isEmpty) return allManagers;
    return allManagers
        .where((m) => m.name.toLowerCase().contains(q) || m.handle.toLowerCase().contains(q))
        .toList();
  }

  void toggleManagerSearch() {
    showManagerSearch.value = !showManagerSearch.value;
    update();
  }

  void toggleManager(Manager m) {
    final exists = selectedManagers.any((e) => e.handle == m.handle);
    if (exists) {
      selectedManagers.removeWhere((e) => e.handle == m.handle);
    } else {
      if (selectedManagers.length >= managersLimit) return;
      selectedManagers.add(m);
      colorForManager(m);
      managerSearchCtrl.clear();
      showManagerSearch.value = false;
    }
    update();
  }

  // Visibility selector
  String? selectedVisibility;
  final List<String> visibilityOptions = const [
    'Yes, make public on the internet',
    'No, limit to LunaSpin network',
  ];

  // Save
  Future<void> onSave() async {
    if (clubNameCtrl.text.trim().isEmpty ||
        descriptionCtrl.text.trim().isEmpty ||
        selectedDay == null ||
        selectedMonth == null ||
        selectedYear == null ||
        selectedCountry == null ||
        postcodeCtrl.text.trim().isEmpty) {
      Get.snackbar('Incomplete', 'Please complete all required fields.', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading = true;
    update();
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      Get.snackbar('Saved', 'Club profile updated.', snackPosition: SnackPosition.BOTTOM);
      // TODO: Call repo/API to persist
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onClose() {
    clubNameCtrl.dispose();
    descriptionCtrl.dispose();
    postcodeCtrl.dispose();
    specialtySearchCtrl.dispose();
    managerSearchCtrl.dispose();
    super.onClose();
  }
}

class Manager {
  final String name;
  final String handle;
  final String avatar;
  Manager(this.name, this.handle, this.avatar);
}