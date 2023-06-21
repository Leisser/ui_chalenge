import 'package:flutter/material.dart';

// import '../textuus.dart';
import 'package:ui_chalenges/textuus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpecialFood extends StatelessWidget {
  SpecialFood({super.key});

  String? myname = 'Enoch';
  List<String>? comodities = [];
  List<String>? quantities = [];
  List<String>? brands = [];

  storeMyName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('myname', myname!);
    comodities = ['laptop', 'hardDisk', 'mouse'];

    quantities = ['3', '1', '2'];

    prefs.setStringList("comodities", comodities!);
    prefs.setStringList("quantities", quantities!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => storeMyName(),
          child: const Center(
            child: Text('nickname'),
          ),
        ),
        const ReusedText(),
      ],
    );
  }
}
