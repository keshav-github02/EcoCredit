import 'package:ecocredit/services/auth.dart';
import 'package:ecocredit/services/widget_support.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "images/login.png",
                height: 300,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.0),
            Image.asset(
              "images/recycle1.png",
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.0),
            Text(
              "Reduce. Reuse. Recycle.",
              style: AppWidget.headlineTextstyle(25.0),
            ),
            Text("Repeat!", style: AppWidget.greenTextstyle(32.0)),
            SizedBox(height: 50.0),
            Text(
              "Every item you recycle\n makes a difference",
              textAlign: TextAlign.center,
              style: AppWidget.normalTextstyle(20.0),
            ),
            Text("Get Started!", style: AppWidget.greenTextstyle(24.0)),
            SizedBox(height: 30.0),
            GestureDetector(
              onTap: (){
                AuthMethods().signInWithGoogle(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.0,right: 20.0),
                child: Material(
                  elevation: 4.5,
                    borderRadius: BorderRadius.circular(33),
              
                  child: Container(
                    padding: EdgeInsets.only(left: 20.0),
              
                    height: 80,
                    decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(33)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Image.asset(
                            "images/google.png",
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
              
                        ),
                        SizedBox(width: 20.0,),
              
                        Text("Sign in With Google",style: AppWidget.whiteTextstyle(25.0),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
