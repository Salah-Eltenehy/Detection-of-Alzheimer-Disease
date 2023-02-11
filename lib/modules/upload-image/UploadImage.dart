import 'dart:io';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
class UploadImage extends StatefulWidget {

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {

  var firstGeneController = TextEditingController();
  var secondGeneController = TextEditingController();
  var thirdGeneController = TextEditingController();
  var forthGeneController = TextEditingController();
  var mutationController = TextEditingController();
  String res = "";
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Genes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Center(
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40,),
                Row(
                  children: [
                    textField(controller: firstGeneController, label: 'GSM701542 Gene'),
                    const SizedBox(width: 8,),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.question_mark_sharp)
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    textField(controller: secondGeneController, label: 'GSM701543 Gene'),
                    const SizedBox(width: 8,),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.question_mark_sharp)
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    textField(controller: thirdGeneController, label: 'GSM701544 Gene'),
                    const SizedBox(width: 8,),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.question_mark_sharp)
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    textField(controller: forthGeneController, label: 'GSM701545 Gene'),
                    const SizedBox(width: 8,),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.question_mark_sharp)
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    textField(controller: mutationController, label: 'Mutation'),
                    const SizedBox(width: 8,),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.question_mark_sharp)
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                const SizedBox(height: 20,),
                Text(
                  res,
                  style: const TextStyle(
                      color: Colors.blue
                  ),
                ),
                const SizedBox(height: 20,),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () async {
                    if(formKey.currentState!.validate()) {
                      print("YES");
                      String g1 ="${firstGeneController.text}";
                      String g2 = "${secondGeneController.text}";
                      String g3 = "${thirdGeneController.text}";
                      String g4 = "${forthGeneController.text}";
                      String mu = "${mutationController.text}";
                      String url = 'http://127.0.0.1:5000/test/$g1/$g2/$g3/$g4/$mu';
                      var response = await http.post(
                          Uri.parse(url),
                        //   body: json.encode({
                        //     'gene1': firstGeneController.text,
                        //     'gene2': secondGeneController.text,
                        //     'gene3': thirdGeneController.text,
                        //     'gene4': forthGeneController.text,
                        //     'mutation': mutationController.text
                        // })
                      );
                      print(response.body);
                      var r = json.decode(response.body) as Map;
                      print(r);
                      setState(() {

                      });
                    }

                  },
                  child: const Text("Show Results"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget textField(
        {
          required TextEditingController controller,
          required String label,
        }
      ) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return "This field is require";
          }

          else if (
          !(value.contains(RegExp(
              r"^[0-9.]")))
          )
          {
            return "Please enter a value\nFor more information click on mark";
          }
          return null;
        },
        decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            // labelText: label,
            border: const OutlineInputBorder(),
            hintText: label
        ),
      ),
    );
  }
}
