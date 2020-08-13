import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gold_door/src/settings/screens/screens.dart';

typedef OnSearchCallback(String value);

class AppBarSearchField extends StatefulWidget {
  final OnSearchCallback onSearchCallback;

  AppBarSearchField({Key key, @required this.onSearchCallback})
      : super(key: key);

  @override
  _AppBarSearchFieldState createState() => _AppBarSearchFieldState();
}

class _AppBarSearchFieldState extends State<AppBarSearchField> {
  final formKey = new GlobalKey<FormState>();

  bool isOpen = false;

  final _focusNode = FocusNode();

  void _showTextField() {
    setState(() {
      isOpen = !isOpen;
      if (!_focusNode.hasFocus) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          color: Theme.of(context).accentColor,
          icon: isOpen
              ? Icon(FontAwesomeIcons.timesCircle)
              : Icon(FontAwesomeIcons.search),
          onPressed: () {
            this.widget.onSearchCallback('');
            this._showTextField();
          },
        ),
        Expanded(
          child: isOpen
              ? TextField(
                  focusNode: _focusNode,
                  onChanged: (value) {
                    this.widget.onSearchCallback(value);
                  },
                  cursorWidth: 1,
                  cursorColor: Theme.of(context).focusColor,
                  textAlignVertical: TextAlignVertical.center,
                )
              : GestureDetector(
                  onTap: () => this._showTextField(),
                  child: Container(
                    height: 30,
                    color: Colors.white,
                  ),
                ),
        ),
        IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(FontAwesomeIcons.cog),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SettingsScreen()));
            })
      ],
    );
  }
}
