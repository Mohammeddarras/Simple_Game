import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          centerTitle: true,
          title: Text('تطابق الصور'),
          backgroundColor: Colors.indigo,
        ),
        body: imagePage(),
      ),
    );
  }
}

class imagePage extends StatefulWidget {
  @override
  _imagePageState createState() => _imagePageState();
}

class _imagePageState extends State<imagePage> {
  int leftImageGame = 1;
  int rightImageGame = 2;

  void changeImage (){
    leftImageGame = Random().nextInt(8) + 1;
    rightImageGame = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageGame == rightImageGame? 'لقد نجحت' : 'حاول مرة اخرى' ,
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: FlatButton(
                  child: Image.asset('images/game$leftImageGame.png'),
                  onPressed: () {
                    setState(() {
                     changeImage();
                    });
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Image.asset('images/game$rightImageGame.png'),
                  onPressed: () {
                    setState(() {
                      changeImage();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
