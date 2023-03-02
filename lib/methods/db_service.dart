import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DbServices {
  CollectionReference ref = FirebaseFirestore.instance.collection('farmers');
  CollectionReference availableTrucks =
      FirebaseFirestore.instance.collection('Trucks');

  //Save UserData
  saveUerData(String userName, String email) async {
    await ref.add({
      'name': userName,
      'email': email,
    }).then((value) => log("Saved User Successfully!"));
  }
}
