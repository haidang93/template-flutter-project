import 'package:flutter/material.dart';
import 'package:template/l10n/l10n.dart';

class L10nWrapper extends StatefulWidget {
  const L10nWrapper({super.key, required this.builder});
  final Widget Function(Locale locale) builder;

  static L10nWrapperState? of(BuildContext context) {
    return context.findAncestorStateOfType<L10nWrapperState>();
  }

  @override
  State<L10nWrapper> createState() => L10nWrapperState();
}

class L10nWrapperState extends State<L10nWrapper> {
  L10nEnum _appLocalizations = L10nEnum.english;
  L10nEnum get appLocalizations => _appLocalizations;
  @override
  void initState() {
    super.initState();
    _appLocalizations = L10nEnum.parse(
      WidgetsBinding.instance.platformDispatcher.locale,
    );
  }

  Future setAppLocalizations(L10nEnum locale) async {
    setState(() {
      _appLocalizations = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_appLocalizations.locale);
  }
}
