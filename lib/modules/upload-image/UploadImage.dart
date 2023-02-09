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

  File? imageUploaded;
  String res = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload image"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          // height: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconButton(
                //   onPressed:() async {
                //     final ImagePicker _picker = ImagePicker();
                //     final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                //     imageUploaded = File(image!.path);
                //     print("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
                //     print(image!.path);
                //     setState(() {
                //
                //     });
                //   },
                //   icon: const Icon(Icons.add_a_photo),
                //   iconSize: 50,
                //   color: Colors.grey,
                //   tooltip:  "Upload photo",
                // ),
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
                    String name = "Salah";
                    String url = "http://127.0.0.1:5000/";
                    var response = await http.get(Uri.parse(url));
                    print(response.body);
                    var r = json.decode(response.body) as Map;
                    print(r);
                    setState(() {

                    });
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
}
