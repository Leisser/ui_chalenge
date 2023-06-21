import 'package:flutter/material.dart';

class PupilPage extends StatefulWidget {
  final String name;
  final String? classs, stream;

  const PupilPage({super.key, required this.name, this.classs, this.stream});

  @override
  State<PupilPage> createState() => _PupilPageState(
        name: name,
        classs: classs,
        stream: stream,
      );
}

class _PupilPageState extends State<PupilPage> {
  final String name;
  final String? classs, stream;
  _PupilPageState({required this.name, this.classs, this.stream});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text("Welcome $name to $classs $stream"),
        ),
      ),
    );
  }
}
