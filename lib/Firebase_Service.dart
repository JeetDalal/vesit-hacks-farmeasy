import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
CollectionReference teacherRef=FirebaseFirestore.instance.collection('teacher');
CollectionReference studentRef=FirebaseFirestore.instance.collection('students');

void createuser()async
{

  final loggeduser= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
}

//leaderboard

name=(firebase.collection('students')['name']);
score(firebase.collection('students')['score']);
Text(name);




