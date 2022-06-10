import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wakala/widgets/boxcontainer.dart';
import 'package:wakala/widgets/boxtwo.dart';

class Transactiondata{
 final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('SMS_DETAILS').snapshots();
 DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
floatamount()async{
  await ref.set({
  "name": "John",
  "age": 18,
 
});
}
withdrawtransaction(){

}
}