import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final Stream<QuerySnapshot> _reportstream =
      FirebaseFirestore.instance.collection('SMS_DETAILS').snapshots();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white70,
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
                        width: 100, child: Center(child: Text('Month'))),
                  )
                ]),
          ),
          body: Column(
            children: [
              Container(
                height: 30,
                decoration: BoxDecoration(color: Colors.orange),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Phone Number',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Amount',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Profit',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.orange[400],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _reportstream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot documents) {
                      Map<String, dynamic> data =
                          documents.data()! as Map<String, dynamic>;
                      return  Padding(
                padding: const EdgeInsets.only(left: 5, right: 5,top: 5),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 30,
                  child: TabBarView(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${data['phonenumber']}',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${data['amount']}',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${data['profit']}',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${data['phonenumber']}',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                                                    '${data['amount']}',

                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                         '${data['profit']}',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ]),
                ),
              );
                    }).toList());
                  },
                ),
              ),
             
            ],
          )),
    );
  }
}
