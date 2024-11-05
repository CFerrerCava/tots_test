// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `minimal`
  String get minimalTitle {
    return Intl.message(
      'minimal',
      name: 'minimalTitle',
      desc: '',
      args: [],
    );
  }

  /// `LOG IN`
  String get loginSubTitle {
    return Intl.message(
      'LOG IN',
      name: 'loginSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get mailPlaceholder {
    return Intl.message(
      'Mail',
      name: 'mailPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordPlaceholder {
    return Intl.message(
      'Password',
      name: 'passwordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `CLIENTS`
  String get clientsLabel {
    return Intl.message(
      'CLIENTS',
      name: 'clientsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get searchPlaceHolder {
    return Intl.message(
      'Search...',
      name: 'searchPlaceHolder',
      desc: '',
      args: [],
    );
  }

  /// `Load More`
  String get loadMoreButton {
    return Intl.message(
      'Load More',
      name: 'loadMoreButton',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get editButton {
    return Intl.message(
      'Edit',
      name: 'editButton',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deleteButton {
    return Intl.message(
      'Delete',
      name: 'deleteButton',
      desc: '',
      args: [],
    );
  }

  /// `ADD NEW`
  String get addNew {
    return Intl.message(
      'ADD NEW',
      name: 'addNew',
      desc: '',
      args: [],
    );
  }

  /// `Add new client`
  String get addNewClientTitle {
    return Intl.message(
      'Add new client',
      name: 'addNewClientTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit client`
  String get editClientTitle {
    return Intl.message(
      'Edit client',
      name: 'editClientTitle',
      desc: '',
      args: [],
    );
  }

  /// `First name*`
  String get firstNamePlaceholder {
    return Intl.message(
      'First name*',
      name: 'firstNamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Last name*`
  String get lastNamePlaceholder {
    return Intl.message(
      'Last name*',
      name: 'lastNamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Email address*`
  String get emailAdressPlaceholder {
    return Intl.message(
      'Email address*',
      name: 'emailAdressPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message(
      'Cancel',
      name: 'cancelButton',
      desc: '',
      args: [],
    );
  }

  /// `SAVE`
  String get saveButton {
    return Intl.message(
      'SAVE',
      name: 'saveButton',
      desc: '',
      args: [],
    );
  }

  /// `Upload image`
  String get uploadImagePlaceholder {
    return Intl.message(
      'Upload image',
      name: 'uploadImagePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Please, fill out the filds`
  String get loginMessageDataError {
    return Intl.message(
      'Please, fill out the filds',
      name: 'loginMessageDataError',
      desc: '',
      args: [],
    );
  }

  /// `Please, fill out the password field`
  String get loginPasswordError {
    return Intl.message(
      'Please, fill out the password field',
      name: 'loginPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Please, fill out the email field`
  String get loginEmailError {
    return Intl.message(
      'Please, fill out the email field',
      name: 'loginEmailError',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get loading {
    return Intl.message(
      'loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Registered`
  String get registed {
    return Intl.message(
      'Registered',
      name: 'registed',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Deleted`
  String get deleted {
    return Intl.message(
      'Deleted',
      name: 'deleted',
      desc: '',
      args: [],
    );
  }

  /// `Updated`
  String get updated {
    return Intl.message(
      'Updated',
      name: 'updated',
      desc: '',
      args: [],
    );
  }

  /// `List is empty, please add a new Client`
  String get listIsEmpty {
    return Intl.message(
      'List is empty, please add a new Client',
      name: 'listIsEmpty',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
