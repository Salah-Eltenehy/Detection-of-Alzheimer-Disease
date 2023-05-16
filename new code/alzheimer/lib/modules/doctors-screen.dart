


import 'package:alzheimer/modules/home-page/HomePage.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
List doctors = [];
_launchURL(String phone) async {
  var url = 'https://api.whatsapp.com/send/?phone=$phone&text=Hello';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
Widget buildDoctorsScreen(w, {required List<dynamic> d}) {
  doctors = d;
  double width = w * 500 / 1366;
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: ListView.separated(
      shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(238, 191, 228, 0.5019607843137255)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 500,
                        child: Text(
                          "\n${doctors[index][0]}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        width: width,
                        child: Text(
                          doctors[index][2],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          const Spacer(),
                          MaterialButton(
                              // color: Color.fromRGBO(67, 241, 31, 0.9019607843137255),
                              onPressed: () {
                                _launchURL(doctors[index][1]);
                              },
                              child: Image(image: AssetImage("assets/images/whatsapp.gif"), width: width/10, height: 40,)
                          ),
                          const SizedBox(width: 10,)
                        ],
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20,),
        itemCount: doctors.length
    )
    );

}
/*
{
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },
  {
    "name": "Salah El-Din",
    "description": "Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ",
    "phone": "+201021890205"
  },



 */