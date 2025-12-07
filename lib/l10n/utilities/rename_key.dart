// to rename key with name conflict
//  dart run lib/l10n/utilities/rename_key.dart

import 'dart:convert';
import 'dart:io';

void main() {
  final regex = RegExp(r'_\d+$');
  final file = File('lib/l10n/definitions/app_en.arb');
  final res = <MapEntry<String, dynamic>>[];
  final definitionRaw = file.readAsStringSync().trim();
  final definition = definitionRaw
      .substring(1, definitionRaw.length - 2)
      .split('\n')
      .where((e) => e.trim() != '')
      .map((e) {
    String data = e.trim().replaceFirst('": "', '@@');
    data = data.substring(1, data.length - 2);
    String key = data.split('@@')[0];
    String value = data.split('@@')[1];
    value = value.replaceAll('\\"', '"').replaceAll('\\n', '\n');
    return MapEntry(key, value);
  });

  bool checkExist(String key) {
    return res.any((e) => e.key == key);
  }

  String genKey(String key) {
    String res = '';
    final regexFound = regex.firstMatch(key);
    String baseKey = key.substring(0, regexFound?.start);
    int index = int.parse(key.substring((regexFound?.start ?? 0) + 1));

    do {
      index++;
      res = [baseKey, index.toString().padLeft(3, '0')].join('_');
    } while (checkExist(res));

    return res;
  }

  for (var element in definition) {
    MapEntry<String, dynamic> entry;

    if (checkExist(element.key)) {
      if (regex.hasMatch(element.key)) {
        entry = MapEntry(genKey(element.key), element.value);
      } else {
        entry = MapEntry([element.key, '001'].join('_'), element.value);
      }
    } else {
      entry = element;
    }

    res.add(entry);
  }

  // res.sort((a, b) => a.key.compareTo(b.key));
  final data = Map.fromEntries(res);
  file.writeAsStringSync(JsonEncoder.withIndent('  ').convert(data));
}
