import 'package:http/http.dart';
import 'package:template/app/repositories/auth/auth_repository.dart';
import 'package:template/app/repositories/user/user_repository.dart';
import 'package:template/l10n/l10n.dart';

class RepositoryProvider {
  final String endpoint;
  final L10nEnum? locale;
  RepositoryProvider(this.endpoint, this.locale);
  Client client = Client();

  late final userRepository = UserRepository(client, endpoint, locale);
  late final authRepository = AuthRepository(client, endpoint, locale);
}
