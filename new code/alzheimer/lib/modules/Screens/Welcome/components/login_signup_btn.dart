import 'package:flutter/material.dart';

import '../../../../constants.dart';

import '../../Login/login_screen.dart';
import '../../Signup/signup_screen.dart';

class LoginAndSignupBtn extends StatefulWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginAndSignupBtn> createState() => _LoginAndSignupBtnState();
}

class _LoginAndSignupBtnState extends State<LoginAndSignupBtn> {

  @override
  Widget build(BuildContext context) {
    var w = (MediaQuery.of(context).size.width * 300) / 1366;
    var h = (MediaQuery.of(context).size.width * 60) / 1366;
    return Column(
      children: [
        SizedBox(
          width: w,
          height: h,
          child: Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
              child: Text(
                "Login".toUpperCase(),
                style: TextStyle(
                  fontSize: h/2
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: w,
          height: h,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                primary: kPrimaryLightColor, elevation: 0),
            child: Text(
              "Sign Up".toUpperCase(),
              style: TextStyle(color: Colors.black, fontSize: h/2),
            ),
          ),
        ),
      ],
    );
  }
}
