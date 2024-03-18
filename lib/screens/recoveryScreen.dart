import 'package:elma/constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecoveryPassword extends StatefulWidget {
  const RecoveryPassword({super.key});

  @override
  State<RecoveryPassword> createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  bool clearButton = false;
  TextEditingController resetCodeCtroller = TextEditingController();
  TextEditingController passwordCtroller = TextEditingController();
  TextEditingController confirmPasswordCtroller = TextEditingController();

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
              TextFormField(
                controller: resetCodeCtroller,
                onChanged: (e) {
                  if (e != "") {
                    setState(() {
                      clearButton = true;
                    });
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.numbers_rounded),
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          resetCodeCtroller.clear();
                        });
                      },
                      child: Icon(
                        CupertinoIcons.multiply,
                        color: kPrimaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Reset code"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordCtroller,
                onChanged: (e) {
                  if (e != "") {
                    setState(() {
                      clearButton = true;
                    });
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          passwordCtroller.clear();
                        });
                      },
                      child: Icon(
                        CupertinoIcons.multiply,
                        color: kPrimaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "New password"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: confirmPasswordCtroller,
                onChanged: (e) {
                  if (e != "") {
                    setState(() {
                      clearButton = true;
                    });
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          confirmPasswordCtroller.clear();
                        });
                      },
                      child: Icon(
                        CupertinoIcons.multiply,
                        color: kPrimaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    labelText: "Confirm password"),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    "Send link",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(60),
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
