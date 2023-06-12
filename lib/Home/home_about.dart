import 'package:fiagdon/Home/homeClass.dart';
import 'package:fiagdon/Home/home_display.dart';

import 'package:flutter/material.dart';

class HomeAbout extends StatefulWidget {
  final int id;
  final HomeClass list;

  const HomeAbout({Key? key, required this.id, required this.list})
      : super(key: key);

  @override
  State<HomeAbout> createState() => _HomeAboutState();
}

class _HomeAboutState extends State<HomeAbout> {
  double _value = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.list.name)),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 200,
              child: Text(
                _value.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: _value,
                    color: Colors.white),
              ),
            ),
            Slider(
              value: _value,
              min: 0.0,
              max: 100.0,
              divisions: 10, // количество делений
              label: widget.list.name,
              onChanged: (double value) {
                setState(() {
                  _value = value;
                });
              },
            )
          ],
        ));
  }
}
