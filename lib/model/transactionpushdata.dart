import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wakala/widgets/boxcontainer.dart';
import 'package:wakala/widgets/boxtwo.dart';

class Transactiondata {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('SMS_DETAILS').snapshots();
  DatabaseReference floatref =
      FirebaseDatabase.instance.ref("TransactionDetails/Float");
  DatabaseReference cashref =
      FirebaseDatabase.instance.ref("TransactionDetails/Cash");
  DatabaseReference camref =
      FirebaseDatabase.instance.ref("TransactionDetails/Cammision");
  String float = '';

//Strams
  floatamount(String floatvalue) async {
    await floatref.set({
      "Amount": floatvalue,
    });
  }

  cashomount(String transnumber) async {
    await cashref.set({
      "Amount": transnumber,
    });
  }

  camisionamount(String camamount) async {
    await camref.update({
      "Amount": camamount,
    });
  }

  String floatamountRead() {
    Stream<DatabaseEvent> floatstream = floatref.onValue;

    floatstream.listen((event) {
      //floatvalue =event.snapshot.value.toString();
      float = event.snapshot.value.toString();
      print(float);
    });
  return float.toString();
  }
}
