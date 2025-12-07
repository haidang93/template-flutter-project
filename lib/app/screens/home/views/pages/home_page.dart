import 'package:flutter/material.dart';
import 'package:template/app/providers/app_provider.dart';
import 'package:uloc/uloc.dart';

import 'package:template/app/screens/home/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get watch => context.watch<HomeController>();
  HomeController get controller => context.read<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(watch.name)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(watch.content),
            Text(context.watch<AppProvider>().user?.email ?? "No user email"),
          ],
        ),
      ),
    );
  }
}
