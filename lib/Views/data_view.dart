
import 'package:SkillShare/Views/base_view.dart';
import 'package:SkillShare/core/View_Models/data_view_model.dart';
import 'package:flutter/material.dart';

class DataView extends StatefulWidget {
  @override
  _DataViewState createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<DataViewModel>(
      onModelReady: (model){

      },

      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text("Data"),
        ),
      ),
    );
  }
}