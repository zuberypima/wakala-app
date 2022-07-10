//Function ya ku aploada data kweny database(firebase) kitendo hichi kinapaswa kufanyika wakat
// Baada ya kuchaka sms ilioingia kutokana na muamala husika

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddSmsInfo {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('');
  //SMS Colllection
  CollectionReference smsCollection =
      FirebaseFirestore.instance.collection("SMS_DETAILS");

  CollectionReference cammisionCollection =
      FirebaseFirestore.instance.collection("Cammision");
  CollectionReference floatCollection =
      FirebaseFirestore.instance.collection("Float_Balance");
  CollectionReference wakalacollection =
      FirebaseFirestore.instance.collection('Wakala_App');
  receivedsms(String name, String _phone, String _amount, String _profit,
      String _balance, String transId, String _date, String _smstype) async {
    // await wakalacollection.doc('User_id').collection('SMS_Details').doc(transId).collection(_phone)
    await smsCollection.add({
      "Name": name,
      "phonenumber": _phone,
      "amount": _amount,
      "profit": _profit,
      "transactionId": transId,
      "Date": _date,
      "TransactionType": _smstype
    }).then((value) {
      cammisionvalue(_profit);
    }).then((value) {
      floatBalance(_balance);
    }).then((value) {
      customerDetails(name, _phone);
    });
  }

  cammisionvalue(String cammision) async {
    double realvalue;
    FirebaseFirestore.instance
        .collection('Cammision')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        print(doc["Amount"]);
        
        var num1 =doc["Amount"];
        print(num1);
        var num2 =double.parse(cammision);
         print(num2);
        var accepterd =num1+num2;
        print(accepterd);
        await cammisionCollection.doc('Profit').set({'Amount': accepterd});
       // await cammisionCollection.doc('Profit').update({'Amount':realvalue});
      });
    });
  }

  floatBalance(String balance) async {
    await floatCollection.doc('Float').set({
      'Balance': balance,
    });
  }

  customerDetails(String customerName, String phonenumber) async {
    await wakalacollection
        .doc('User_id')
        .collection('Customers_Details')
        .add({'Name': customerName, 'Phone': phonenumber});
  }
}
