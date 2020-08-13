import 'package:flutter/material.dart';

class AddItemScreen extends StatelessWidget {
  AddItemScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(child: Text('Add item!')),
      ],
    );
  }
}
