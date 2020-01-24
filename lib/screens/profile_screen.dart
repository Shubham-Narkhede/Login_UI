import 'package:flutter/material.dart';
import 'package:my_personal_app/InputData/inputData.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  Future addData() {
    _offsetPopup();
  }

  Widget _offsetPopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text(
              "Flutter Open",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Text(
              "Flutter Tutorial",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
        ],     
        icon: Icon(Icons.library_add),
        offset: Offset(0, 100),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InputData.yourAppbar("title", Icon(Icons.add), addData),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF73AEF5),
            Color(0xFF61A4F1),
            Color(0xFF478DE0),
            Color(0xFF398AE5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.4, 0.7, 0.9],
        )),
      ),
    );
  }
}
