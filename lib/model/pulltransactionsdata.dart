import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class PullTransactionReport{
      DatabaseReference ref = FirebaseDatabase.instance.ref("TransactionDetails/Float");

String cammison='';
  Future<String> cammisionvalue() async {
 DatabaseEvent event = await ref.once();
 cammison= event.snapshot.value.toString();
// Print the data of the snapshot
//print(event.snapshot.value); // { "name": "John" }
print(cammison);
return cammison;
  }
}