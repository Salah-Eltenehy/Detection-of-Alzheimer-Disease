import 'dart:convert';

import 'package:alzheimer/modules/HomeScreenInfo.dart';
import 'package:alzheimer/modules/Screens/Welcome/welcome_screen.dart';
import 'package:alzheimer/modules/mri-screen.dart';
import 'package:alzheimer/shared/functions/component.dart';
import 'package:alzheimer/shared/functions/shared_function.dart';
import 'package:alzheimer/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import '../../shared/constants/Constants.dart';
import '../about-us-screen.dart';
import '../account.dart';
import '../doctors-screen.dart';
import '../genes-screen.dart';
import 'package:http/http.dart' as http;

class HomePageScreen extends StatefulWidget {

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String userName = "";
  String email = "";
  String password = "";
  String phone = "";
  String description = "";
  String doctor = "";
  List contentList = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List colorsHoverList = [
    kPrimaryLightColor,
    kPrimaryLightColor,
    kPrimaryLightColor,
    kPrimaryLightColor,
    kPrimaryLightColor,
    kPrimaryLightColor,
    kPrimaryLightColor,
  ];
  static List<dynamic> allDoctors = [];
  _HomePageScreenState() {
  }
  @override
  Widget build(BuildContext context) {
    double w = (MediaQuery.of(context).size.width * 700) / 1366.0;
    double butWidth = (MediaQuery.of(context).size.width * 120) / 1366.0;
    double butHeight = (MediaQuery.of(context).size.width * 120) / 1366.0;
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(
          minWidth: 1500,
        ),
        child: Stack(

          children: [
            const Image(
              image: AssetImage('assets/images/background.jpeg'),
              fit: BoxFit.cover,
              width:double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Spacer(),
                          topButton(title: "Home", function: () {
                            setState(() {
                              changeContent(0);
                            });
                          }, color: 0, index: 0, w: butWidth, h: butHeight),
                          const SizedBox(width: 10,),
                          topButton(title: "About Us", function: () {
                            setState(() {
                              changeContent(1);
                            });
                          }, color: 1, index: 1, w: butWidth, h: butHeight),
                          const SizedBox(width: 10,),
                          topButton(
                              title: "MRI Model",
                              function: () {
                                setState(() {
                                  changeContent(2);
                                });
                              },
                              color: 2, index: 2, w: butWidth, h: butHeight),
                          const SizedBox(width: 10,),
                          topButton(title: "Doctors", function: () async {
                            showToast(text: "Please wait", color: Colors.green, time: 4);
                            final response = await http.get(
                              Uri.parse('http://127.0.0.1:5000/getAllDoctors'),
                            );
                            Map<String, dynamic> data = jsonDecode(response.body);

                            if (data['status'] == true) {
                              allDoctors = data['res'];
                            }

                            setState(() {
                              print(allDoctors[0][0]);
                              changeContent(4);
                            });
                          }, color: 4, index: 3, w: butWidth, h: butHeight),
                          const SizedBox(width: 10,),
                          topButton(title: "Account", function: ()async {
                            String e = await CachHelper.getData(key: 'email');
                            final response = await http.get(
                              Uri.parse('http://127.0.0.1:5000/getUser/$e'),
                            );
                            Map<String, dynamic> data = jsonDecode(response.body);
                            if (data['status'] == true) {
                              userName = data['data'][0][0];
                              email = data['data'][0][1];
                              phone = data['data'][0][2];
                              password = data['data'][0][3];
                              description = data['data'][0][4];
                              doctor = "${data['data'][0][5]}";
                            }
                            setState(()  {
                              changeContent(5);
                            });
                          }, color: 5, index: 4, w: butWidth, h: butHeight),
                          const SizedBox(width: 10,),
                          topButton(title: "Exit", function: () {
                            navigateAndFinish(context, const WelcomeScreen());
                          }, color: 6, index: 5, w: butWidth, h: butHeight),
                          const SizedBox(width: 100,),
                        ],
                      ),
                    ),
                  ),
                  contentList[0]? buildHomeScreenInfo(w): const Text(""),
                  contentList[1]? buildAboutUs(w): const Text(""),
                  contentList[2]? buildMRiInfo(MediaQuery.of(context).size.width, context): const Text(""),
                  //contentList[3]? buildGenesInfo(): const Text(""),
                  contentList[4]? buildDoctorsScreen(MediaQuery.of(context).size.width,d: allDoctors): const Text(""),
                  contentList[5]? buildAccountScreen(
                      userName: userName,
                      email: email,
                      password: password,
                      phone: phone,
                      des: description,
                      doc: doctor
                  ): const Text(""),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
  void changeContent(int index) {
    for(int i=0; i<contentList.length; i++) {
      if (index != i) {
        contentList[i] = false;
      } else {
        contentList[i] = true;
      }
    }
  }
  Widget topButton(
        {
          required String title,
          required Function function,
          required color,
          required index,
          required w,
          required h
        }
      ) {
    return  AnimatedButton(
      height: 50,
      width: 120,
      text: title,
      isReverse: true,
      selectedTextColor: Colors.black,
      transitionType: TransitionType.LEFT_TO_RIGHT,
      textStyle: TextStyle(color: Colors.black),
      backgroundColor: Colors.white,
      borderColor: Colors.black,
      borderRadius: 50,
      borderWidth: 2, onPress: () {
          function();
          // setState(() {
          //   contentList[index] = true;
          //   for(int i=0; i<contentList.length; i++) {
          //     if (i!= index) {
          //       contentList[index] = false;
          //
          //     }
          //   }
          // });
      },
      animatedOn: AnimatedOn.onHover,
      selectedBackgroundColor: Color(0xFFDC5EEF), 
      // isSelected: contentList[index]
    );
  }

}
/*
TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => colorsHoverList[color]),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.black)
                )
            )
        ),
        onHover: (b) {
          if(b) {
            setState(() {
              colorsHoverList[color] = kPrimaryColor;
            });
          }
          else {
            setState(() {
              colorsHoverList[color] = kPrimaryLightColor;
            });
          }
        },
        onPressed: () {
          function();
        },
        child: Text(
            title,
            style: TextStyle(fontSize: 14)
        )
    )
 */