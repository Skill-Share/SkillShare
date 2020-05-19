

import 'package:SkillShare/core/View_Models/user_model.dart';
import 'package:SkillShare/core/service/authentication/auth_service.dart';
import 'package:SkillShare/locator.dart';
import 'package:SkillShare/routes.dart';
import 'package:SkillShare/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: Authservice().user,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: Router.routes,
        // initialRoute: '',
        home: Wrapper(),
      ));

  // This widget is the root of your application.
 

  }}