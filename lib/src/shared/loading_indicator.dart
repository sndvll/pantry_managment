import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final Color color;

  LoadingIndicator({this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      color: this.color ?? Theme.of(context).accentColor,
      size: this.size ?? 80.0,
    );
  }
}
