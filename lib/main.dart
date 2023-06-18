import 'package:fiagdon/Basik/basik_display.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAahq1Tnx07FG80mN8kHvC-gcClbsXqxNM",
          appId: "1:1074684987905:android:49474ae229963093e18e00",
          messagingSenderId: "1074684987905",
          projectId: "fiagdon-91eab",
          storageBucket:
              "fiagdon-91eab.appspot.com")); // инициализация Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Осетия',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const BasikDisplayWidget(),
      },
      initialRoute: "/",
    );
  }
}
