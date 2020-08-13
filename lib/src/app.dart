import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_door/src/shared/loading_indicator.dart';
import 'package:user_repository/user_repository.dart';

import '../generated/l10n.dart';
import '../themes.dart';
import 'authentication/authentication.dart';
import 'navigation/tabs.dart';

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routes: {
        '/': (context) {
          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationFailure) {
                return LoginScreen(userRepository: _userRepository);
              }
              if (state is AuthenticationSuccess) {
                return MultiBlocProvider(
                    providers: [
                      BlocProvider<AppTabBloc>(
                        create: (context) => AppTabBloc(),
                      ),
                    ],
                    child: BlocBuilder<AppTabBloc, AppTab>(
                      builder: (context, activeTab) {
                        return Scaffold(
                          body: appRoutes[activeTab],
                          bottomNavigationBar: TabBottomNavigationBar(
                            activeTab: activeTab,
                            onSelected: (tab) =>
                                BlocProvider.of<AppTabBloc>(context)
                                    .add(AppTabNavigationEvent(tab)),
                          ),
                        );
                      },
                    ));
              }
              return Center(
                child: Scaffold(
                  body: LoadingIndicator(),
                ),
              );
            },
          );
        },
      },
    );
  }
}
