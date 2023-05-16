
import 'dart:convert';

import 'package:alzheimer/shared/functions/component.dart';
import 'package:flutter/material.dart';

import '../shared/constants/Constants.dart';
import '../shared/network/local/cache_helper.dart';

import 'package:http/http.dart' as http;


  void getData() async {
    var uid = await CachHelper.getData(key: 'uid');
    // await FirebaseFirestore.instance
    //     .collection('Users')
    //     .where('uID', isEqualTo: uid)
    //     .get()
    //     .then((value) {
    //   value.docs.forEach((element) async {
    //     emailController.text = element.data()['email'];
    //     passwordController.text = await CachHelper.getData(key: 'password');
    //     phoneController.text = element.data()['phone'];
    //     usernameController.text = element.data()['userName'];
    //     setState(() {
    //
    //     });
    //   });
    // });
  }
  // void updateEmailAndPassword(String em, String pas) async {
  //   String email = await CachHelper.getData(key: 'email');
  //   String password = await CachHelper.getData(key: 'password');
  //   await FirebaseAuth.instance.
  //   signInWithEmailAndPassword(email: email, password: password)
  //       .then((value) {
  //     value.user?.updateEmail(em);
  //     value.user?.updatePassword(pas);
  //   })
  //   ;
  //   await CachHelper.saveData(
  //       key: 'email',
  //       value: em
  //   );
  //   await CachHelper.saveData(
  //       key: 'password',
  //       value: pas
  //   );
  // }
  // void updateUser(String email, String phone, String name) async {
  //   var docID = await CachHelper.getData(key: 'docID');
  //   await FirebaseFirestore.instance.collection('Users')
  //       .doc(docID)
  //       .update(
  //       {
  //         'email': email,
  //         'phone': phone,
  //         'userName': name
  //       }
  //   );
  // }

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var descriptionController = TextEditingController();

var formKey = GlobalKey<FormState>();
  Widget buildAccountScreen(
      {
          required String userName,
          required String email,
          required String password,
          required String phone,
          required String des,
          required String doc
      }
      ) {
    usernameController.text = userName;
    emailController.text =  email;
    passwordController.text = password;
    phoneController.text = phone;
    descriptionController.text = des;
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Spacer(),
              Container(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 60,),
                    textField(controller: usernameController, label: 'User Name'),
                    const SizedBox(height: 10,),
                    textField(controller: emailController, label: 'Email Address'),
                    const SizedBox(height: 10,),
                    textField(controller: phoneController, label: 'Phone Number'),
                    const SizedBox(height: 10,),
                    textField(controller: passwordController, label: 'Password'),
                    doc == "1"? Padding(
                      padding:  const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: TextField(
                        controller: descriptionController,
                        maxLines: 8,
                        textInputAction: TextInputAction.done,
                        cursorColor: kPrimaryColor,
                        decoration: const InputDecoration(
                          hintText: "Description",
                          border: OutlineInputBorder(
                            borderSide:  BorderSide(
                                width: 3,
                                color: kPrimaryColor
                            )
                          ),
                        ),
                      ),
                    ): Text(""),
                    const SizedBox(height: 26,),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: MaterialButton(
                        color: kPrimaryColor,
                        onPressed: () async {
                          if(formKey.currentState!.validate()) {
                            final response = await http.post(
                              Uri.parse('http://127.0.0.1:5000/updateUser'),
                              body: {
                                "name": usernameController.text,
                                "email": emailController.text,
                                "password": passwordController.text,
                                "phone": phoneController.text,
                                "description": descriptionController.text
                              }
                            );
                            Map<String, dynamic> data = jsonDecode(response.body);
                            print(data);
                            if (data['status'] == true) {
                              showToast(text: data['msg'], color: Colors.green, time: 2);
                            }
                            else {
                              showToast(text: data['msg'], color: Colors.red, time: 2);
                            }
                          }
                        },
                        child: const Center(child: Text("Save", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is require";
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          // labelText: label,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3,
                  color: kPrimaryColor
              )
          ),
          labelText: label
      ),
    );
  }
