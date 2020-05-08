import 'package:flutter/widgets.dart';

class NotFoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("View not found, make sure you registered it in your route settings correctly"),
    );
  }
}