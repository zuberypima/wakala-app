
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wakala/pages/homepage.dart';

class UserValidity {
  checkuser (String uid){
    FirebaseFirestore.instance
    .collection('Users').where('Code',isEqualTo: uid)
    .get()
    .then((QuerySnapshot snapshots) {
      if(snapshots.docs.isNotEmpty){
        //Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
      }
      if(snapshots.docs.isEmpty){
        print('Hayupo');
      }
    }
    );
  }
}