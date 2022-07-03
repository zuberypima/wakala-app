import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(12, 44, 92, 3),
            elevation: 0,
            title: Center(child: Text('SMART WAKALA')),
            bottom: TabBar(
              indicatorWeight: 0,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.only(top: 10),
                unselectedLabelColor: Colors.green,
                unselectedLabelStyle: TextStyle(fontSize: 20),
                indicator: ShapeDecoration(
                
                  shape: RoundedRectangleBorder(
                    
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.green,
                
                ),
                tabs: [
                  Tab(
                      child: Container(
                      
                          width: 100, child: Center(child: Text('Day')))),
                  Tab(
                    child: Container(
                    
                      width: 100,
                      child: Center(child: Text('Month'))),
                  )
                ]),
          ),
          body: TabBarView(children: [
            Center(child: Text('   data   ')),
            Center(child: Text('   data   '))
          ])),
    );
  }
}
