import 'package:ecocredit/services/widget_support.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            Image.asset("images/onboard.png"),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              child: Text("Recycle your waste products!",style: AppWidget.headlineTextstyle(32)),
              
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Easily collect household waste and generate less waste",style: AppWidget.normalTextstyle(18.0),),
            ),
            SizedBox(height: 80.0,),
            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(40.0),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width/(1.5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(40.0),
                  ),
                child: Center(
                  child: Text("Get Started",
                    style: AppWidget.whiteTextstyle(24.0),
                  ),
                ),
              ),
            )
          ],
          
        ),
      ),
    );
  }
}
