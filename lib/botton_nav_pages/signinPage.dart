import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_chalenges/botton_nav_pages/bottom-page_export.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'package:ui_chalenges/data_models/export_models.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var passportNumberController = TextEditingController();
  var passwordController = TextEditingController();
  late String animationURL;
  Artboard? _teddyArtboard;
  SMITrigger? successTrigger, failTrigger;
  SMIBool? isHandsUp, isChecking;
  SMINumber? numLook;
  StateMachineController? stateMachineController;
  bool _responseLoading = false;
  String? password = '';
  String? pasportNumber = '';

  _login(String pasportNumber, String password) async {
    var url = Uri.parse("https://cassoatry.shop/user/login");
    var bodyString = {
      "password": password,
      "passport_number": pasportNumber,
    };

    var body = jsonEncode(bodyString);
    var response = await http.post(url,
        headers: {
          "Content-Type": 'Application/json',
        },
        body: body);
    print("+++++++${response.body}++++++");
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      UserLogined user = UserLogined.fromJson(item);
      goToHome();
    } else if (response.statusCode == 409) {
      print("user not activated");
    } else {
      print("bro we are hungry we need to go");
    }
  }

  checkfilled() {
    if (pasportNumber!.isNotEmpty && password!.isNotEmpty) {
      _login(pasportNumber!, password!);
    } else {
      print(pasportNumber);
      print(password);
      // showSnackBar("Fill both password and passport number");
    }
  }

  @override
  void initState() {
    super.initState();
    print('Hey');
    // httpOverrides();
    animationURL = 'assets/rive/login.riv';
    rootBundle.load(animationURL).then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        stateMachineController =
            StateMachineController.fromArtboard(artboard, "Login Machine");
        if (stateMachineController != null) {
          artboard.addController(stateMachineController!);

          for (var e in stateMachineController!.inputs) {
            debugPrint(e.runtimeType.toString());
            debugPrint("name${e.name}End");
          }

          for (var element in stateMachineController!.inputs) {
            if (element.name == "trigSuccess") {
              successTrigger = element as SMITrigger;
            } else if (element.name == "trigFail") {
              failTrigger = element as SMITrigger;
            } else if (element.name == "isHandsUp") {
              isHandsUp = element as SMIBool;
            } else if (element.name == "isChecking") {
              isChecking = element as SMIBool;
            } else if (element.name == "numLook") {
              numLook = element as SMINumber;
            }
          }
        }

        setState(() => _teddyArtboard = artboard);
      },
    );
    // recordFistVisit();
  }

  // recordFistVisit() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.clear();
  // }

  // Future<StateMachineController?> getArtboard(ByteData data) async {
  //   final file = RiveFile.import(data);
  //   print(file.header.fileId);
  //   print(data.lengthInBytes);

  //   setState(() {
  //     art = file.mainArtboard;
  //   });
  //   print(art!.height);
  //   print(art!.name);
  //   var controllers = StateMachineController.fromArtboard(art!, 'idle');

  //   return controllers;
  // }

  // initArtboard() {
  //   return rootBundle.load('assets/rive/login_screen.riv').then(
  //     (data) async {
  //       StateMachineController? stateMachineControllers =
  //           await getArtboard(data);
  //       setState(() {
  //         stateMachineController = stateMachineControllers;
  //       });
  //       if (stateMachineController != null) {
  //         art!.addController(stateMachineController!);
  //         for (var element in stateMachineController!.inputs) {
  //           if (element.name == "isChecking") {
  //             isChecking = element as SMIBool;
  //           } else if (element.name == "isHandsUp") {
  //             isHandsUp = element as SMIBool;
  //           } else if (element.name == "trigSuccess") {
  //             successTriger = element as SMITrigger;
  //           } else if (element.name == "trigFail") {
  //             failTrigger = element as SMITrigger;
  //           } else if (element.name == "numLook") {
  //             lookNum = element as SMINumber;
  //           }
  //         }
  //       } else {
  //         print('null null');
  //       }
  //       // art.addController(stateMachineController!);
  //       setState(() {
  //         artboard = art;
  //       });
  //     },
  //   );
  // }

  // checking() {
  //   isHandsUp.change(false);
  //   isChecking.change(true);
  //   lookNum.change(0);
  // }

  // moveEyes(value) {
  //   lookNum.change(value.length.toDouble());
  // }

  // handsUp() {
  //   isHandsUp.change(true);
  //   isChecking.change(false);
  // }

  // login() {
  //   isHandsUp.change(false);
  //   isChecking.change(false);
  //   if (passportNumberController.text == "admin" &&
  //       passwordController.text == 'aye') {
  //     successTriger.fire();
  //   } else {
  //     failTrigger.fire();
  //   }
  // }

  void handsOnTheEyes() {
    isHandsUp?.change(true);
  }

  goToHome() {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomePage(),
      ),
    );
  }

  void lookOnTheTextField() {
    print('object');
    print('object');
    print('object');
    print('object');
    isHandsUp?.change(false);
    isChecking?.change(true);
    numLook?.change(0);
  }

  void moveEyeBalls(val) {
    numLook?.change(val.length.toDouble());
  }

  // void login() {
  //   isChecking?.change(false);
  //   isHandsUp?.change(false);
  //   if (passportNumberController.text == "admin" &&
  //       passwordController.text == "admin") {
  //     successTrigger?.fire();
  //   } else {
  //     failTrigger?.fire();
  //   }
  // }

  // void toSignUpPage() {
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //     builder: (context) => const SignUpPage(),
  //   //   ),
  //   // );
  //   context.go('/signup');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd6e2ea),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Models Class",
                style: TextStyle(color: Color(0xFF432a72), fontSize: 22),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (_teddyArtboard != null)
                      SizedBox(
                        width: 400,
                        height: MediaQuery.of(context).size.height * .3,
                        child: Rive(
                          artboard: _teddyArtboard!,
                          fit: BoxFit.fitWidth,
                        ),
                      ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xFF432a72),
                          borderRadius: BorderRadius.circular(5)),
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width < 600
                          ? double.infinity
                          : 700,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: TextField(
                              textInputAction: TextInputAction.next,
                              onSubmitted: (value) {
                                handsOnTheEyes();
                              },
                              decoration: InputDecoration(
                                hintText: 'Passport Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  gapPadding: 2,
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color(0xFF432a72),
                                  ),
                                ),
                              ),
                              onTap: lookOnTheTextField,
                              obscureText: false,
                              controller: passportNumberController,
                              onChanged: (value) {
                                setState(() {
                                  moveEyeBalls(value);
                                  pasportNumber = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: TextField(
                              textInputAction: TextInputAction.send,
                              onSubmitted: (value) {
                                checkfilled();
                              },
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  gapPadding: 2,
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color(0xFF432a72),
                                  ),
                                ),
                              ),
                              onTap: handsOnTheEyes,
                              obscureText: true,
                              controller: passwordController,
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              // MouseRegion(
                              //   cursor: MaterialStateMouseCursor.clickable,
                              //   child: GestureDetector(
                              //     onTap: () {
                              //       toSignUpPage();
                              //     },
                              //     child: const Text(
                              //       'Create new account',
                              //       style: TextStyle(
                              //         color: Colors.green,
                              //         fontStyle: FontStyle.italic,
                              //         fontWeight: FontWeight.w700,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              ElevatedButton(
                                onPressed: () {
                                  checkfilled();
                                },
                                style: ButtonStyle(
                                  mouseCursor:
                                      MaterialStateMouseCursor.clickable,
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(100, 35)),
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // FlatButton(
                    //   onPressed: () {
                    //     // Navigate to sign-up page
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => SignUpPage()),
                    //     );
                    //   },
                    //   child: Text('Sign Up'),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
