// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get loginPageTitle {
    return Intl.message(
      'Login',
      name: 'loginPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get loginPageEmail {
    return Intl.message(
      'Email',
      name: 'loginPageEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginPagePassword {
    return Intl.message(
      'Password',
      name: 'loginPagePassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginPageLogin {
    return Intl.message(
      'Login',
      name: 'loginPageLogin',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get loginPageLoginWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'loginPageLoginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get loginPageCreateAccount {
    return Intl.message(
      'Create an account',
      name: 'loginPageCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login Failure`
  String get loginPageLoginFailure {
    return Intl.message(
      'Login Failure',
      name: 'loginPageLoginFailure',
      desc: '',
      args: [],
    );
  }

  /// `Logging in...`
  String get loginPageLoggingIn {
    return Intl.message(
      'Logging in...',
      name: 'loginPageLoggingIn',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get loginPageInvalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'loginPageInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get loginPageInvalidPassword {
    return Intl.message(
      'Invalid password',
      name: 'loginPageInvalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get registerPageTitle {
    return Intl.message(
      'Sign up',
      name: 'registerPageTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}