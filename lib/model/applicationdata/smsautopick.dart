import 'package:telephony/telephony.dart';
import 'package:wakala/main.dart';
import 'package:wakala/model/addsmsinfo.dart';
import 'package:wakala/utilit/depositsmsfilter.dart';

class AutoPickSms{
  final Telephony telephony = Telephony.instance;

  depositSMS(){
     //function to recive sms
         //  AddSmsInfo().receivedsms();
           telephony.listenIncomingSms(
               onNewMessage: (SmsMessage messagge) {
                 if (messagge.address == "+255718934183") {
                   FillterIncomingSMS().takeName(messagge.body.toString());
                   print('object');
                   //showAlertDialog(context, messagge.body.toString());
                 } else {
               print("Sender is unknwon");
                 }
               },
             //  onBackgroundMessage: backgrounMessageHandler,
               listenInBackground: false
               );
  }
}