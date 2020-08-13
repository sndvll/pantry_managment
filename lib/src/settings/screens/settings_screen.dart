import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gold_door/src/authentication/authentication.dart';
import 'package:gold_door/src/home/blocs/blocs.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  HomeLoaded loadedState;

  @override
  void initState() {
    super.initState();
    if (BlocProvider.of<HomeBloc>(context).state is HomeLoaded) {
      loadedState = BlocProvider.of<HomeBloc>(context).state;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.chevronLeft),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Settings'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    loadedState.home.name != null ? loadedState.home.name : ''),
                RaisedButton(
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(AuthenticationLoggedOut());
                    Navigator.of(context).pop();
                  },
                  child: Text('Log out'),
                ),
              ]),
        ));
  }
}
