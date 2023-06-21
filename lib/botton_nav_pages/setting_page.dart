import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? myName;
  List<String>? quantities = [];
  List<String>? brands = [];

  getMyName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      myName = pref.getString('myname') ?? "Comrade";
      quantities = pref.getStringList("comodities");
      brands = pref.getStringList("quantities");
    });

    print(quantities);
    print(brands);
  }

  @override
  void initState() {
    super.initState();
    getMyName();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text("hello $myName"),
          Text(
              'You wanted to buy:\n  ${brands![0]} ${quantities![0]}\'s\n  ${brands![1]} ${quantities![1]}\'s\n  ${brands![2]} ${quantities![2]}\'s'),
        ],
      ),
    );
  }
}
