import 'package:flutter/material.dart';

import '../../shared/constants/Constants.dart';

class ShowResultsScreen extends StatelessWidget {

  String g1 = '9';
  String g2 = '9';
  String g3 = '9';
  String g4 = '9';
  String description = '';
  final String respone;
  ShowResultsScreen({super.key, required this.respone}){
    print(respone);
    String r = respone.replaceAll('[', '');
    r = r.replaceAll(']', '');
    List<String> temp = r.split(' ');
    g1 = temp[0];
    g2 = temp[1];
    g3 = temp[2];
    g4 = temp[3];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
      ),
      body: Center(
        child: Container(
          width: PAGEWIDTH,
          height: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.grey[100]
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: Image(
                      width: double.infinity,
                      // height: double.infinity,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/samples.jpg')
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                    "GSM701542: $g1",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                ),
                const SizedBox(height: 10,),
                Text(
                  "GSM701543: $g2",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  "GSM701544: $g3",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  "GSM701545: $g4",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
