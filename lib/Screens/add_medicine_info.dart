import 'package:flutter/material.dart';
import 'package:adaptnxt_assigment/Screens/device_settings_page.dart';

class AddMedicineInfo extends StatefulWidget {
  const AddMedicineInfo({super.key});

  @override
  State<AddMedicineInfo> createState() => _AddMedicineInfoState();
}

class _AddMedicineInfoState extends State<AddMedicineInfo> {
  final TextEditingController _medicineNameController = TextEditingController();
  String _selectedFrequency = 'Daily';
  List<AlarmTimeDose> _alarmList = [AlarmTimeDose(time: '08:00', dose: '5 ml')];

  void _addAlarm() {
    setState(() {
      _alarmList.add(AlarmTimeDose(time: '08:00', dose: '5 ml'));
    });
  }

  void _removeAlarm(int index) {
    setState(() {
      _alarmList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Medicine Info",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        actions: [
          InkWell(
            child: const Text(
              "Next",
              style: TextStyle(
                color: Color.fromARGB(255, 8, 136, 240),
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InitialPage(),
                ),
              );
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Medicine Name",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: TextField(
                    controller: _medicineNameController,
                    decoration: const InputDecoration(
                      hintText: "enter name",
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Frequency",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Column(
                children: ['Daily', 'Specific Days', 'Interval', 'As Needed']
                    .map((frequency) => RadioListTile<String>(
                      activeColor: const Color.fromARGB(255, 8, 136, 240),
                          title: Text(
                            frequency,
                            style: TextStyle(
                              fontWeight: _selectedFrequency == frequency
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          value: frequency,
                          groupValue: _selectedFrequency,
                          onChanged: (value) {
                            setState(() {
                              _selectedFrequency = value!;
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _alarmList.length,
                itemBuilder: (context, index) {
                  return AlarmTimeDoseWidget(
                    alarmTimeDose: _alarmList[index],
                    onRemove: () => _removeAlarm(index),
                  );
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _addAlarm,
                  icon: const Icon(
                    Icons.add,
                    color: Color.fromARGB(
                        255, 8, 136, 240), // Match the text color
                  ),
                  label: const Text(
                    'Add more alarm',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 136, 240), // Text color
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 235, 246,
                        255), // Set the background color to light blue
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 12.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlarmTimeDose {
  String time;
  String dose;

  AlarmTimeDose({required this.time, required this.dose});
}

class AlarmTimeDoseWidget extends StatelessWidget {
  final AlarmTimeDose alarmTimeDose;
  final VoidCallback onRemove;

  const AlarmTimeDoseWidget({
    Key? key,
    required this.alarmTimeDose,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: alarmTimeDose.time,
              decoration: InputDecoration(
                labelText: 'Set time ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: TextFormField(
              initialValue: alarmTimeDose.dose,
              decoration: InputDecoration(
                labelText: "dose",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
