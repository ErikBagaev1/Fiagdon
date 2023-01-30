import 'package:fiagdon/Basik/basik_display.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDWhmxnklL73elt1x2lsbi6uG8LWPfiYJQ",
    appId: "1:796201984509:android:662fb9ec35b2c0a2d0f994",
    messagingSenderId: "796201984509",
    projectId: "fiagdon-9b1f1",
    storageBucket: "fiagdon-9b1f1.appspot.com",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Осетия',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => BasikDisplayWidget(),
      },
      initialRoute: "/",
    );
  }
}
