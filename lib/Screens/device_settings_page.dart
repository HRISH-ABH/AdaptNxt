import 'package:adaptnxt_assigment/provider/settings.dart';
import 'package:adaptnxt_assigment/widgets/list_wheel_scroll_view.dart';
import 'package:adaptnxt_assigment/widgets/switchField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InitialPage extends StatefulWidget {
  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    final settingsState = Provider.of<SettingsState>(context);

  
  List<String> alarmSounds = [
    'Beep',
    'Siren',
    'Chime',
    'Buzz',
    'Ring',
    'Alert',
    'Ding',
    'Horn',
  ];

  List<String> alarmSoundsStrength = ["Low", "Medium", "Louder"];
  List<String> alarmSoundsTimer = ["5 min", "10 min", "15 min"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Settings"),
         backgroundColor: Colors.white,
        
         scrolledUnderElevation :0,
     
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Set vacation time
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 139, 141, 143), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Switchfield(
                      isToggle: settingsState.switch1,
                      label: "Set vacation time",
                      onToggleChanged: settingsState.toggleSwitch1,
                    ),
                    // Start/end date and time
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start Date and Time",
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        _buildDateTimeField(
                          context,
                          settingsState.updateStartDate,
                          settingsState.updateStartTime,
                          settingsState.startDate,
                          settingsState.startTime,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "End Date and Time",
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        _buildDateTimeField(
                          context,
                          settingsState.updateEndDate,
                          settingsState.updateEndTime,
                          settingsState.endDate,
                          settingsState.endTime,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Show Meds Name
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Switchfield(
                  isToggle: settingsState.switch2,
                  label: "Show Meds Name",
                  onToggleChanged: settingsState.toggleSwitch2,
                ),
              ),
              const SizedBox(height: 16),
              // Notify pharma to autofill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Switchfield(
                  isToggle: settingsState.switch3,
                  label: "Notify Pharma to autofill",
                  onToggleChanged: settingsState.toggleSwitch3,
                ),
              ),
              const SizedBox(height: 16),
              // Add sorry time
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Switchfield(
                  isToggle: settingsState.switch4,
                  label: "Add sorry time",
                  onToggleChanged: settingsState.toggleSwitch4,
                ),
              ),
              const SizedBox(height: 16),
              // Occupied cabinets
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Occupied cabinets",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "1,2,3,4,5",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Alarm Settings
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Alarm Settings",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Alarm Tune",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: TextEditingController(
                          text: settingsState.selectedAlarmSound),
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: "Select Sound",
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        final selectedSound = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListWheelScroll(
                              items: alarmSounds,
                              onSelected: settingsState.selectAlarmSound,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Alarm Strength",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: TextEditingController(
                          text: settingsState.selectedAlarmStrength),
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: "Select Strength",
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        final selectedSoundStrength = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListWheelScroll(
                              items: alarmSoundsStrength,
                              onSelected: settingsState.selectAlarmStrength,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Alarm Snooze Timer",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: TextEditingController(
                          text: settingsState.selectedAlarmTime),
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: "Select Time",
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        final selectedSoundTime = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListWheelScroll(
                              items: alarmSoundsTimer,
                              onSelected: settingsState.selectAlarmTime,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

    Widget _buildDateTimeField(
      BuildContext context,
      ValueChanged<String> onDateChanged,
      ValueChanged<String> onTimeChanged,
      String date,
      String time) {
    // Create and return a widget that includes the date and time pickers
    // Using _startDateController and _startTimeController for the date and time fields
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: TextEditingController(text: date),
                  decoration: const InputDecoration(
                    hintText: "  DD / MM / YYYY",
                    border: InputBorder.none,
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null) {
                      final formattedDate =
                          "${pickedDate.day.toString().padLeft(2, '0')} / "
                          "${pickedDate.month.toString().padLeft(2, '0')} / ${pickedDate.year}";
                      onDateChanged(formattedDate);
                    }
                  },
                ),
              ),
              const SizedBox(width: 86),
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: TextEditingController(text: time),
                  decoration: const InputDecoration(
                    hintText: "HH: MM",
                    border: InputBorder.none,
                  ),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (pickedTime != null) {
                      final formattedTime = pickedTime.format(context);
                      onTimeChanged(formattedTime);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
