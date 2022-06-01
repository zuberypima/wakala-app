// THIS IS HOME SCREEN FOR DISPLAY HOME PAGE CONTENT

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wakala/model/smsdata.dart';
import 'package:wakala/widgets/boxcontainer.dart';
import 'package:wakala/widgets/boxtwo.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({ Key? key }) : super(key: key);
Stream collectionStream = FirebaseFirestore.instance.collection('SMS_DETAILS').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.37,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(12, 44, 92, 3),
                        ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: Column(
                      children: [
                        Text(
                          "Total Capital",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Tsh: 700,000",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(bottom: 20, left: 20, child: Boxone(Colors.orange,'Float','50%','Tsh:350,000')),
              Positioned(bottom: 20, right: 20, child: Boxone(Colors.blue,'Cash','50%','Tsh:350,000',)),
            ],
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height *0.49,
            child:SmsInformation(),
          ),
        ],
      ),);
  }
}