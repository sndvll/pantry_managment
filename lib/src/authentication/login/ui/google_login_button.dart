import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/bloc.dart';

class GoogleLoginButton extends StatelessWidget {
  final String label;

  GoogleLoginButton(this.label);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      icon: Icon(FontAwesomeIcons.google, color: Colors.white),
      onPressed: () {
        BlocProvider.of<LoginBloc>(context).add(
          LoginWithGooglePressed(),
        );
      },
      label: Text(this.label, style: TextStyle(color: Colors.white)),
      color: Colors.redAccent,
    );
  }
}
