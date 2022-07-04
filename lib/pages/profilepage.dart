import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(12, 44, 92, 3),
        title: Center(child: Text('SMART WAKALA')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)),
              child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  child: Row(
                    children: [
                      Text('Name:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                       Text('Juma Shabani',style: TextStyle(fontSize: 18),),
                    ],
                  ),
                ),
                Divider(color:  Color.fromRGBO(12, 44, 92, 3),),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  child: Row(
                    children: [
                      Text('Phone:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                       Text('+25578906589',style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  
                ),
                Divider(color:  Color.fromRGBO(12, 44, 92, 3),),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  child: Row(
                    children: [
                      Text('Code:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                       Text('1000',style: TextStyle(fontSize: 18),),
                    ],
                  ),
                ),
                Divider(color:  Color.fromRGBO(12, 44, 92, 3),)
              ],),
            ),
          )
        ],
      ),
    );
  }
}
