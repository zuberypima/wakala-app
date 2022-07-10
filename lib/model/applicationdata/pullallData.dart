import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wakala/services/notification.dart';
import 'package:wakala/widgets/boxcontainer.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class PullData {
  CollectionReference wakalaCollection =
      FirebaseFirestore.instance.collection('Wakala_App');
  CollectionReference _smsCollection =
      FirebaseFirestore.instance.collection('SMS_DETAILS');

  //Float
  CollectionReference _floatCollection =
      FirebaseFirestore.instance.collection('Float_Balance');

  //Cash
  CollectionReference _cashCollection =
      FirebaseFirestore.instance.collection('CashData');
//Cammision
  CollectionReference _cammisionCollection =
      FirebaseFirestore.instance.collection('Cammision');
  Stream<QuerySnapshot> _customers = FirebaseFirestore.instance
      .collection('Wakala_App')
      .doc('User_id')
      .collection('SMS_Details')
      .snapshots();

  //new
  Stream<QuerySnapshot> _smsDetail =
      FirebaseFirestore.instance.collection('SMS_Details').snapshots();
  cashAmount() {
    return FutureBuilder<DocumentSnapshot>(
      future: _cashCollection.doc('Cash').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('data');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          
          return Boxone(Colors.blue, 'Balance', '', 'Tsh:${data['Amount']}');
        }
        return Boxone(Colors.blue, 'Balance', '', '');
      },
    );
  }

  //Function to pick float amount
  floatAmount() {
    return FutureBuilder<DocumentSnapshot>(
      future: _floatCollection.doc('Float').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('data');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
              double compdata = double.parse(data['Balance']);
          if (compdata <= 50000.0) {
            tz.initializeTimeZones();
            NotificationService().showNotification(
                1, 'Float is low', 'Tafadhali  ongeza float yako', 2);
          }
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
      future: _cammisionCollection.doc('Profit').get(),
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
