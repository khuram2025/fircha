import 'package:fircha/pages/PhoneAuthPage.dart';
import 'package:fircha/pages/SignInPage.dart';
import 'package:fircha/pages/SignUpPage.dart';
import 'package:fircha/pages/home.dart';
import 'package:fircha/services/Auth_Service.dart';
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
  Widget currentPage = PhoneAuthPage();
  AuthClass authClass = AuthClass();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void checkLogin() async

  {
  String token = await authClass.getToken();
  if(token!=null){
    setState(() {
      currentPage = HomePage();
    });
  }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: currentPage,
    );
  }
}
