import 'package:flutter/widgets.dart';
import 'package:template/app/repositories/user/model/user_model.dart';
import 'package:uloc/uloc.dart';

class AppProvider extends ULoCProvider {
  AppProvider(super.context);
  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  BuildContext? get navigationContext => navigationKey.currentContext;

  User? user;
  set setUser(User? value) {
    setState(() {
      user = value;
    });
  }
}
