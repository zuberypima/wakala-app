import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wakala/widgets/boxtwo.dart';

class SmsDetails extends StatefulWidget {
  //String phone;
  String transactionid;
  SmsDetails({
    Key? key,
    required this.transactionid,
  }) : super(key: key);

  @override
  State<SmsDetails> createState() => _SmsDetailsState();
}

class _SmsDetailsState extends State<SmsDetails> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('SMS_DETAILS')
      // ignore: unnecessary_brace_in_string_interps
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(12, 44, 92, 3),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('SMS_DETAILS')
            .where('transactionId', isEqualTo: widget.transactionid)
            .snapshots(),
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
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Container(
                  height: MediaQuery.of(context).size.width / 2.2,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.blueGrey,),borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Customer name:  ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              data['Name'],
                              style: TextStyle(
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                             Text(
                              'Phone No:  ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(data['phonenumber']),
                          ],
                        ),
                        Row(
                          children: [
                             Text(
                              'Amount:  ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(data['amount']),
                          ],
                        ),
                        Row(
                          children: [
                             Text(
                              'Transaction Id:  ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(data['transactionId']),
                          ],
                        ),
                        Row(
                          children: [
                             Text(
                              'Date:  ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(data['Date']),
                          ],
                        ),
                      ],
                    ),
                  ),
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
