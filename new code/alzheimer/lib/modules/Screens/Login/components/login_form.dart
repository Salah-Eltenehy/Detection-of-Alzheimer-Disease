import 'dart:convert';

import 'package:alzheimer/modules/account.dart';
import 'package:alzheimer/modules/home-page/HomePage.dart';
import 'package:alzheimer/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

import '../../../../shared/functions/component.dart';
import '../../../../shared/functions/shared_function.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../../constants.dart';
import '../../Signup/signup_screen.dart';
import 'package:http/http.dart' as http;

import '../login_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
      child: Column(
        children: [
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
            },
            decoration: const InputDecoration(
              hintText: "Your email",
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
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () async {
                final response = await http.post(
                    Uri.parse('http://127.0.0.1:5000/login'),
                    body: {
                      "emailAddress": emailController.text,
                      "password": passwordController.text,
                    }
                );
                Map<String, dynamic> data = jsonDecode(response.body);
                print(data);
                if (data['status'] == true) {
                  showToast(text: data['msg'], color: Colors.green, time: 2);
                  await CachHelper.saveData(key: 'email', value: emailController.text);
                  navigateAndFinish(context, HomePageScreen());
                } else {
                  showToast(text: data['msg'], color: Colors.red, time: 4);
                }
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
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
