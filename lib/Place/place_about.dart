import 'package:fiagdon/Place/PlaceList.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_launchGoogleMaps(String location) async {
  final uri = Uri.parse(location);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

class PlaceAboutWidget extends StatelessWidget {
  final int id;
  final PlaceList place;
  const PlaceAboutWidget({super.key, required this.id, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const SizedBox(
                width: 65,
              ),
              Center(child: Text(place.name)),
            ],
          ),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        place.about,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => _launchGoogleMaps(place.location),
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const Size(200, 50)),
                      ),
                      child: const Text(
                        "Маршрут",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]);
          },
        ));
  }
}
