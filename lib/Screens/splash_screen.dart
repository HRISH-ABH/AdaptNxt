import 'package:adaptnxt_assigment/Screens/add_medicine_info.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToAddMedicineInfo();
  }

  _navigateToAddMedicineInfo() async {
    await Future.delayed(Duration(seconds: 3), () {}); // Splash screen duration
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AddMedicineInfo(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Center(
          child: Text(
            "AdaptNxt",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AddMedicineInfo(),
            ),
          );
        },
      ),
    );
  }
}
