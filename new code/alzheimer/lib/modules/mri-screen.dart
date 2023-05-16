import 'package:alzheimer/modules/cnn-info/CNNInfo.dart';
import 'package:alzheimer/modules/cnn-result/cnn-result.dart';
import 'package:alzheimer/modules/mri-info/MRI-Info.dart';
import 'package:alzheimer/shared/constants/Constants.dart';
import 'package:alzheimer/shared/functions/shared_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
Widget buildMRiInfo(w, BuildContext context) {
  return Column(
    children: [
      const SizedBox(height: 50,),
      content(
          w,
          text: "Model Information",
          function: () {
            navigateTo(context, MRIInfoScreen());
          }
      ),
      const SizedBox(height: 40,),
      content(
        w,
          text: "CNN Information",
          function: () {
            navigateTo(context, CNNInfo());
          }
      ),
      const SizedBox(height: 40,),
      content(
          w,
          text: "Check Alzheimer",
          function: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              List<int> bytes = await image.readAsBytes().then((value) => value.toList());
              final response = await http.post(
                Uri.parse('http://127.0.0.1:5000/mriPredcitions'),
                body: {
                  "image": base64Encode(bytes)
                },
              );
              if (response.statusCode == 200) {
                navigateTo(context, CNNResultScreen(data: jsonDecode(response.body)));
              }
            }
          }
      ),
    ],
  );
}
Widget content (size, {required String text, required Function function}) {
  double w = size * 320 / 1366;
  double h = size * 70 / 1366;
  return Row(
    children: [
      Spacer(),
      AnimatedButton.strip(
            width: w,
            height: h,
            text: text,
            isReverse: true,
            selectedTextColor: Colors.black,
            stripTransitionType: StripTransitionType.RIGHT_TO_LEFT,
            selectedBackgroundColor: Color(0xFFE9A2F6),
            backgroundColor: Color(0xFFC075CE),
            textStyle: TextStyle(
                fontSize: 18,
                letterSpacing: 5,
                color: Colors.black,
                fontWeight: FontWeight.w300), onPress: () { function(); },
            animatedOn: AnimatedOn.onHover,
          ),
      SizedBox(width: 40,),
    ],
  );
}
/*
InkWell(
    onTap: () {
      function();
    },
    child: Row(
      children: [
        const Spacer(),
        Container(
          height: 100,
          width: w,
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
  )
 */
