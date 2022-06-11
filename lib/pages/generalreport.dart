//Page for general report

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wakala/model/transactionpushdata.dart';
import 'package:wakala/widgets/boxcontainer.dart';

class GeneralReport extends StatefulWidget {
   GeneralReport({Key? key}) : super(key: key);

  @override
  State<GeneralReport> createState() => _GeneralReportState();
}

class _GeneralReportState extends State<GeneralReport> {
   String? _float ;
  String? _floatvalue;
 DatabaseReference floatref =FirebaseDatabase.instance.ref("TransactionDetails/Float");
  floatamountRead() {
   Stream<DatabaseEvent> floatstream = floatref.onValue;

    floatstream.listen((event) {
      _floatvalue =event.snapshot.value.toString();
     // _float = event.snapshot.value.toString();
   _float =_floatvalue;
                 //    Boxone( Colors.blueGrey, 'Customers Details','',floatvalue);
      print(_float);
    }).onData((data) { });
  return _float.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 44, 92, 3),
        title: Center(child: Text('SMART WAKALA')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Boxone(Color.fromRGBO(12, 44, 92, 3), 'Camision','',floatamountRead()),
                Boxone(Colors.cyanAccent, 'Transactions','','66'),
              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Boxone(Colors.orange, 'Report','',''),
                Boxone( Colors.blueGrey, 'Customers Details','',''),
              ],
          ),
           ),

          ],
          
      ),
    );
  }
}
