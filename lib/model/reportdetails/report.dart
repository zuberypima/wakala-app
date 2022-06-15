import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wakala/model/reportdata.dart';

class ReportDetails {
  String? float;
  String? floatvalue;
    String? transvalue;
String? data;
  DatabaseReference floatref=
      FirebaseDatabase.instance.ref("TransactionDetails/Float");
  final reportData = reportDataFromJson('');



  Future<String?> floatamountRead()async {
    Stream<DatabaseEvent> floatstream = floatref.onValue;

   await floatstream.listen((DatabaseEvent event) {
      floatvalue = event.snapshot.value.toString();
    });
    return floatvalue;
  }
//Number of transactions
   Future<String?> numberofTransactions()async {
    Stream<DatabaseEvent> transstream = floatref.onValue;

   await transstream.listen((DatabaseEvent event) {
      transvalue = event.snapshot.value.toString();
    });
    return floatvalue;
  }
  //Read Float Data
Future<String?>floatDetails()async{
  floatref.onValue.listen((DatabaseEvent event) { 
    final floatdata =event.snapshot.value;
    
  });
  return data.toString();
}
}
