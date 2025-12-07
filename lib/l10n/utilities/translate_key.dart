// dart run lib/l10n/utilities/translate_key.dart

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

HttpClient client = HttpClient();

File resFile = File('lib/l10n/utilities/translated.json');
var keys =
    (jsonDecode(File('lib/l10n/definitions/app_en.arb').readAsStringSync())
            as Map<String, dynamic>)
        .keys
        .toList();
var entries =
    (jsonDecode(File('lib/l10n/definitions/app_en.arb').readAsStringSync())
            as Map<String, dynamic>)
        .entries
        .toList();
Directory dir = Directory('lib/l10n/definitions');

Map<String, Map<String, String>> res = {};

int count = 0;

void main() async {
  for (var element in dir.listSync()) {
    final type = element.statSync().type;
    if (type == FileSystemEntityType.file &&
        !element.path.endsWith('app_en.arb')) {
      await translate(element.path);
    }
  }

  resFile.writeAsStringSync(jsonEncode(res));
  print('FINISHED');
}

Future translate(String path) async {
  final content =
      (jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>).keys;
  res[path.split('app_').last.replaceAll('.arb', '')] = {};
  final value = res[path.split('app_').last.replaceAll('.arb', '')];

  for (var entry in entries) {
    if (!content.contains(entry.key)) {
      final translated = await callApi(entry.value, getLangCode(path));
      count++;

      if (translated?['text']?.isNotEmpty ?? false) {
        final text = translated['text'] ?? '';
        print('${entry.key}: $text');
        print('$count translated');
        value?[entry.key] = text;
      } else {
        print(translated);
      }
      if (count % 10 == 0) {
        print('await 20s from: ${DateTime.now()}');
        await Future.delayed(const Duration(seconds: 20));
      }
    }
  }
}

String getLangCode(String path) {
  if (path.endsWith('app_am.arb')) {
    return 'am';
  }
  if (path.endsWith('app_ar.arb')) {
    return 'ar';
  }
  if (path.endsWith('app_es.arb')) {
    return 'es';
  }
  if (path.endsWith('app_fa.arb')) {
    return 'fa';
  }
  if (path.endsWith('app_fil.arb')) {
    return 'fil';
  }
  if (path.endsWith('app_fr.arb')) {
    return 'fr';
  }
  if (path.endsWith('app_hi.arb')) {
    return 'hi';
  }
  if (path.endsWith('app_ko.arb')) {
    return 'ko';
  }
  if (path.endsWith('app_pa.arb')) {
    return 'pa';
  }
  if (path.endsWith('app_ti.arb')) {
    return 'ti';
  }
  if (path.endsWith('app_prs.arb')) {
    return 'prs';
  }
  if (path.endsWith('app_sw.arb')) {
    return 'sw';
  }
  if (path.endsWith('app_zh_Hant.arb')) {
    return 'zh-Hant';
  }
  if (path.endsWith('app_zh_Hans.arb')) {
    return 'zh-Hans';
  }
  if (path.endsWith('app_uk.arb')) {
    return 'uk';
  }
  if (path.endsWith('app_vi.arb')) {
    return 'vi';
  }
  if (path.endsWith('app_zh.arb')) {
    return 'zh-Hans';
  }
  if (path.endsWith('app_ps.arb')) {
    return 'ps';
  }

  return 'en';
}

Future callApi(String value, String code) async {
  final req = await client.postUrl(
    Uri.parse('https://live-api.example.com/translator'),
  );
  req.headers.add(
    HttpHeaders.contentTypeHeader,
    "application/json; charset=utf-8",
  );
  req.add(utf8.encode(jsonEncode({'toLanguage': code, 'content': value})));

  final res = await req.close();
  // print(await res.transform(utf8.decoder).join());
  return jsonDecode(await res.transform(utf8.decoder).join());
}
