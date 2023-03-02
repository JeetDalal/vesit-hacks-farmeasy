import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../methods/auth_service.dart';
import '../methods/db_service.dart';
import '../methods/helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _user = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Sign Up',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Sign Up to create a new account',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _user,
                  decoration: InputDecoration(
                    // focusedBorder: OutlineInputBorder(),
                    label: Text(
                      'Username',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    labelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    floatingLabelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    // focusedBorder: OutlineInputBorder(),
                    label: Text(
                      'Password',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    labelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    floatingLabelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    // focusedBorder: OutlineInputBorder(),
                    label: Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    labelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    floatingLabelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  obscureText: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    // focusedBorder: OutlineInputBorder(),
                    label: Text(
                      'Confirm Password',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    labelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    floatingLabelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      final password = _password.text;
                      final email = _email.text;
                      final userName = _user.text;
                      await AuthService().registerUser(email, password).then(
                        (value) async {
                          if (value != null) {
                            //save to SF
                            await HelperFunctions()
                                .saveUserLoggedInStatus(true);
                            await DbServices().saveUerData(
                              userName,
                              email,
                            );
                            Navigator.of(context)
                                .pushReplacementNamed('/main-login-screen');
                          } else {
                            showSnackBar(context, value);
                          }
                        },
                      );
                    } on FirebaseAuthException catch (e) {
                      log(e.message.toString());
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showSnackBar(BuildContext context, String errorMessage) {
  return SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      errorMessage,
      style: GoogleFonts.poppins(color: Colors.white),
    ),
  );
}
