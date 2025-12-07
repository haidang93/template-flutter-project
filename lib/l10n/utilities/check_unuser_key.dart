// dart run lib/l10n/utilities/check_unuser_key.dart

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

///
/// check key that are not used in code and write to unused_key.txt
///

File resFile = File('lib/l10n/utilities/unused_key.txt');
File enFile = File('lib/l10n/definitions/app_en.arb');

final locale = (jsonDecode(enFile.readAsStringSync()) as Map<String, dynamic>)
    .keys
    .toList();

Map<String, String> fileContents = {};
List<String> res = [];

List<String> ignore = ['lib/l10n', 'lib/generated'];

void main() {
  checkUnusedKey();
}

void checkUnusedKey() {
  final root = Directory('lib/');
  scanDir(root, (path) {
    fileContents[path] = File(path).readAsStringSync();
  });
  checkContain();
  resFile.writeAsStringSync(res.join('\n'));
}

void checkContain() {
  int total = locale.length;
  int count = 0;
  for (var e in locale) {
    bool check = false;
    count++;
    for (String file in fileContents.values) {
      if (file.contains(e)) {
        check = true;
        break;
      }
    }
    double process = count / total * 100;
    stdout.write('\r${process.toStringAsFixed(2)}%');
    if (!check) {
      res.add(e);
    }
  }
}

void scanDir(Directory dir, Function(String path) onFile) {
  for (var eDir in dir.listSync()) {
    if (ignore.contains(eDir.path)) {
      print('ignore path: ${eDir.path}');
      continue;
    } else if (eDir.statSync().type == FileSystemEntityType.file) {
      onFile(eDir.path);
    } else {
      scanDir(Directory(eDir.path), onFile);
    }
  }
}
