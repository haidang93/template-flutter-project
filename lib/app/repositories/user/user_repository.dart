import 'package:template/app/models/base_repository.dart';
import 'package:template/app/repositories/user/model/user_model.dart';

class UserRepository extends BaseRepository {
  UserRepository(super.client, super.endpoint, super.locale);

  DataResult<User> fetchUserProfile() =>
      post(url: '/user/profile', convertor: (body) => User.fromJson(body));

  DataResult<User> updateUserProfile() => patch(
    url: '/user/profile',
    body: {
      // your update data here
    },
    convertor: (body) => User.fromJson(body),
  );
}
