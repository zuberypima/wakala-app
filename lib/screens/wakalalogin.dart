import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wakala/model/applicationdata/uservalidity.dart';
import 'package:wakala/pages/homepage.dart';
import 'package:wakala/screens/registrationform.dart';

class WakalaLoginPage extends StatefulWidget {
  const WakalaLoginPage({Key? key}) : super(key: key);

  @override
  State<WakalaLoginPage> createState() => _WakalaLoginPageState();
}

class _WakalaLoginPageState extends State<WakalaLoginPage> {
  String code = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(12, 44, 92, 3),
        title: Center(child: Text('SMART WAKALA')),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wakala Code',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onChanged: ((value) {
                    code = value;
                  }),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onChanged: ((value) {
                    password = value;
                  }),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              checkuser(code, password);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Align(
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(12, 44, 92, 3),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  )),
                ),
              ),
            ),
          ),
          Divider()
        ],
      ),
    ));
  }

  checkuser(String uid, String _password) {
    FirebaseFirestore.instance
        .collection('Users')
        .where('Code', isEqualTo: uid)
        .where('Password', isEqualTo: _password)
        .get()
        .then((QuerySnapshot snapshots) {
      if (snapshots.docs.isNotEmpty) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
      }
      if (snapshots.docs.isEmpty) {
        print('Hayupo');
      }
    });
  }
}
