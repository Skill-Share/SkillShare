import 'package:SkillShare/Views/base_view.dart';
import 'package:SkillShare/core/View_Models/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text("We set!")),
      ),
    );
  }
}
