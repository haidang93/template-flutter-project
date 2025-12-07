import 'dart:convert';
import 'dart:io';

// dart run .\lib\l10n\utilities\sort_key.dart

const dir = 'lib/l10n/definitions/';

void main(List<String> args) {
  final files = Directory(
    dir,
  ).listSync().where((e) => e.statSync().type == FileSystemEntityType.file);

  for (var element in files) {
    final Map<String, dynamic> data = jsonDecode(
      File(element.path).readAsStringSync(),
    );

    final entries = data.entries.toList();
    entries.sort((a, b) => a.key.compareTo(b.key));
    final Map<String, dynamic> res = Map.fromEntries(entries);

    final encoder = JsonEncoder.withIndent('  ');
    File(element.path).writeAsStringSync(encoder.convert(res));
  }

  // ignore: avoid_print
  print("FINISHED");
}
