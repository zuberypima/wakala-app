import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wakala/widgets/boxcontainer.dart';

class PullData {
  CollectionReference wakalaCollection =
      FirebaseFirestore.instance.collection('Wakala_App');
  Stream<QuerySnapshot> _customers = FirebaseFirestore.instance
      .collection('Wakala_App')
      .doc('User_id')
      .collection('SMS_Details')
      .snapshots();
  cashAmount() {
    return FutureBuilder<DocumentSnapshot>(
      future: wakalaCollection
          .doc('User_id')
          .collection('SMS_Details')
          .doc('Float')
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('data');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Boxone(
              Colors.orange, '${data['Balance']}', '50%', 'Tsh:350,000');
        }
        return Boxone(Colors.orange, 'Balance', '50%', 'Tsh:350,000');
      },
    );
  }

  floatAmount() {
    return FutureBuilder<DocumentSnapshot>(
      future: wakalaCollection
          .doc('User_id')
          .collection('Float_Balance')
          .doc('Float')
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('data');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Boxone(
            Colors.orange,
            'Float',
            '',
            'Tsh: ${data['Balance']}',
          );
        }
        return Boxone(
          Colors.orange,
          'Float',
          '',
          'Balance',
        );
      },
    );
  }

//Cammision
  camisionAmount() {
    return FutureBuilder<DocumentSnapshot>(
      future: wakalaCollection
          .doc('User_id')
          .collection('Cammision_Value')
          .doc('Profit')
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('data');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Boxone(
            Color.fromRGBO(12, 44, 92, 3),
            'Camission',
            '',
            'Tsh: ${data['Amount']}',
          );
        }
        return Boxone(Color.fromRGBO(12, 44, 92, 3), 'Camision', '', '');
      },
    );
  }

  

  numberoftraans() async {
    await StreamBuilder(
      stream: _customers,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {}
        if (snapshot.connectionState == ConnectionState.done) {
          return Text('Loading');
        }
        return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
            
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          return Text('${data.length.toString()}');
        }).toList());
      },
    );
  }
}
