import 'package:alzheimer/modules/testGenes/TestGenesScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


import 'package:alzheimer/modules/SignIn/SignIn.dart';
import 'package:alzheimer/modules/signup/SignUp.dart';

// ignore_for_file: prefer_equal_for_default_values
import 'package:firebase_core/firebase_core.dart';
import 'package:alzheimer/shared/network/local/cache_helper.dart';
import 'firebase_options.dart';
import 'modules/webView/WebView.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  var userID = await CachHelper.getData(key: "uid");
  Widget startWidget = SignInScreen();
  if (userID != null) {
    startWidget = UploadImage();
  }
  var isDoc = await CachHelper.getData(key: 'isDoc')??false;
  runApp(MyApp(startWidget: startWidget, isDocotr: isDoc));
}

class MyApp extends StatelessWidget {
  final isDocotr;
  final Widget startWidget;
  const MyApp({
    super.key,
    required this.startWidget,
    required this.isDocotr
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: startWidget,
    );
  }
}
