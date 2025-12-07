// dart run lib/l10n/utilities/remove_unuse_key.dart

import 'dart:io';

///
/// remove all key in unused_key.txt
///

File resFile = File('lib/l10n/utilities/unused_key.txt');
Directory dir = Directory('lib/l10n/definitions');
void main() {
  final keys = resFile.readAsLinesSync();
  for (var element in dir.listSync()) {
    final type = element.statSync().type;
    if (type == FileSystemEntityType.file) {
      final res = File(element.path).readAsLinesSync();
      res.removeWhere((e) {
        if (e.contains(':')) {
          final key = e.split(':').first.trim().replaceAll('"', '');

          return keys.contains(key);
        }
        return false;
      });
      File(element.path).writeAsStringSync(res.join('\n'));
    }
  }
}
