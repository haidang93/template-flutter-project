extension StringExtension on String {
  bool _hasMatch(String pattern) {
    return RegExp(pattern).hasMatch(this);
  }

  bool get isURL => _hasMatch(
    r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
  );

  bool get isEmail => _hasMatch(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  bool get isHexadecimal => _hasMatch(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');
  bool get isNumericOnly => _hasMatch(r'^\d+$');
  bool get isAlphabetOnly => _hasMatch(r'^[a-zA-Z]+$');

  String get inLined => replaceAll(RegExp(r'[\r\n]+'), ' ');

  String get capitalizeFirst =>
      isNotEmpty ? '${toUpperCase()[0]}${substring(1).toLowerCase()}' : '';

  String get capitalize =>
      isNotEmpty ? split(' ').map((e) => e.capitalizeFirst).join(' ') : '';

  String toTitleCase() => toLowerCase()
      .replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.capitalize)
      .join(' ');
}
