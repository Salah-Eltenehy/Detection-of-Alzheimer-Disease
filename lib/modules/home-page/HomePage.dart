import 'package:alzheimer/modules/testGenes/TestGenesScreen.dart';
import 'package:alzheimer/shared/functions/shared_function.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/Constants.dart';
import '../genes/Genes.dart';

class HomePageScreen extends StatelessWidget {
  double circleRadius = 100;
  double circleTextSize = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
            "Home Page",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: PAGEWIDTH/1.5,
          height: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.grey[100]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: circleRadius,
                    child: Text(
                        "MRI Model",
                        style: TextStyle(
                          fontSize: circleTextSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                    ),
                  )
              ),
              Container(width: double.infinity, height: 2, color: Colors.grey,),
              Expanded(
                  child: InkWell(
                    onTap: () {
                      navigateTo(context, GenesMainScreen());
                    },
                    child: CircleAvatar(
                      backgroundColor: kPrimaryColor,
                      radius: circleRadius,
                      child: Text(
                        "Genes Model",
                        style: TextStyle(
                            fontSize: circleTextSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
