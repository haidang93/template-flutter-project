import 'package:flutter/material.dart';

enum L10nEnum {
  english('en', 'English', Locale('en')),
  amharic('am', 'አማርኛ', Locale('am')),
  arabic('ar', 'عربي', Locale('ar')),
  // cantonese('yue', '粵語', Locale('yue')),
  chineseSimplified('zh-Hans', '简体中文', Locale('zh', 'Hans')),
  chineseTraditional('zh-Hant', '繁體中文', Locale('zh', 'Hant')),
  french('fr', 'Français', Locale('fr')),
  hindi('hi', 'हिंदी', Locale('hi')),
  farsi('fa', 'فارسی', Locale('fa')),
  dari('prs', 'دری', Locale('sv')),
  tigrinya('ti', 'ትግሪኛ', Locale('ru')),
  korean('ko', '한국인', Locale('ko')),
  filipino('fil', 'Pilipino', Locale('fil')),
  spanish('es', 'Español', Locale('es')),
  swahili('sw', 'Kiswahili', Locale('sw')),
  punjabi('pa', 'ਪੰਜਾਬੀ', Locale('pa')),
  pashto('ps', 'پښتو', Locale('zu')),
  vietnamese('vi', 'Tiếng Việt', Locale('vi')),
  ukrainian('uk', 'українська', Locale('uk'));

  final String label;
  final String code;
  final Locale locale;
  const L10nEnum(this.code, this.label, this.locale);

  static L10nEnum parse(dynamic code) {
    if (code is String) {
      return L10nEnum.values.firstWhere(
        (l10n) => l10n.code == code,
        orElse: () => L10nEnum.english,
      );
    } else if (code is Locale) {
      return L10nEnum.values.firstWhere(
        (l10n) =>
            l10n.locale.languageCode == code.languageCode &&
            l10n.locale.countryCode == code.countryCode,
        orElse: () => L10nEnum.values.firstWhere(
          (l10n) => l10n.locale.languageCode == code.languageCode,
          orElse: () => L10nEnum.english,
        ),
      );
    } else {
      return english;
    }
  }
}
