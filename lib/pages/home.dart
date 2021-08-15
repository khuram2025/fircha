import 'package:fircha/pages/SignUpPage.dart';
import 'package:fircha/services/Auth_Service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()async{
            await authClass.logout();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=> SignUpPage()), (route) => false);
          }, icon: Icon(Icons.logout))
        ],
      ),

    );
  }
}
