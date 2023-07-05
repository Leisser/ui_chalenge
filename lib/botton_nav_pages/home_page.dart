import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_chalenges/datapages/pupil_names.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? myName;

  getMyName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      myName = pref.getString('myname') ?? "Comrade";
    });
  }

  @override
  void initState() {
    super.initState();
    getMyName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: MediaQuery.of(context).size.height * .5,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PupilPage(
                                        name: "Ivy",
                                        classs: 'P1',
                                        stream: 'Indigo',
                                      )),
                            );
                          },
                          child: Text(
                            "Good Morning\n$myName",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          suffixIcon: Container(
                            height: 30,
                            width: 30,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(15)),
                            child: const Icon(
                              Icons.search,
                              color: Colors.black87,
                              size: 25,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Search',
                          labelText: 'Search',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .27,
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Image(
                                  height: 120,
                                  width: 120,
                                  image: AssetImage('assets/images/brocoli.jpeg'),
                                ),
                                const Text(
                                  'Brocoli',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text(
                                    ' \$ 30 ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .27,
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Image(
                                  height: 120,
                                  width: 120,
                                  image: AssetImage('assets/images/carbage.jpeg'),
                                ),
                                const Text(
                                  'Cabbage',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text(
                                    ' \$ 37 ',
                                    style: TextStyle(
                                        backgroundColor: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .27,
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Image(
                                  height: 120,
                                  width: 120,
                                  image: AssetImage('assets/images/mango.jpeg'),
                                ),
                                const Text(
                                  'Mango',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text(
                                    ' \$ 22 ',
                                    style: TextStyle(
                                        backgroundColor: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .27,
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Image(
                                  height: 100,
                                  width: 120,
                                  image:
                                      AssetImage('assets/images/pineapple.jpeg'),
                                ),
                                const Text(
                                  'Pineapple',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text(
                                    ' \$ 90 ',
                                    style: TextStyle(
                                        backgroundColor: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
