import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luna_spain/config/route/app_routes.dart';

class CreateClubDetailsController extends GetxController {
  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text fields
  final TextEditingController clubNameCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();
  final TextEditingController postcodeCtrl = TextEditingController();
  final TextEditingController specialtyInputCtrl = TextEditingController();
  final TextEditingController specialtySearchCtrl = TextEditingController();
  final TextEditingController managerSearchCtrl = TextEditingController();

  // UI state
  final RxBool showSpecialtySearch = false.obs;
  final RxBool showManagerSearch = false.obs;

  // Dropdown data
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  String? selectedCountry;

  final List<String> days = List.generate(31, (i) => (i + 1).toString().padLeft(2, '0'));
  final List<String> months = List.generate(12, (i) => (i + 1).toString().padLeft(2, '0'));
  final List<String> years = List.generate(90, (i) => (DateTime.now().year - i).toString());
  final List<String> countries = const [
    'United States',
    'United Kingdom',
    'Spain',
    'France',
    'Germany',
    'Italy',
    'Canada',
    'Australia',
  ];

  // Specialties
  final int specialtiesLimit = 10;
  final RxList<String> specialties = <String>[].obs;
  final List<String> allSpecialties = const [
    'Pole Fitness',
    'Aerial Hoop',
    'Aerial Silk',
    'Dance',
    'Flexibility',
    'Strength & Conditioning',
    'Heels',
    'Choreography',
    'Acrobatics',
    'Contemporary',
    'Ballet',
    'Yoga',
    'Pilates',
  ];

  // Persistent color per specialty (pastel palette)
  final List<Color> specialtyPalette = const [
    Color(0xFFFFE29A), // soft yellow
    Color(0xFFFFC3B4), // soft peach
    Color(0xFFD6C4FF), // soft purple
    Color(0xFFB4E9FF), // soft blue
    Color(0xFFB6F2E5), // soft teal
    Color(0xFFFFE5B4), // light orange
    Color(0xFFE3F0A6), // light lime
  ];
  final Map<String, Color> specialtyColorMap = {};

  Color colorForSpecialty(String s) {
    return specialtyColorMap.putIfAbsent(
      s,
      () => specialtyPalette[specialtyColorMap.length % specialtyPalette.length],
    );
  }

  // Managers pastel colors
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

  List<String> get filteredSpecialties {
    final q = specialtySearchCtrl.text.trim().toLowerCase();
    final base = q.isEmpty
        ? allSpecialties
        : allSpecialties.where((s) => s.toLowerCase().contains(q)).toList();
    return base;
  }

  void toggleSpecialtySearch() {
    showSpecialtySearch.value = !showSpecialtySearch.value;
    update();
  }

  void toggleManagerSearch() {
    showManagerSearch.value = !showManagerSearch.value;
    update();
  }

  void addSpecialty(String s) {
    final value = s.trim();
    if (value.isEmpty) return;
    if (specialties.contains(value)) return;
    if (specialties.length >= specialtiesLimit) return;
    specialties.add(value);
    // ensure a color is assigned
    colorForSpecialty(value);
    specialtyInputCtrl.clear();
    specialtySearchCtrl.clear();
    showSpecialtySearch.value = false;
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

  // Managers (mocked dataset for UI)
  final int managersLimit = 3;
  final RxList<Manager> selectedManagers = <Manager>[].obs;
  final List<Manager> allManagers = [
    Manager('Steph Hammond', '@steph', 'man'),
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

  void toggleManager(Manager m) {
    final exists = selectedManagers.any((e) => e.handle == m.handle);
    if (exists) {
      selectedManagers.removeWhere((e) => e.handle == m.handle);
    } else {
      if (selectedManagers.length >= managersLimit) return;
      selectedManagers.add(m);
      // assign a persistent color and auto-hide search after adding
      colorForManager(m);
      managerSearchCtrl.clear();
      showManagerSearch.value = false;
    }
    update();
  }

  bool get isValidForm {
    return clubNameCtrl.text.trim().isNotEmpty &&
        descriptionCtrl.text.trim().isNotEmpty &&
        selectedDay != null &&
        selectedMonth != null &&
        selectedYear != null &&
        selectedCountry != null &&
        postcodeCtrl.text.trim().isNotEmpty;
  }

  void onContinue() {
    if (!isValidForm) {
      Get.snackbar('Incomplete', 'Please complete all required fields.', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    // Proceed to step 3: add club images
    Get.toNamed(AppRoutes.createClubAddImage);
  }

  @override
  void onClose() {
    clubNameCtrl.dispose();
    descriptionCtrl.dispose();
    postcodeCtrl.dispose();
    specialtyInputCtrl.dispose();
    specialtySearchCtrl.dispose();
    managerSearchCtrl.dispose();
    super.onClose();
  }
}

class Manager {
  final String name;
  final String handle;
  final String avatar; // key into AppImages
  Manager(this.name, this.handle, this.avatar);
}
