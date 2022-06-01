import 'package:flutter/material.dart';

class FillterIncomingSMS {
  String takensms = '';
  String newsms = '';

//COLLECT NAME
  takeName(String recivedsms) {
    RegExp exp = RegExp(r'([A-Z][A-Z]{3})\w');
    takensms = recivedsms.replaceAll(',', '');
    Iterable<RegExpMatch> matches = exp.allMatches(recivedsms);
    for (final m in matches) {
      //print(m[0]);
      print(m[0]);
    }
    phonenumber(takensms);
  }
//COLLECT PHONE NUMBER
  phonenumber(String fornumber) async {
    RegExp exp = RegExp(r'[\d]{12}');
    RegExpMatch? match = exp.firstMatch(fornumber);
    takensms = fornumber.replaceAll('${match![0]}', '');
    print(match[0]);

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
    print(match[0]);
   takecammision(takensms);
  }

//COLLECT CAMMISION AMOUNT
  takecammision(String foramount) {
    RegExp exp = RegExp(r'[\d]{2,}');
    RegExpMatch? match = exp.firstMatch(foramount);
    takensms = foramount.replaceAll('${match![0]}', '');
    print(match[0]);
    
    takebalance(takensms);
  }

//COLLECT BALANCE
   takebalance(String foramount) {
    RegExp exp = RegExp(r'[\d]{1,}');
    RegExpMatch? match = exp.firstMatch(foramount);
    takensms = foramount.replaceAll('${match![0]}', '');
    print(match[0]);
  
  }
}
