import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTextPostController extends GetxController {
  // Post body
  final TextEditingController postCtrl = TextEditingController();

  // UI state flags
  final RxBool showPeopleSearch = false.obs;
  final RxBool showSkillSearch = false.obs;

  // Search controllers
  final TextEditingController peopleSearchCtrl = TextEditingController();
  final TextEditingController skillSearchCtrl = TextEditingController();

  // Limits
  final int peopleLimit = 10;
  final int skillsLimit = 5;

  // Data models
  final RxList<Person> taggedPeople = <Person>[].obs;
  final RxList<String> featuredSkills = <String>[].obs;

  // Mock data
  final List<Person> allPeople = [
    Person('Cathrine Scott', '@cathrine', 'man'),
    Person('JohsKings', '@kingclubspin', 'man'),
    Person('John Scott', '@scotty4johns', 'man'),
    Person('Katherine Johns', '@kjones544', 'man'),
    Person('FranklineSpins', '@franklinespins', 'man'),
  ];

  final List<String> allSkills = const [
    'Balance & stability',
    'Pole flow',
    'Core strength',
    'Flexibility',
    'Acrobatics',
    'Heels',
    'Contemporary',
  ];

  // Pastel palettes and persistent color maps
  final List<Color> chipPalette = const [
    Color(0xFFFFE29A),
    Color(0xFFFFC3B4),
    Color(0xFFD6C4FF),
    Color(0xFFB4E9FF),
    Color(0xFFB6F2E5),
    Color(0xFFFFE5B4),
    Color(0xFFE3F0A6),
  ];
  final Map<String, Color> skillColorMap = {};
  final Map<String, Color> personColorMap = {};

  Color colorForSkill(String s) {
    return skillColorMap.putIfAbsent(
      s,
      () => chipPalette[skillColorMap.length % chipPalette.length],
    );
  }

  Color colorForPerson(Person p) {
    return personColorMap.putIfAbsent(
      p.handle,
      () => chipPalette[personColorMap.length % chipPalette.length],
    );
  }

  // Filters
  List<Person> get filteredPeople {
    final q = peopleSearchCtrl.text.trim().toLowerCase();
    if (q.isEmpty) return allPeople;
    return allPeople
        .where((p) => p.name.toLowerCase().contains(q) || p.handle.toLowerCase().contains(q))
        .toList();
  }

  List<String> get filteredSkills {
    final q = skillSearchCtrl.text.trim().toLowerCase();
    if (q.isEmpty) return allSkills;
    return allSkills.where((s) => s.toLowerCase().contains(q)).toList();
  }

  void togglePeopleSearch() {
    showPeopleSearch.value = !showPeopleSearch.value;
    update();
  }

  void toggleSkillSearch() {
    showSkillSearch.value = !showSkillSearch.value;
    update();
  }

  void toggleTag(Person p) {
    final exists = taggedPeople.any((e) => e.handle == p.handle);
    if (exists) {
      taggedPeople.removeWhere((e) => e.handle == p.handle);
    } else {
      if (taggedPeople.length >= peopleLimit) return;
      taggedPeople.add(p);
      colorForPerson(p);
      peopleSearchCtrl.clear();
      showPeopleSearch.value = false;
    }
    update();
  }

  void removeTag(Person p) {
    taggedPeople.removeWhere((e) => e.handle == p.handle);
    update();
  }

  void toggleSkill(String s) {
    if (featuredSkills.contains(s)) {
      featuredSkills.remove(s);
    } else {
      if (featuredSkills.length >= skillsLimit) return;
      featuredSkills.add(s);
      colorForSkill(s);
      skillSearchCtrl.clear();
      showSkillSearch.value = false;
    }
    update();
  }

  @override
  void onClose() {
    postCtrl.dispose();
    peopleSearchCtrl.dispose();
    skillSearchCtrl.dispose();
    super.onClose();
  }
}

class Person {
  final String name;
  final String handle;
  final String avatar;
  Person(this.name, this.handle, this.avatar);
}
