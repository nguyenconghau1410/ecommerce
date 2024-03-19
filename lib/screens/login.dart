import 'package:elma/constants/constant.dart';
import 'package:elma/models/user.dart';
import 'package:elma/screens/forgotPassword.dart';
import 'package:elma/screens/homeScreen.dart';
import 'package:elma/screens/navigation.dart';
import 'package:elma/screens/signup.dart';
import 'package:flutter/material.dart';

import '../api/api_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  Future<void> login() async {
    await APIAuth.login(emailController.text, passwordController.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset("images/freed.png"),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Enter email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Enter password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye)),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                        child: Text(
                          "Forgot password",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await login();
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(55),
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)))),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {
                            if (login() != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            } else {}
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
