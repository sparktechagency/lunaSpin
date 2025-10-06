import 'package:get/get.dart';

class CreateNewClassDateAndTimeController extends GetxController {
  // Date of class
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  final List<String> days = List.generate(31, (i) => (i + 1).toString().padLeft(2, '0'));
  final List<String> months = const [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  final List<String> years = List.generate(80, (i) => (DateTime.now().year + i).toString());

  // Start time (HH:MM)
  String? startHour;
  String? startMinute;
  final List<String> hours = List.generate(24, (i) => i.toString().padLeft(2, '0'));
  final List<String> minutes = const ['00', '15', '30', '45'];

  // Duration (HH:MM)
  String? durationHour;
  String? durationMinute;

  // Recurrence
  String? selectedRecurrence;
  final List<String> recurrenceOptions = const [
    'Does not repeat',
    'Repeats daily',
    'Repeats weekly',
    'Repeats monthly',
    'Repeats yearly',
  ];

  // Weekly recurrence details (shown when selectedRecurrence == 'Repeats weekly')
  String? weeklyInterval; // every N weeks
  final List<String> weeklyIntervals = List.generate(12, (i) => '${i + 1}');

  final List<String> weekDays = const [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  final RxList<String> selectedWeekDays = <String>[].obs;
  void toggleWeekDay(String d) {
    if (selectedWeekDays.contains(d)) {
      selectedWeekDays.remove(d);
    } else {
      selectedWeekDays.add(d);
    }
    update();
  }

  // Repeat until options
  String? repeatUntil; // 'Forever', 'Until set date', 'After occurrences', 'No end date'
  final List<String> repeatUntilOptions = const [
    'Forever',
    'Until set date',
    'After occurrences',
    'No end date',
  ];

  // If 'Until set date'
  String? endDay;
  String? endMonth;
  String? endYear;

  // If 'After occurrences'
  String? occurrencesCount;
  final List<String> occurrencesOptions = List.generate(30, (i) => '${i + 1}');

  bool get isValidDate => selectedDay != null && selectedMonth != null && selectedYear != null;
  bool get isValidStart => startHour != null && startMinute != null;
  bool get isValidDuration => durationHour != null && durationMinute != null;
  bool get isValid => isValidDate && isValidStart && isValidDuration && selectedRecurrence != null;

  void onNext() {
    if (!isValid) {
      Get.snackbar('Validation', 'Please complete all required fields.');
      return;
    }
    Get.snackbar('Saved', 'Date & Time saved (stub)');
  }
}