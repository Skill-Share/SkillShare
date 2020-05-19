import 'package:SkillShare/Views/homepage.dart';
import 'package:SkillShare/core/View_Models/user_model.dart';
import 'package:SkillShare/core/service/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final user = Provider.of<UserModel>(context);
  if (user == null){
    return Authenticate();
  }
  else{
    return MyHomePage();
  }
  }
}