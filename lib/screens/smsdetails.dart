import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wakala/widgets/boxtwo.dart';

class SmsDetails extends StatefulWidget {
  String transactionid;
  SmsDetails({Key? key,required this.transactionid}) : super(key: key);

  @override
  State<SmsDetails> createState() => _SmsDetailsState();
}

class _SmsDetailsState extends State<SmsDetails> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('SMS_DETAILS').doc('44824127200').collection('255657281303').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
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
                child: Column(
                  children: [
                    Text(data['Name']),
                    Text(data['phonenumber']),
                    Text(data['Date']),
                    Text(data['amount']),
                    Text(data['transactionId'])
                  ],
                ),
                // BoxTwo(phone: data['phonenumber'],amount: data['amount'],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
