import 'package:ecocredit/pages/home.dart';
import 'package:ecocredit/services/database.dart';
import 'package:ecocredit/services/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
    await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );

    UserCredential result =
    await firebaseAuth.signInWithCredential(credential);

    User? userDetails = result.user;
    await SharedPreferenceHelper().saveUserEmail(userDetails!.email!);
    await SharedPreferenceHelper().saveUserId(userDetails.uid);
    await SharedPreferenceHelper().saveUserImage(userDetails.photoURL!);
    await SharedPreferenceHelper().saveUserName(userDetails.displayName!);

    

    if (result != null) {
      Map<String,dynamic> userInfoMap={
        "email":userDetails!.email,
        "name": userDetails.displayName,
        "image": userDetails.photoURL,
        "Id": userDetails.uid,
      };
      await DatabaseMethods().addUserInfo(userInfoMap, userDetails.uid);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    }
    else{
      print("error!");
    }





  }
}
