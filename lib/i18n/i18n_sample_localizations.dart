import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Import messages
// Step one define messages to extract
// Step two extract messages into ARB files, also able to use GTT -> Google Translate Toolkit
// - flutter pub run intl_translation:extract_to_arb --output-dir=[some/path] path/to/file/with_messages.dart
// Step three cp / translate intl_messages.arb to messages_[locale].arb
// Step four generate messages files 
// - flutter pub run intl_translation:generate_from_arb path/to/file/with_messages.dart path/to/file_with_translation.arb... --output-dir=[some/path] --locale=[locale if undefined]

import '../i18n/generated/messages_all.dart';

class I18nSampleLocalizations {
  static Future<I18nSampleLocalizations> load(Locale locale) async {
    final String localeName = 
      locale.countryCode == null || locale.countryCode.isEmpty
      ? locale.languageCode
      : locale.toString();

      final String canonicalLocaleName = Intl.canonicalizedLocale(localeName);

      // loading possible after generating messages_* Files
      await initializeMessages(canonicalLocaleName);

      Intl.defaultLocale = canonicalLocaleName;

      return I18nSampleLocalizations();
  }

  static I18nSampleLocalizations of(BuildContext ctx) {
    return Localizations.of<I18nSampleLocalizations>(ctx, I18nSampleLocalizations);
  }

  // Translated Messages

  String get increment_btn_tooltip => Intl.message(
    'Increment',
    name: 'increment_btn_tooltip', // needs to match functionname
    desc: 'Increment text for Screenreaders'
  );
}