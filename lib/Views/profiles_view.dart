
import 'package:SkillShare/Views/base_view.dart';
import 'package:SkillShare/core/View_Models/profiles_view_model.dart';
import 'package:flutter/material.dart';

class ProfilesView extends StatefulWidget {
  @override
  _ProfilesViewState createState() => _ProfilesViewState();
}

class _ProfilesViewState extends State<ProfilesView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfilesViewModel>(
      onModelReady: (model){

      },

      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text("Profile"),
        ),
      ),
    );
  }
}