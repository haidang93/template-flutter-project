// dart run lib/l10n/utilities/check_sync_key.dart

import 'dart:convert';
import 'dart:io';

///
/// remove all key that aren't included in en file
///

File resFile = File('lib/l10n/utilities/unsync_key.json');
var keys =
    (jsonDecode(File('lib/l10n/definitions/app_en.arb').readAsStringSync())
            as Map<String, dynamic>)
        .keys
        .toList();
Directory dir = Directory('lib/l10n/definitions');

List<String> res = [];

void main() {
  for (var element in dir.listSync()) {
    final type = element.statSync().type;
    if (type == FileSystemEntityType.file &&
        !element.path.endsWith('app_en.arb')) {
      checkUnsync(element.path);
    }
  }
}

void checkUnsync(String path) {
  final content = File(path).readAsLinesSync();
  content.removeWhere((e) {
    if (e.contains(':')) {
      final key = e.split(':').first.trim().replaceAll('"', '');
      return !keys.contains(key);
    }
    return false;
  });
  File(path).writeAsStringSync(content.join('\n'));
}
