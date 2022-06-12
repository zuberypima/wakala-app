import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wakala/widgets/boxtwo.dart';


class CustomerDetailsPage extends StatefulWidget {
  const CustomerDetailsPage({ Key? key }) : super(key: key);

  @override
  State<CustomerDetailsPage> createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('SMS_DETAILS').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Customers'),),
      body: ListView(
        children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: TextFormField(),),
          ),
          Container (
        height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
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
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BoxTwo(phone: data['Name'],amount: data['phonenumber'],),
                      );
                }).toList(),
              );
            },
          ),
        ),]
      ),
    );
  }
}