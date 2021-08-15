import 'package:fircha/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class SignInPage extends StatefulWidget {

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool circular = false;

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
              Text("Sign In",
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
              textItem("Email ...", _emailController, false),
              SizedBox(height: 15,),
              textItem("Password...", _pwdController, true),
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
              ),
              SizedBox(height: 17,),
              Text("Forget Password?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)
              )


            ],
          ),
        ),
      ),
    );
  }
  Widget colorButton () {
    return InkWell(
      onTap: ()async{
        try{
          firebase_auth.UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: _emailController.text, password: _pwdController.text);
          print(userCredential.user.email);
          setState(() {
            circular = false;
          });
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=> HomePage()), (route) => false);
        }catch(e){
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            circular = false;
          });
        }
      },
      child: Container(
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
          child: circular?CircularProgressIndicator():
          Text(
            "Sign In", style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
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
  Widget textItem(String labelText, TextEditingController controller, bool obscureText){
    return Container(
      width: MediaQuery.of(context).size.width-60,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
            fontSize: 17,
            color: Colors.white
        ),
        decoration: InputDecoration(
            labelText: labelText, labelStyle: TextStyle(
            fontSize: 17, color: Colors.white
        ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  width: 1.5,
                  color: Colors.amber
              ),
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
