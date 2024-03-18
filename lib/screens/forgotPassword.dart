import 'package:elma/constants/constant.dart';
import 'package:elma/screens/otpScreen.dart';
import 'package:elma/screens/recoveryScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool clearButton = false;
  TextEditingController emailCtroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Forgot password",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Please enter your email address. You will receive a link to create or set a new password via email",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailCtroller,
                onChanged: (e) {
                  if (e != "") {
                    setState(() {
                      clearButton = true;
                    });
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          emailCtroller.clear();
                        });
                      },
                      child: Icon(
                        CupertinoIcons.multiply,
                        color: kPrimaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Enter email"),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecoveryPassword()));
                  },
                  child: Text(
                    "Send link",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(55),
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Text("OR"),
                  SizedBox(
                    height: 25,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPScreen()));
                      },
                      child: Text(
                        "Verify using number",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
