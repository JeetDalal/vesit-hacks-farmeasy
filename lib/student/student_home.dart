import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentHome extends StatefulWidget {
  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Center(
                  child: Text('Leaderboard'),
                ),
                ListTile(
                  trailing: Image.asset('assets/cake.jpg'),
                ),
                ListTile(
                  trailing: Image.asset('assets/cake.jpg'),
                ),
                SizedBox(
                  child: Text(
                    'Games',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

buildleaderboard() {
  return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('students').snapshots(),


  );
}
