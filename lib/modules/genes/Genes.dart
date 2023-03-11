import 'package:alzheimer/modules/model-information/ModelInformationScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/constants/Constants.dart';
import '../../shared/functions/shared_function.dart';
import '../../shared/network/local/cache_helper.dart';
import '../SignIn/SignIn.dart';
import '../account/Account.dart';
import '../testGenes/TestGenesScreen.dart';
import '../webView/WebView.dart';

class GenesMainScreen extends StatelessWidget {

  double circleRadius = 80;
  double circleRadius2 = 80/1.2;
  double circleTextSize = 22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "Genes Main Screen",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: PAGEWIDTH/1.2,
          height: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.grey[100]
          ),
          child: ListView(
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, ViewScreen());
                          },
                          child: rowElement(
                              text: "Genes Definitions",
                              r: circleRadius*1.2
                          ),
                        ),
                    ),
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, ModelInformationScreen());
                          },
                          child: rowElement(
                              text: "Model Information",
                              r: circleRadius*1.2
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              Container(width: double.infinity, height: 2, color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          navigateTo(context, UserAccount());
                        },
                        child: rowElement(
                            text: "Account",
                            r: circleRadius/1.2
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var doc = await CachHelper.getData(key: 'docID');
                          CachHelper.sharedPreferences = await SharedPreferences.getInstance();
                          await CachHelper.saveData(key: 'docID', value: doc);
                          navigateAndFinish(context, SignInScreen());
                        },
                        child: rowElement(
                            text: "Exit",
                            r: circleRadius/1.2
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(width: double.infinity, height: 2, color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: ()  {
                          navigateTo(context, TestGenesModel());
                        },
                        child: rowElement(
                            text: "Test Model",
                            r: circleRadius*1.1
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowElement({required String text, required r}) {
    return CircleAvatar(
      backgroundColor: kPrimaryColor,
      radius: r,
      child: Text(
        text,
        style: TextStyle(
            fontSize: circleTextSize,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
      ),
    );
  }
}
