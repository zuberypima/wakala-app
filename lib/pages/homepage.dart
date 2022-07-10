// THIS IS HOME PAGE

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:wakala/pages/generalreport.dart';
import 'package:wakala/pages/profilepage.dart';
import 'package:wakala/pages/screenhome.dart';
import 'package:wakala/services/notification.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlutterLocalNotificationsPlugin fltrNotification;

  int _selectIndex = 0;
  final _selectPage = [
    HomeScreen(),
    GeneralReport(),
    ProfilePage(),
  ];
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _selectPage[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectIndex,
          onTap: (int index) {
            setState(() {
              _selectIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Report'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {},
          child: Icon(Icons.phone)),
    ));
  }

//  Future<String?>? notificationSelected(String payload)async{
// return '';
//  }
}
