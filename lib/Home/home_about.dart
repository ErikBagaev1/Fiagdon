import 'package:fiagdon/Home/homeClass.dart';
import 'package:fiagdon/Home/home_display.dart';

import 'package:flutter/material.dart';

class HomeAbout extends StatelessWidget {
  final int id;
  final HomeClass list;

  const HomeAbout({Key? key, required this.id, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(list.name)),
        ),
        body: Text(id.toString()));
  }
}
