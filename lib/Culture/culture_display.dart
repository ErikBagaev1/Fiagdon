import 'package:fiagdon/Culture/CultureList.dart';
import 'package:flutter/material.dart';

import 'package:fiagdon/Theme/Theme.dart';

final data = [
  CultureList(
      name: 'Три пирога',
      about:
          '''"Три пирога" имеет большое значение в осетинской культуре и традициях. Это блюдо является неотъемлемой частью обрядовых и праздничных мероприятий, а также важным элементом гостеприимства и традиционной осетинской кухни.

Каждый из трех пирогов имеет свой уникальный вкус и историю, и вместе они символизируют единство и многообразие культуры и традиций осетинского народа. "Три пирога" также является символом благополучия и изобилия, так как это достаточно трудоемкое блюдо, которое требует множества ингредиентов и времени на приготовление.

Для осетинского народа "Три пирога" имеет глубокое культурное и историческое значение, и является одним из наиболее узнаваемых символов осетинской кухни и культуры.''',
      id: 1)
];

class CultureDisplayWidget extends StatefulWidget {
  const CultureDisplayWidget({super.key});

  @override
  State<CultureDisplayWidget> createState() => _CultureDisplayWidgetState();
}

class _CultureDisplayWidgetState extends State<CultureDisplayWidget> {
  var _searchData = <CultureList>[];

  final _searhConroller = TextEditingController();

  void _searchWorker() {
    final query = _searhConroller.text;
    if (query.isNotEmpty) {
      _searchData = data.where((CultureList dt) {
        return dt.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _searchData = data;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _searchData = data;
    _searchData.sort((a, b) {
      return a.name[0]
          .toString()
          .toLowerCase()
          .compareTo(b.name[0].toString().toLowerCase());
    });
    _searhConroller.addListener((_searchWorker));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 68.0),
          child: (ListView.builder(
            itemCount: _searchData.length,
            itemExtent: 425,
            itemBuilder: (BuildContext context, int index) {
              final culture = _searchData[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  splashColor: Colors.lightBlue[50],
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //           PlaceAboutWidget(id: index, place: place),
                    //     ));
                  },
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
                            culture.name,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          culture.about,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
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
                    controller: _searhConroller,
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
