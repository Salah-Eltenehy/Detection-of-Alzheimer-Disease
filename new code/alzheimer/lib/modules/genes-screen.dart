import 'package:alzheimer/shared/constants/Constants.dart';
import 'package:flutter/material.dart';

Widget buildGenesInfo() {
  return Column(
    children: [
      const SizedBox(height: 150,),
      content(
          text: "Model Information",
          function: () {
            print("TEST MODEL");
          }
      ),
      const SizedBox(height: 40,),
      content(
          text: "CNN Information",
          function: () {
            print("TEST MODEL");
          }
      ),
      const SizedBox(height: 40,),
      content(
          text: "Test Model",
          function: () {
            print("TEST MODEL");
          }
      ),
    ],
  );
}
Widget content ({required String text, required Function function}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Row(
      children: [
        const Spacer(),
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child:   Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 40,),
      ],
    ),
  );
}

