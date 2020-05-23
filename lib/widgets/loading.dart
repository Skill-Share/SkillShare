import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: Center(
        child: SpinKitRipple(
          color: Colors.white24,
          size: 45.0,
        ),
      ),
    );
  }
}