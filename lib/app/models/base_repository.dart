import 'package:http/http.dart';
import 'package:template/l10n/l10n.dart';

typedef DataResult<T> = Future<Result<T>>;
typedef Convertor<T> = T? Function(dynamic body);

class Result<T> {
  Result({
    this.code = 0,
    this.result,
    this.message = 'Ok',
    this.header = const {},
  });
  T? result;
  final int code;
  final Map<String, String> header;
  final String message;
  bool get success => code >= 200 && code < 300;
}

abstract class BaseRepository {
  final Client client;
  final String endpoint;
  final L10nEnum? locale;
  BaseRepository(this.client, this.endpoint, this.locale);

  Map<String, String> defaultAuth() => {
    'Authorization': 'Bearer YOUR_TOKEN_HERE',
  };

  // Uri _resolveURL(String url) =>
  //     Uri.parse((url.contains('http') ? '' : endpoint) + url);

  DataResult<T> post<T>({
    required String url,
    Object? body,
    Map<String, String> header = const {},
    bool debug = false,
    bool bodyByte = false,
    bool useDefaultAuthen = true,
    int? timeout,
    Convertor<T>? convertor,
    bool logoutOnAuthFailed = true,
  }) async {
    try {
      // final uri = _resolveURL(url);

      // implement http logic here

      return Result<T>(
        code: 200,
        result: convertor != null
            ? convertor({'sample_key': 'sample_value'})
            : null,
      );
    } catch (e) {
      return Result<T>(code: -1, message: e.toString());
    }
  }

  DataResult<T> get<T>({
    required String url,
    Map<String, String> header = const {},
    bool debug = false,
    bool bodyByte = false,
    bool useDefaultAuthen = true,
    int? timeout,
    Convertor<T>? convertor,
    bool logoutOnAuthFailed = true,
  }) async {
    try {
      // final uri = _resolveURL(url);

      // implement http logic here

      return Result<T>(
        code: 200,
        result: convertor != null
            ? convertor({'sample_key': 'sample_value'})
            : null,
      );
    } catch (e) {
      return Result<T>(code: -1, message: e.toString());
    }
  }

  DataResult<T> put<T>({
    required String url,
    Object? body,
    Map<String, String> header = const {},
    bool debug = false,
    bool bodyByte = false,
    bool useDefaultAuthen = true,
    int? timeout,
    Convertor<T>? convertor,
    bool logoutOnAuthFailed = true,
  }) async {
    try {
      // final uri = _resolveURL(url);

      // implement http logic here

      return Result<T>(
        code: 200,
        result: convertor != null
            ? convertor({'sample_key': 'sample_value'})
            : null,
      );
    } catch (e) {
      return Result<T>(code: -1, message: e.toString());
    }
  }

  DataResult<T> patch<T>({
    required String url,
    Object? body,
    Map<String, String> header = const {},
    bool debug = false,
    bool bodyByte = false,
    bool useDefaultAuthen = true,
    int? timeout,
    Convertor<T>? convertor,
    bool logoutOnAuthFailed = true,
  }) async {
    try {
      // final uri = _resolveURL(url);

      // implement http logic here

      return Result<T>(
        code: 200,
        result: convertor != null
            ? convertor({'sample_key': 'sample_value'})
            : null,
      );
    } catch (e) {
      return Result<T>(code: -1, message: e.toString());
    }
  }

  DataResult<T> delete<T>({
    required String url,
    Object? body,
    Map<String, String> header = const {},
    bool debug = false,
    bool bodyByte = false,
    bool useDefaultAuthen = true,
    int? timeout,
    Convertor<T>? convertor,
    bool logoutOnAuthFailed = true,
  }) async {
    try {
      // final uri = _resolveURL(url);

      // implement http logic here

      return Result<T>(
        code: 200,
        result: convertor != null
            ? convertor({'sample_key': 'sample_value'})
            : null,
      );
    } catch (e) {
      return Result<T>(code: -1, message: e.toString());
    }
  }

  DataResult<T> multiPart<T>({
    required String url,
    String method = 'POST',
    Map<String, dynamic> body = const {},
    Map<String, String> header = const {},
    bool debug = false,
    bool bodyByte = false,
    bool useDefaultAuthen = true,
    int? timeout,
    Convertor<T>? convertor,
    bool logoutOnAuthFailed = true,
  }) async {
    try {
      // final uri = _resolveURL(url);

      // implement http logic here

      return Result<T>(
        code: 200,
        result: convertor != null
            ? convertor({'sample_key': 'sample_value'})
            : null,
      );
    } catch (e) {
      return Result<T>(code: -1, message: e.toString());
    }
  }
}
