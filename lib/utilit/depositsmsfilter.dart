//Function ya kuchakata sms ya inayo ingia baada ya mteja kuweka pesa

import 'package:flutter/material.dart';
import 'package:wakala/model/addsmsinfo.dart';

class FillterIncomingSMS {
  String takensms = '';
  String newsms = '';
  String? _names, _phone, _amount, _profit, _balance, _transId, _date, _smstype;

  List<String> name = [];
//COLLECT NAME
  takeName(String recivedsms) {
    RegExp exp = RegExp(r'([A-Z][A-Z]{3})\w');
    takensms = recivedsms.replaceAll(',', '');
    Iterable<RegExpMatch> matches = exp.allMatches(recivedsms);
    for (final m in matches) {
      print(m[0]);
      name.add(m[0].toString());
    }
    _names = name[0] + ' ' + name[1];
    phonenumber(takensms);
    AddSmsInfo().receivedsms(
      _names!,
      _phone!,
      _amount!,
      _profit!,
      _balance!,
      _transId!,
      _date!,
      _smstype!,
    );
  }

//COLLECT PHONE NUMBER
  phonenumber(String fornumber) async {
    RegExp exp = RegExp(r'[\d]{12}');
    RegExpMatch? match = exp.firstMatch(fornumber);
    takensms = fornumber.replaceAll('${match![0]}', '');
    print(match[0]);
    _phone = match[0].toString();
    _transId = match[0];
    transId(takensms);
  }

//TRANSACTION ID
  transId(String forid) {
    RegExp exp = RegExp(r'[\d]{11}');
    RegExpMatch? match = exp.firstMatch(forid);
    takensms = forid.replaceAll('${match![0]}', '');
    print(match[0]);

    takeamount(takensms);
  }

//COLLECT AMOUNT
  takeamount(String foramount) {
    RegExp exp = RegExp(r'[\d]{3,}');
    RegExpMatch? match = exp.firstMatch(foramount);
    takensms = foramount.replaceAll('${match![0]}', '');
    _amount = match[0];
    takecammision(takensms);
  }

//COLLECT CAMMISION AMOUNT
  takecammision(String foramount) {
    RegExp exp = RegExp(r'[\d]{2,}');
    RegExpMatch? match = exp.firstMatch(foramount);
    takensms = foramount.replaceAll('${match![0]}', '');
    _profit = match[0];

    takebalance(takensms);
  }

//COLLECT BALANCE
  takebalance(String foramount) {
    RegExp exp = RegExp(r'[\d]{1,}');
    RegExpMatch? match = exp.firstMatch(foramount);
    takensms = foramount.replaceAll('${match![0]}', '');
    _balance = match[0];
    takeDate(takensms);
  }

  takeDate(String fordate) {
    RegExp exp = RegExp(r'[0-9]{1,2}(/|-)[0-9]{1,2}(/|-)[0-9]{2}');
    RegExpMatch? match = exp.firstMatch(fordate);
    takensms = fordate.replaceAll('${match![0]}', '');
    _date = match[0];
    takeSmsType(takensms);
  }

  takeSmsType(String smstype) {
    RegExp exp = RegExp(r'kuweka');
    RegExpMatch? match = exp.firstMatch(smstype);
    takensms = smstype.replaceAll('${match![0]}', '');
    _smstype = match[0];
  }

  String ujumbekuweka =
      '''Zoezi la kuweka fedha kwa FEISAL KHALFAN, 255657281303 limefanikiwa. 
  Kiasi Tsh 3,000. Mrejaa Tsh 56. Salio Jipya ni Tsh 162,081.
   Kumbukumbu No: 44824127299. 22/05/22 22:02. ''';
}
