import 'package:fiagdon/Place/PlaceList.dart';
import 'package:flutter/material.dart';

class PlaceAboutWidget extends StatelessWidget {
  final int id;
  final PlaceList place;
  const PlaceAboutWidget({super.key, required this.id, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(place.name)),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        place.url,
                        width: double.infinity,
                      ),
                    ),
                    Text(
                      place.about,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ]);
          },
        ));
  }
}
