import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FloatData{

String? float;
Future<String> floatvalue()async{
   await FirebaseFirestore.instance
    .collection('Wakala_App')
    .doc('User_id').collection('FloatData').doc('Float')
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
      String float=  documentSnapshot.get('Amount');
      setState(){
      //float =datas;
      }
     // print(datas);
      print('object');
     // print(float);

     // return datas;
      }
    });
    print(float);
   return   float.toString();

  }


  // floatValue()async{
  //   FirebaseFirestore.instance
  //   .collection('users').doc()
  //   .get()
  //   .then((QuerySnapshot querySnapshot) {
  //       querySnapshot.docs.forEach((doc) {
  //           print(doc["first_name"]);
  //       });
  //   })
 // }
}