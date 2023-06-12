import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyImageWidget extends StatefulWidget {
  final String imagePath;

  const MyImageWidget({Key? key, required this.imagePath}) : super(key: key);

  @override
  _MyImageWidgetState createState() => _MyImageWidgetState();
}

class _MyImageWidgetState extends State<MyImageWidget> {
  String imageUrl = "";

  @override
  void initState() {
    super.initState();
    getImageUrl();
  }

  void getImageUrl() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Пользователь не аутентифицирован
      return;
    }

    final ref = FirebaseStorage.instance
        .ref()
        .child('gs://fiagdon-91eab.appspot.com/bilet.png');
    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: imageUrl != null
          ? Image.network(imageUrl)
          : CircularProgressIndicator(),
    );
  }
}
