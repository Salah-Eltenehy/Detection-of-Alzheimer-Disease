import 'package:alzheimer/shared/functions/component.dart';
import 'package:alzheimer/shared/functions/shared_function.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../../constants.dart';
import '../../Login/login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
class SignUpForm extends StatefulWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  var descriptionController = TextEditingController();

  var isDoctorController = false;

  var secureText = true;
  var formKey = GlobalKey<FormState>();
  IconData visible = Icons.visibility_off;
  IconData lock = Icons.lock;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            validator: (value) {
              if (value!.isEmpty) {
              return "This field is required";
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "User Name",
              prefixIcon: Icon(Icons.text_format),
            ),
          ),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is required";
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Email Address",
              prefixIcon: Icon(Icons.email),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: secureText,
              cursorColor: kPrimaryColor,
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                if (value.length < 8) {
                  return "Password should be greater than 8";
                }
                if (value.length > 40) {
                  return "Password should be less than 40";
                }
                return null;
              },
              decoration:  InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(lock),
                suffixIcon: IconButton(
                    icon:  Icon(visible),
                    onPressed: () {
                      secureText = !secureText;
                      if (secureText) {
                        visible = Icons.visibility_off;
                        lock = Icons.lock;
                      }else {
                        visible = Icons.visibility;
                        lock = Icons.lock_open;
                      }
                      setState(() {});
                    },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: phoneController,
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                if (value.length != 11) {
                  return "Enter a valid number";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Phone",
                prefixIcon: Icon(Icons.phone_android),
              ),
            ),
          ),
          isDoctorController ? Padding(
            padding:  const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextField(
              controller: descriptionController,
              maxLines: 8,
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
          ): const Text(""),
          Row(
            children: [
              Checkbox(
                  value: isDoctorController,
                  onChanged: (onChanged) {
                    isDoctorController = onChanged!;
                    setState(() {});
                  }
              ),
              const SizedBox(width: 10,),
              const Text('Are You doctor?')
            ],
          ),

          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () async {
              if (descriptionController.text.isEmpty && isDoctorController) {
                showToast(text: "Description is required", color: Colors.red, time: 4);
                return;
              }
              if (formKey.currentState!.validate()) {
                final response = await http.post(
                    Uri.parse('http://127.0.0.1:5000/addUser'),
                    body: {
                      "userName": nameController.text,
                      "emailAddress": emailController.text,
                      "password": passwordController.text,
                      "phone": phoneController.text,
                      "description": descriptionController.text,
                      "isDoctor": isDoctorController?"1":"0"
                    }
                );
                Map<String, dynamic> data = jsonDecode(response.body);
                print(data);
                if (data['status'] == true) {
                  showToast(text: "User Added", color: Colors.green, time: 2);
                  navigateAndFinish(context, LoginScreen());
                }
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}