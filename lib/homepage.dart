// import 'package:flutter/material.dart';
// import 'package:telephony/telephony.dart';

// class HomePages extends StatefulWidget {
//   const HomePages({Key? key}) : super(key: key);

//   @override
//   State<HomePages> createState() => _HomePagesState();
// }
// class _HomePagesState extends State<HomePages> {
//   final Telephony telephony = Telephony.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Container(
//             //     child: ElevatedButton(
//             //         onPressed: () {
//             //           telephony.sendSms(
//             //               to: "+255774203186", message: "May is displayed");
//             //         },
//             //         child: Text('Send text'))),
//             Container(
//                 child: ElevatedButton(
//                     onPressed: () {
//                       telephony.listenIncomingSms(
//                           onNewMessage: (SmsMessage messagge) {
//                             if (messagge.address == "+2556853867") {
//                               //Send sms to database
//                               //SMS manipulations
//                               print(messagge.body);
//                             }
//                             else{
//                               print("Sender is unknwon");
//                             }
//                           },
//                           listenInBackground: false);
//                     },
//                     child: Text('Press me'),
//                     ),
//                     ),
//           ],
//         ),
//       ),
//     );
//   }
// }
