import 'package:SkillShare/Views/404_view.dart';
import 'package:SkillShare/Views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router{

  //When you create a new view, register the routename here to make it display
  static Route<dynamic> routes(RouteSettings routeSettings){
    switch (routeSettings.name) {
      default:
        return MaterialPageRoute(builder: (_) => NotFoundView());
    }
  }
}