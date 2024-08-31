import 'package:flutter/material.dart';

class DateTimePickerWidget extends StatefulWidget {
  const DateTimePickerWidget({super.key});

  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  TextEditingController startDateTimeController = TextEditingController();
  TextEditingController endDateTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDateTimeField("Start date & time", startDateTimeController),
        SizedBox(height: 16),
        _buildDateTimeField("End date & time", endDateTimeController),
      ],
    );
  }

  Widget _buildDateTimeField(String label, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        // SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "DD / MM / YYYY  HH: MM",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
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
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
    
              if (pickedTime != null) {
                setState(() {
                  final formattedDate =
                      "${pickedDate.day.toString().padLeft(2, '0')} / "
                      "${pickedDate.month.toString().padLeft(2, '0')} / ${pickedDate.year}";
                  final formattedTime =
                      "${pickedTime.hour.toString().padLeft(2, '0')}:"
                      "${pickedTime.minute.toString().padLeft(2, '0')}";
                  controller.text = "$formattedDate  $formattedTime";
                });
              }
            }
          },
        ),
      ],
    );
  }
}
