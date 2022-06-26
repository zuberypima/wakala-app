//Function ya ku aploada data kweny database(firebase) kitendo hichi kinapaswa kufanyika wakat
// Baada ya kuchaka sms ilioingia kutokana na muamala husika


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddSmsInfo {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('');
  CollectionReference smsCollection =
      FirebaseFirestore.instance.collection("SMS_DETAILS");
CollectionReference wakalacollection =FirebaseFirestore.instance.collection('Wakala_App');
  receivedsms(String name, String _phone, String _amount, String _profit,
      String _balance, String transId, String _date,String _smstype) async {
    await wakalacollection.doc('User_id').collection('SMS_Details').doc(transId).collection(_phone).add({
      "Name": name,
      "phonenumber": _phone,
      "amount": _amount,
      "profit": _profit,
      "balance": _balance,
      "transactionId": transId,
      "Date": _date,
      "TransactionType":_smstype
    }).then((value) {
      cammisionvalue(_profit);
    }).then((value) {floatBalance(_balance);}).then((value) {customerDetails(name, _phone);});
 // await  cammisionvalue(_profit);
  }

  cammisionvalue(String cammision)async{
await wakalacollection.doc('User_id').collection('Cammision_Value').doc('Profit').set({
'Amount':cammision
});
  }
  floatBalance(String balance)async{
    await wakalacollection.doc('User_id').collection('Float_Balance').doc('Float').set({
      'Balance':balance,
    });
  }
  customerDetails(String customerName,String phonenumber)async{
await  wakalacollection.doc('User_id').collection('Customers_Details').add({
  'Name':customerName,
  'Phone':phonenumber
});
  }
}
