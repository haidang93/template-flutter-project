import 'package:flutter/material.dart';
import 'package:template/app/providers/repository_provider.dart';
import 'package:template/l10n/generated/app_localizations.dart';
import 'package:template/l10n/generated/app_localizations_en.dart';
import 'package:template/l10n/l10n.dart';
import 'package:template/l10n/l10n_wrapper.dart';
import 'package:uloc/uloc.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get l10n =>
      AppLocalizations.of(this) ?? AppLocalizationsEn();

  void setLocale(L10nEnum locale) {
    L10nWrapper.of(this)?.setAppLocalizations(locale);
  }

  L10nEnum? get locale => L10nWrapper.of(this)?.appLocalizations;

  bool get isLocaleRTL {
    switch (locale) {
      case L10nEnum.arabic:
      case L10nEnum.farsi:
      case L10nEnum.dari:
      case L10nEnum.pashto:
        return true;
      default:
        return false;
    }
  }

  // Device and screen properties
  double get paddingTop => MediaQuery.of(this).padding.top;
  double get paddingBottom => MediaQuery.of(this).padding.bottom;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get tabletPadding => screenWidth * 0.15;
  bool get isSmallScreen =>
      MediaQuery.of(this).devicePixelRatio * screenWidth < 800;
  bool get isTablet => MediaQuery.of(this).size.shortestSide > 600;
  bool get isLandscape =>
      isTablet && MediaQuery.of(this).orientation == Orientation.landscape;

  bool get hasParentRoute => ModalRoute.of(this)?.canPop ?? false;

  ThemeData get theme => Theme.of(this);

  RepositoryProvider get repository => read<RepositoryProvider>();
}
