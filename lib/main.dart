import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  void signup() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: 'devstack1@gmail.com', password: "123456");

    } catch (e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("FireBase"),
        ),
        body:Center(
          child: ElevatedButton(
            onPressed: (){signup();}, child: Text("SignUp"),
          ),
        ),
      ),
    );
  }
}
