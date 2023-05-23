import 'package:fiagdon/Home/homeClass.dart';
import 'package:fiagdon/Home/home_about.dart';
import 'package:flutter/material.dart';

final List<HomeClass> home = [
  HomeClass(
      name: "Orange roof",
      about: "Коттедж в фиагдоне",
      price: 15000,
      location: "Фиагдон",
      sleepingPlaces: 18),
  HomeClass(
      name: "Dom Fiagdon",
      about: "Семейный отдых в горах",
      price: 15000,
      location: "Фиагдон",
      sleepingPlaces: 8),
];

class HomeDisplayWidget extends StatelessWidget {
  const HomeDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemCount: home.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: InkWell(
                  splashColor: Colors.lightBlue[50],
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeAbout(id: index, list: home[index]),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 199, 230, 255),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              // Верхний левый угол
                              topLeft: Radius.circular(10),
                              // Нижний левый угол
                              bottomLeft: Radius.circular(5),
                              // Верхний правый угол
                              topRight: Radius.circular(10),
                              // Нижний првый угол
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          width: double.infinity,
                          height: 150,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            home[index].name,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${home[index].price} р/сутки",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${home[index].sleepingPlaces} спальных мест",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Позвонить'))),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Написать'))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
