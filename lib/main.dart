import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_door/src/home/blocs/home/home.dart';

import 'package:gold_door/src/shared/simple_bloc_delegate.dart';
import 'package:home_repository/home_repository.dart';
import 'package:user_repository/user_repository.dart';

import 'src/app.dart';
import 'src/authentication/authentication.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final FirebaseUserRepository userRepository = FirebaseUserRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(
            userRepository: userRepository,
          )..add(AuthenticationStarted()),
        ),
        BlocProvider(
          create: (context) =>
              HomeBloc(homeRepository: FakeHomeRepository())..add(LoadHome()),
        ),
      ],
      child: App(userRepository: userRepository),
    ),
  );
}
