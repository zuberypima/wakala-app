// PAGE PAGE FOR RECIVING TEST RECIVING SMS

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'package:wakala/main.dart';
import 'package:wakala/model/addsmsinfo.dart';
import 'package:wakala/utilit/depositsmsfilter.dart';

class SmsTestPage extends StatelessWidget {
  SmsTestPage({Key? key}) : super(key: key);
  final Telephony telephony = Telephony.instance;
  // DatabaseReference ref = FirebaseDatabase.instance.ref();
  // CollectionReference smsCollection =
  //     FirebaseFirestore.instance.collection('students');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
              FillterIncomingSMS().takeName(ujumbekuweka);
            //takeSms();
            //function to recive sms
           // AddSmsInfo().receivedsms();
         //   telephony.listenIncomingSms(
          //      onNewMessage: (SmsMessage messagge) {
               //   if (messagge.address == "+255685387767") {
                 //   FillterIncomingSMS().takeName(messagge.body.toString());
                 //   showAlertDialog(context, messagge.body.toString());
               //   } else {
            //    print("Sender is unknwon");
             //     }
           //     },
              //  onBackgroundMessage: backgrounMessageHandler
             //   listenInBackground: false
             //   );
          },
          child: Text('Test SMS'),
        ),
      ),
    );
  }
//sms

   String ujumbekuweka ='''Zoezi la kuweka fedha kwa BRITON KHALFAN, 255717281303 limefanikiwa. 
  Kiasi Tsh 3,000. Mrejaa Tsh 56. Salio Jipya ni Tsh 162,081.
   Kumbukumbu No: 44824127199. 22/05/22 22:02. ''';

  //Alert Dialog to display sms after recieving
  showAlertDialog(BuildContext context, String sms) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Recievd SMS"),
      content: Text(sms),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


 }
