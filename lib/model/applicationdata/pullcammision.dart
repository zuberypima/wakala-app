import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wakala/widgets/boxcontainer.dart';

class PullData {
  CollectionReference wakalaCollection = FirebaseFirestore.instance.collection('Wakala_App');

  cammisonAmount() {
return FutureBuilder<DocumentSnapshot>(
  future: wakalaCollection.doc('User_id').collection('Float_Balance').doc('Float').get(),
  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.hasError){
      return Text('data');
    }
  if (snapshot.connectionState ==ConnectionState.done){
    Map<String,dynamic> data=snapshot.data!.data() as Map<String,dynamic>;
    return  Boxone(Colors.orange,'${data['Balance']}','50%','Tsh:350,000');
  }
  return  Boxone(Colors.orange,'Balance','50%','Tsh:350,000');
  },
);
  }
}
