import 'package:fiagdon/Home/home_about.dart';
import 'package:fiagdon/Place/PlaceList.dart';
import 'package:fiagdon/Place/place_about.dart';
import 'package:fiagdon/Theme/Theme.dart';
import 'package:flutter/material.dart';
import '../Home/home_display.dart';

final place = [
  PlaceList(
      name: "Меч в камне",
      about:
          '''Этот арт-объект невероятных размеров находится в Мидаграбинской долине.\n
      Он представляет собой металлический клинок,
      воткнутый в пятиметровый камень, когда-то отколовшийся от скалы,
      и отсылает к английской легенде о короле Артуре и мече Эскалибуре.
      Таким образом осетины намекают на связь Нартского эпоса с английским, 
      а еще поддерживают версию некоторых исследователей о том,
      что прообразами рыцарей круглого стола были сарматы-аланы, 
      нанятые Марком Аврелием во времена Римской империи и посланные на службу 
      в Британию.Добраться до арт-объекта несложно: двигайтесь в сторону Мидаграбинских водопадов 
      — проехать мимо невозможно.''',
      id: 1,
      url: "assets/images/mech.jpg"),
  PlaceList(
      name: "Зеркальный барс",
      about:
          '''Этот арт-объект установлен в Кадаргаванском каньоне. 
      Скульптура животного, которое крадется по скале,
       покрыта зеркальными элементами, 
       за счет которых барс частично отражает окружающий пейзаж и становится отчасти невидимым.
       Так метафорически туристам напоминают о том,
       что барс (переднеазиатский леопард), 
       выступающий символом Северной Осетии и изображенный на ее гербе, 
       — животное исчезающее. В Средневековье в Алании их водилось очень много, 
       но со временем популяция сильно сократилась, 
       и сегодня барсов стремятся спасти.''',
      id: 2,
      url: "assets/images/bars.jpg"),
  PlaceList(name: "Æ", about: "", id: 3, url: "assets/images/ae.jpg"),
  PlaceList(
      name: "Портрет Косты Хетагурова",
      about: "",
      id: 4,
      url: "assets/images/kosta.jpg"),
  PlaceList(
      name: "Колесо Балсага",
      about: "",
      id: 5,
      url: "assets/images/koleso.jpg"),
  PlaceList(
      name: "Танец с кинжалами",
      about: "",
      id: 6,
      url: "assets/images/kaft.jpg"),
  PlaceList(
      name: "Стрелы Сослана",
      about: "",
      id: 7,
      url: "assets/images/strela.jpg"),
  PlaceList(
      name: "Скамья в виде рога",
      about: "",
      id: 8,
      url: "assets/images/rog.jpg"),
  PlaceList(
      name: "Хъисын фандыр", about: "", id: 9, url: "assets/images/fandr.jpg"),
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
            itemExtent: 425,
            itemBuilder: (BuildContext context, int index) {
              final person = _searchPlace[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  splashColor: Colors.lightBlue[50],
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlaceAboutWidget(id: index, place: place[index]),
                        ));
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
                            person.name,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            place[index].url,
                            height: 340,
                          ),
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
