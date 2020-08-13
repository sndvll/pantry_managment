import 'package:flutter/material.dart';

class CustomElevation extends StatelessWidget {
  final Widget child;

  CustomElevation({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              // TODO IS THIS COLOR SETTING OK?
              color: Theme.of(context).accentColor.withOpacity(0.10),
              blurRadius: 8,
              spreadRadius: -5,
              offset: Offset(0, 5)),
        ],
      ),
      child: this.child,
    );
  }
}
