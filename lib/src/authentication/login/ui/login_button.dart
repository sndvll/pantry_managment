import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final String label;

  LoginButton({Key key, VoidCallback onPressed, @required this.label})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: _onPressed,
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      child: Text(this.label),
    );
  }
}
