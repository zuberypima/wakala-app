//Function ya kuchakata sms ya inayo ingia baada ya mteja kuweka pesa

import 'package:flutter/material.dart';
import 'package:wakala/model/addsmsinfo.dart';

class FillterIncomingSMS {
  String takensms = '';
  String newsms = '';
  String? _name, _phone, _amount,_profit,_balance;

//COLLECT NAME
  takeName(String recivedsms) {
    RegExp exp = RegExp(r'([A-Z][A-Z]{3})\w');
    takensms = recivedsms.replaceAll(',', '');
    Iterable<RegExpMatch> matches = exp.allMatches(recivedsms);
    for (final m in matches) {
      print(m[0]);
    }
    phonenumber(takensms);
    AddSmsInfo().receivedsms(
      _phone!,
      _amount!,
      _profit!,
      _balance!,
    );
  }

//COLLECT PHONE NUMBER
  phonenumber(String fornumber) async {
    RegExp exp = RegExp(r'[\d]{12}');
    RegExpMatch? match = exp.firstMatch(fornumber);
    takensms = fornumber.replaceAll('${match![0]}', '');
    print(match[0]);
    _phone = match[0].toString();

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
    _profit= match[0];

    takebalance(takensms);
  }

//COLLECT BALANCE
  takebalance(String foramount) {
    RegExp exp = RegExp(r'[\d]{1,}');
    RegExpMatch? match = exp.firstMatch(foramount);
    takensms = foramount.replaceAll('${match![0]}', '');
    _balance= match[0];
  }
}
