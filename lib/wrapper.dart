import 'package:SkillShare/Views/homepage.dart';
import 'package:SkillShare/Views/login_view.dart';
import 'package:SkillShare/core/View_Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final user = Provider.of<UserModel>(context);
  if (user == null){
    return Loginview();
  }
  else{
    return MyHomePage();
  }
  }
}