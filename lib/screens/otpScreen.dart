import 'package:elma/constants/constant.dart';
import 'package:elma/screens/otpVerifyScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool clearButton = false;
  TextEditingController emailCtroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "OTP verification",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Please enter your email address. You will receive a link to create or set a new password via email",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 30,
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
                    prefixIcon: Icon(Icons.phone_iphone),
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
                    labelText: "Enter phonenumber"),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OTPVerifyScreen()));
                  },
                  child: Text(
                    "Send code",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(55),
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))))
            ],
          ),
        ),
      ),
    );
  }
}
