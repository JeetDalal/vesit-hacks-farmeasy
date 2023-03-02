import 'package:farmeasy/screens/Farmer%20Screens/main_farmer_screen.dart';
import 'package:farmeasy/screens/login_screen.dart';
import 'package:farmeasy/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'methods/helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    getUserLoggedInStatus();
    super.initState();
  }

  bool loginSatus = false;

  getUserLoggedInStatus() async {
    await HelperFunctions().getIfUserLoggedIn().then((value) {
      if (value != null) {
        //Either true or false
        // if (value) {
        //   return true;
        // } else {
        //   return false;
        // }
        setState(() {
          loginSatus = value;
        });
      } else {
        //show Login Screen
        return false;
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: loginSatus ? const MainFarmerScreen() : const MainLoginScreen(),
        routes: {
          'register-screen': (context) => const RegisterScreen(),
          '/farmer-screen': (context) => const MainFarmerScreen(),
        });
  }
}
