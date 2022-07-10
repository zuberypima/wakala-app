import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wakala/model/applicationdata/uservalidity.dart';
import 'package:wakala/pages/homepage.dart';
import 'package:wakala/screens/registrationform.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  'Phone No:',
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
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 20,top: 10),
            child: Row(
              
              children: [
                SizedBox(width: 40,),
                Text(
                  '"Hapana Sina akaunti"',
                  style: TextStyle(color: Colors.black38, fontSize: 15),
                ),
                SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationForm()));
                  },
                  child: Text('Jisajili',style: TextStyle(color: Colors.blue,fontSize: 18),))
              ],
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
        .where('Phone', isEqualTo: uid)
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
