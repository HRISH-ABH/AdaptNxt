import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Switchfield extends StatefulWidget {
  const Switchfield({
    super.key,
    required this.isToggle,
    required this.label,
    required this.onToggleChanged,
  });
  final bool isToggle;
  final String label;
  final ValueChanged<bool> onToggleChanged;

  @override
  State<Switchfield> createState() => _SwitchfieldState();
}

class _SwitchfieldState extends State<Switchfield> {
  late bool _isToggle;

  @override
  void initState() {
    super.initState();
    _isToggle = widget.isToggle;
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.poppins(fontSize: 16),
        ),
        Transform.scale(
          scale: 0.8,
          child: Switch(
            activeColor: Colors.blue,
            value: widget.isToggle,
            onChanged: (value) {
              setState(() {
                _isToggle = value;
              });
              widget.onToggleChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
