import 'package:flutter/material.dart';
import 'package:wakala/model/applicationdata/userdata.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            onTap: (){
              UserValidity().checkuser('12345');
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Align(
                child: Container(
                     height: 40,
              width: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(12, 44, 92, 3),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
