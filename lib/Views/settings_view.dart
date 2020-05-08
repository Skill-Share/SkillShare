
import 'package:SkillShare/Views/base_view.dart';
import 'package:SkillShare/core/View_Models/settings_view_model.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      onModelReady: (model){

      },

      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text("settings"),
        ),
      ),
    );
  }
}