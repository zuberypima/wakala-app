//Function ya ku aploada data kweny database(firebase) kitendo hichi kinapaswa kufanyika wakat
// Baada ya kuchaka sms ilioingia kutokana na muamala husika


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddSmsInfo {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('');
  CollectionReference smsCollection =
      FirebaseFirestore.instance.collection("SMS_DETAILS");

  receivedsms(String name, String _phone, String _amount, String _profit,
      String _balance, String transId, String _date,String _smstype) async {
    await smsCollection.doc(transId).collection(_phone).add({
      "Name": name,
      "phonenumber": _phone,
      "amount": _amount,
      "profit": _profit,
      "balance": _balance,
      "transactionId": transId,
      "Date": _date,
      "TransactionType":_smstype
    });
  }
}
