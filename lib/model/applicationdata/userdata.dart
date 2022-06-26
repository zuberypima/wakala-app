import 'package:cloud_firestore/cloud_firestore.dart';

class UserValidity{
  checkuser (String uid){
    FirebaseFirestore.instance
    .collection('Users').where('Code',isEqualTo: uid)
    .get()
    .then((QuerySnapshot snapshots) {
      if(snapshots.docs.isNotEmpty){
        print('Yupo');
      }
      if(snapshots.docs.isEmpty){
        print('Hayupo');
      }
    }
    );
  }
}