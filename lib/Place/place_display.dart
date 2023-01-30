import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiagdon/Place/PlaceList.dart';
import 'package:fiagdon/Theme/Theme.dart';
import 'package:flutter/material.dart';

final place = [
  PlaceList(
      name: "Кармадон",
      about:
          "Определить цвет пикселя онлайн. Утилита для определения цвета пикселя на скриншоте или картинке для браузера Chrome. (Инструмент пипетка онлайн). Поддерживает альфа-канал (полупрозрачный цвет) для PNG файлов. ",
      star: 4.4),
  PlaceList(name: "Дигора", about: "Курорт", star: 4.4),
];

class PlaceDisplayWidget extends StatefulWidget {
  const PlaceDisplayWidget({super.key});

  @override
  State<PlaceDisplayWidget> createState() => _PlaceDisplayWidgetState();
}

class _PlaceDisplayWidgetState extends State<PlaceDisplayWidget> {
  var _searchPlace = <PlaceList>[];

  final _searConroller = TextEditingController();
  void _searchWorker() {
    final query = _searConroller.text;
    if (query.isNotEmpty) {
      _searchPlace = place.where((PlaceList worker) {
        return worker.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _searchPlace = place;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement setState
    super.initState();

    _searchPlace = place;
    _searchPlace.sort((a, b) {
      return a.name[0]
          .toString()
          .toLowerCase()
          .compareTo(b.name[0].toString().toLowerCase());
    });
    _searConroller.addListener((_searchWorker));
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 68.0),
          child: (ListView.builder(
            itemCount: _searchPlace.length,
            itemBuilder: (BuildContext context, int index) {
              final person = _searchPlace[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: ThemeColor.placeContainer,
                      border: Border.all(color: ThemeColor.main, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          person.name,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(person.about),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    expands: false,
                    controller: _searConroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withAlpha(200),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
