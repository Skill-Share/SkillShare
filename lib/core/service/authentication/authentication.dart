import 'package:SkillShare/Views/login_view.dart';
import 'package:SkillShare/Views/register_view.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignin = true;
  void toggleView(){
    setState(() {
      showSignin = !showSignin;
    });
  }
  @override
  Widget build(BuildContext context) {
     if(showSignin == true){
       return Loginview(
         toggleView: toggleView
       );
    }
    else{
      return RegisterView(
         toggleView: toggleView

      );
    }
  }
}