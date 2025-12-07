import 'package:flutter/material.dart';
import 'package:uloc/uloc.dart';

import 'package:template/app/screens/user/controllers/user_controller.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  UserController get watch => context.watch<UserController>();
  UserController get controller => context.read<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(watch.name)),
      body: Center(child: Text(watch.content)),
    );
  }
}
