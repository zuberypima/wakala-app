
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'package:wakala/model/applicationdata/smsautopick.dart';
import 'package:wakala/screens/loginscreenowner.dart';
import 'package:wakala/screens/firstscreen.dart';
import 'package:wakala/services/notification.dart';
import 'package:wakala/utilit/depositsmsfilter.dart';



backgrounMessageHandler(SmsMessage message) async {
	// Handle background message
	Telephony.backgroundInstance.listenIncomingSms(onNewMessage: (SmsMessage messagge) {
                   if (messagge.address == "+255685387767") {
                    FillterIncomingSMS().takeName(messagge.body.toString());
                 //   showAlertDialog(context, messagge.body.toString());
                 print(message.body.toString());
                 print('sms is listened in back ground');
                  } else {
                    print("Sender is unknwon");
                  }
                },
                onBackgroundMessage: backgrounMessageHandler
              //  listenInBackground: false
                );
}

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AutoPickSms().depositSMS();
   NotificationService().initNotification();

 
  runApp(MyApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}

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

