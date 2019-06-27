import 'package:flutter/material.dart';
import 'package:i18n_sample/i18n/i18n_sample_localizations.dart';

class I18nSampleLocalizationsDelegate extends LocalizationsDelegate<I18nSampleLocalizations> {
  const I18nSampleLocalizationsDelegate();
  
  @override
  bool isSupported(Locale locale) => ['de', 'en'].contains(locale.languageCode);

  @override
  Future<I18nSampleLocalizations> load(Locale locale) => I18nSampleLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<I18nSampleLocalizations> old) => false;
  
}