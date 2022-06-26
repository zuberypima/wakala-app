// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';


// class CustomerDetailsPage extends StatefulWidget {
//   const CustomerDetailsPage({ Key? key }) : super(key: key);

//   @override
//   State<CustomerDetailsPage> createState() => _CustomerDetailsPageState();
// }

// class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
//    Stream<QuerySnapshot> _customers = FirebaseFirestore.instance
//       .collection('Wakala_App')
//       .doc('User_id')
//       .collection('Customers_Details')
//       .snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: StreamBuilder(
//         stream: _customers,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {}
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Text('Loading');
//           }
//           return ListView(
//               children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//             return Text('data');
//           }).toList());
//         },
//       ),
//     );
//   }
// }