import 'package:template/app/repositories/user/model/user_model.dart';

class Auth {
  String? accessToken;
  User? user;

  Auth({this.accessToken, this.user});

  Auth.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    return data;
  }
}
