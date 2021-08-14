import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sighn Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35
              ),),
              SizedBox(
                height: 20,
              ),
              buttonItem('assets/google.svg',"Continue with Google",25),
              SizedBox(height: 15,),
              buttonItem('assets/phone.svg',"Continue with Mobile",30),
              SizedBox(height: 15,),
              Text("Or",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),),
              SizedBox(height: 15,),
              textItem("Email ..."),
              SizedBox(height: 15,),
              textItem("Password..."),
              SizedBox(height: 30,),
              colorButton(),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("If you already have an Account? ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18)
                  ),
                  Text("Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                      fontWeight: FontWeight.bold)
                  )
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
  Widget colorButton () {
    return Container(
      width: MediaQuery.of(context).size.width-90,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color(0xfffd746c),
            Color(0xffff9068),
            Color(0xfffd7460)
          ]
        )
      ),
      child: Center(
        child: Text(
          "SignUp", style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
        ),
      ),
    );
  }
  Widget buttonItem(String imagepath, String buttonName, double size){
    return Container(
      width: MediaQuery.of(context).size.width-60,
      height: 60,
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
              width: 1,
              color: Colors.grey
          ),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagepath,
              height: size,
              width: size,),
            SizedBox(
              width: 15,
            ),
            Text(
              buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17
              ),

            )

          ],
        ),
      ),
    );
  }
  Widget textItem(String labelText){
    return Container(
      width: MediaQuery.of(context).size.width-60,
      height: 60,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText, labelStyle: TextStyle(
          fontSize: 17, color: Colors.white
        ),
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey
            ),
          )
        ),
      ),
    );
  }
}
