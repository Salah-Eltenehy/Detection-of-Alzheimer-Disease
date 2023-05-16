import 'package:alzheimer/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

import 'modules/Screens/Welcome/welcome_screen.dart';
import 'modules/cnn-info/CNNInfo.dart';
import 'modules/cnn-result/cnn-result.dart';
import 'modules/home-page/HomePage.dart';
import 'modules/mri-info/MRI-Info.dart';

void main() async {
  await CachHelper.init();
  await CachHelper.saveData(key: 'email', value: 'johndoe@example.com');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alzheimer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Container(
        constraints: BoxConstraints(
          minWidth: 1500,
        ),
        child: HomePageScreen(),
      ),
    );
  }
}