//Page for general report

import 'package:flutter/material.dart';
import 'package:wakala/model/transactionpushdata.dart';
import 'package:wakala/widgets/boxcontainer.dart';

class GeneralReport extends StatelessWidget {
   GeneralReport({Key? key}) : super(key: key);
String _float =Transactiondata().floatamountRead();
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
                Boxone(Color.fromRGBO(12, 44, 92, 3), 'Camision','',_float),
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
