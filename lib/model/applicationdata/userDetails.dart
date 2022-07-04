import 'package:cloud_firestore/cloud_firestore.dart';


class UserDetails{
  CollectionReference register =FirebaseFirestore.instance.collection('Users');

userProfileData(){
  
}

  registerUser(String _jina,String _phone,String _code,String _location,String _password)async{
await register.doc('userId').set({
  'Jina':_jina,
  'Phone':_phone,
  'Code':_code,
  'Location':_location,
  'Password':_password
});
  }
}