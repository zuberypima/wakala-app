import 'package:cloud_firestore/cloud_firestore.dart';


class UserDetails{
  CollectionReference register =FirebaseFirestore.instance.collection('Users');
  registerUser(String _jina,String _phone,String _code,String _location,String _password)async{
await register.add({
  'Jina':_jina,
  'Phone':_phone,
  'Code':_code,
  'Location':_location,
  'Password':_password
});
  }
}