
import 'package:SkillShare/core/View_Models/base_view_model.dart';
import 'package:SkillShare/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget{
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  BaseView({this.builder, this.onModelReady});

  @override 
  _BaseViewState<T> createState() => _BaseViewState();

}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>>{
  T model = locator<T>();

  void initState(){
    if(widget.onModelReady != null){
      widget.onModelReady(model);
    }
    super.initState();
  }
  @override 
  Widget build(BuildContext context){
    return ChangeNotifierProvider.value(
      value: model,
      child: Consumer<T>(builder: widget.builder,),
    );
  }
}