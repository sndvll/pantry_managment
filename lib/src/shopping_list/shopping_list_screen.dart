import 'package:flutter/material.dart';

class ShoppingListScreen extends StatelessWidget {
  ShoppingListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(child: Text('Cooming soon')),
      ],
    );
  }
}
