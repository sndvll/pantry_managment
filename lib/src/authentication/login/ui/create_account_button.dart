import 'package:flutter/material.dart';
import 'package:gold_door/src/authentication/register/register.dart';
import 'package:user_repository/user_repository.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  final String label;

  CreateAccountButton(
      {Key key, @required UserRepository userRepository, @required this.label})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(this.label),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(userRepository: _userRepository);
          }),
        );
      },
    );
  }
}
