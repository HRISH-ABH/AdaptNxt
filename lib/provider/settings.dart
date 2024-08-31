import 'package:flutter/foundation.dart';

class SettingsState with ChangeNotifier {
  // Switch states
  bool _switch1 = false;
  bool _switch2 = false;
  bool _switch3 = false;
  bool _switch4 = false;

  // Text field controllers
  String _startDate = '';
  String _startTime = '';
  String _endDate = '';
  String _endTime = '';

  // Alarm settings
  String _selectedAlarmSound = 'Select Sound';
  String _selectedAlarmStrength = 'Select Strength';
  String _selectedAlarmTime = 'Select Time';

  // Getters and setters
  bool get switch1 => _switch1;
  bool get switch2 => _switch2;
  bool get switch3 => _switch3;
  bool get switch4 => _switch4;

  String get startDate => _startDate;
  String get startTime => _startTime;
  String get endDate => _endDate;
  String get endTime => _endTime;

  String get selectedAlarmSound => _selectedAlarmSound;
  String get selectedAlarmStrength => _selectedAlarmStrength;
  String get selectedAlarmTime => _selectedAlarmTime;

  // Switch handlers
  void toggleSwitch1(bool value) {
    _switch1 = value;
    notifyListeners();
  }

  void toggleSwitch2(bool value) {
    _switch2 = value;
    notifyListeners();
  }

  void toggleSwitch3(bool value) {
    _switch3 = value;
    notifyListeners();
  }

  void toggleSwitch4(bool value) {
    _switch4 = value;
    notifyListeners();
  }

  // Date and time handlers
  void updateStartDate(String date) {
    _startDate = date;
    notifyListeners();
  }

  void updateStartTime(String time) {
    _startTime = time;
    notifyListeners();
  }

  void updateEndDate(String date) {
    _endDate = date;
    notifyListeners();
  }

  void updateEndTime(String time) {
    _endTime = time;
    notifyListeners();
  }

  // Alarm settings handlers
  void selectAlarmSound(String sound) {
    _selectedAlarmSound = sound;
    notifyListeners();
  }

  void selectAlarmStrength(String strength) {
    _selectedAlarmStrength = strength;
    notifyListeners();
  }

  void selectAlarmTime(String time) {
    _selectedAlarmTime = time;
    notifyListeners();
  }
}
