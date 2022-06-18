import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FloatData{


 floatvalue()async{
   await FirebaseFirestore.instance
    .collection('Wakala_App')
    .doc('User_id').collection('FloatData').doc('Float')
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
      String datas=  documentSnapshot.get(FieldPath(['Amount']));
      print(datas);
        
      }
      return documentSnapshot.data();
    });
  }
}