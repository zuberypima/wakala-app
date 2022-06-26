//Page for general report

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wakala/model/applicationdata/pullallData.dart';
import 'package:wakala/model/pulltransactionsdata.dart';
import 'package:wakala/model/reportdata.dart';
import 'package:wakala/model/reportdetails/report.dart';
import 'package:wakala/model/transactionpushdata.dart';
import 'package:wakala/screens/customerdetails.dart';
import 'package:wakala/widgets/boxcontainer.dart';

class GeneralReport extends StatefulWidget {
   GeneralReport({Key? key}) : super(key: key);

  @override
  State<GeneralReport> createState() => _GeneralReportState();
}

class _GeneralReportState extends State<GeneralReport> {
 
 String? float;
  String? floatvalue;
 DatabaseReference floatref =FirebaseDatabase.instance.ref("TransactionDetails/Float");
//  final reportData = reportDataFromJson('');
 String? floatamountRead(  ) {
  
  Stream<DatabaseEvent> floatstream = floatref.onValue;
  
    floatstream.listen((DatabaseEvent  event) {
      floatvalue =event.snapshot.value.toString();
    });
 return floatvalue;
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
PullData().camisionAmount(),
                Boxone(Colors.cyanAccent, 'Transactions','','99'),
              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Boxone(Colors.orange, 'Report','',''),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerDetailsPage()));
                  },
                  child: Boxone( Colors.blueGrey, 'Customers Details','','')),
              ],
          ),
           ),
          // PullData().numberoftraans(),
ElevatedButton(onPressed: (){
  floatamountRead();
}, child: Text('test'))
          ],
          
      ),
    );
  }
}
