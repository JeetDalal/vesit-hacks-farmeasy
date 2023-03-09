
import 'package:farmeasy/reusable.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'blank.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}
List teachersandstudents=
[
];

void getdata()async
{
  final data=await FirebaseFirestore.instance.collection('teachers');
  final user=
  [
    data.snapshots()
  ];
  print('list isssssssssss'+user.toString());
}
class _LoginPageState extends State<LoginPage> {
   String email;
   String password;
   bool hidetext = false;
  bool spinnershow = false;
  final _auth = FirebaseAuth.instance;
  String errormessage = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: spinnershow,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/lock.jpg')),
                      ), //hashimage
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            labelStyle: TextStyle(
                                fontSize: 10.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            hintText: 'Enter Your Email-ID',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  width: 2, color: Color(0x40524f4f)),
                            ),
                            focusedBorder: (OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.lightBlue),
                            )),
                          ),
                        ),
                      ), //emailfield
                      SizedBox(
                        height: 26.0,
                        child: Center(
                            child: Text(
                          errormessage,
                          style: TextStyle(color: Colors.red, fontSize: 12.0),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: hidetext,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              focusColor: Colors.black,
                              onPressed: () {
                                setState(() {
                                  hidetext = !hidetext;
                                });
                              },
                              icon: Icon(hidetext
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            fillColor: Colors.white70,
                            filled: true,
                            labelStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            hintText: 'Enter Your Password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  width: 2, color: Color(0x40524f4f)),
                            ),
                            focusedBorder: (OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.lightBlue),
                            )),
                          ),
                        ),
                      ), //passwordfield
                      SizedBox(
                        height: 30.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/reset');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          getdata();
                          setState(() {
                            errormessage = '';

                            spinnershow = true;
                          });

                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
                              print('widgetName' + email);

                              //Navigator.popUntil(context, ModalRoute.withName('/'));
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Blank();
                              }));
                              // Navigator.pushReplacementNamed(context,'/chats');

                            }
                            errormessage = '';
                          } on FirebaseAuthException catch (error) {
                            errormessage = error.message;
                          }
                          setState(() {
                            spinnershow = false;
                          });
                          // Navigator.of(context).pop();
                        },
                        child: Button('Login', Colors.lightBlue),
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, '/register');
                          },
                          child: Text(
                            'Don\'t have an Account? Click here to register',
                            style: TextStyle(
                                color: Colors.lightBlueAccent, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
