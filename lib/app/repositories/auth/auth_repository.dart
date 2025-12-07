import 'package:template/app/models/base_repository.dart';
import 'package:template/app/repositories/auth/model/auth_model.dart';

class AuthRepository extends BaseRepository {
  AuthRepository(super.client, super.endpoint, super.locale);

  DataResult<Auth> login({
    required String username,
    required String password,
  }) => post(
    url: '/auth/login',
    body: {'username': username, 'password': password},
    logoutOnAuthFailed: false,
    convertor: (body) => Auth.fromJson(body),
  );

  DataResult logout() => post(url: '/auth/logout', logoutOnAuthFailed: false);
}
