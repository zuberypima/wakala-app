//TAARIFA ZA MIAMALA KWA UFUPI ZINAZO ONEKANA BAADA YA KUCHAKATA SMS ILIPOKELEWA

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wakala/screens/smsdetails.dart';
import 'package:wakala/widgets/boxtwo.dart';

class SmsInformation extends StatefulWidget {
  @override
  _SmsInformationState createState() => _SmsInformationState();
}

class _SmsInformationState extends State<SmsInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('SMS_DETAILS').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    String id = data['phonenumber'];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SmsDetails(
                                  transactionid: data['transactionId'],
                                
                                )));
                  },
                  child: BoxTwo(
                    phone: data['phonenumber'],
                    amount: data['amount'],
                  )),
            );
          }).toList(),
        );
      },
    );
  }
}
