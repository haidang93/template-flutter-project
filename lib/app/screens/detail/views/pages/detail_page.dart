import 'package:flutter/material.dart';
import 'package:uloc/uloc.dart';

import 'package:template/app/screens/detail/controllers/detail_controller.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailController get watch => context.watch<DetailController>();
  DetailController get controller => context.read<DetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(watch.name)),
      body: Center(child: Text(watch.content)),
    );
  }
}
