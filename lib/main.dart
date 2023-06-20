import 'package:flutter/material.dart';
import 'package:ui_chalenges/botton_nav_pages/home_page.dart';
import 'package:ui_chalenges/botton_nav_pages/setting_page.dart';
import 'package:ui_chalenges/botton_nav_pages/special_food.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 1;

  List shownPages = const [SpecialFood(), HomePage(), SettingPage()];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shownPages[index],
      bottomNavigationBar: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                index = 0;
              }),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today,
                        color: index == 0 ? Colors.purple : Colors.black),
                    Text(
                      "Today's Special",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: index == 0 ? Colors.purple : Colors.black),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                index = 1;
              }),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.food_bank,
                        color: index == 1 ? Colors.purple : Colors.black),
                    Text(
                      "Food",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: index == 1 ? Colors.purple : Colors.black),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                index = 2;
              }),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings,
                        color: index == 2 ? Colors.purple : Colors.black),
                    Text(
                      "Setting",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: index == 2 ? Colors.purple : Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
