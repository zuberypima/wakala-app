import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddSmsInfo {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('');
  CollectionReference smsCollection =
      FirebaseFirestore.instance.collection("SMS_DETAILS");
 
  
  receivedsms( String _name,String _amount,String _profit,String _balance) async {
    await smsCollection.add({
      "phonenumber": _name,
      "amount": _amount,
      //"phonenumber":_phonenumber,
      "profit":_profit,
      "balance":_balance,
    });
  }
}
