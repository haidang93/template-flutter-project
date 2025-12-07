// dart run lib/l10n/utilities/load_translated_key_to_language.dart

import 'dart:convert';
import 'dart:io';

HttpClient client = HttpClient();

File resFile = File('lib/l10n/utilities/translated.json');

File entries(String name) => File('lib/l10n/definitions/app_$name.arb');

void main() async {
  final translated =
      jsonDecode(resFile.readAsStringSync()) as Map<String, dynamic>;
  for (MapEntry element in translated.entries) {
    final file = entries(element.key);
    final langFile = jsonDecode(file.readAsStringSync());
    for (MapEntry l in element.value.entries) {
      langFile[l.key] = l.value;
    }
    final encoder = JsonEncoder.withIndent('  ');
    file.writeAsStringSync(encoder.convert(langFile));
  }
}
