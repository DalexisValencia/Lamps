import 'package:flutter/material.dart';
import 'package:second_test/Screens/Home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFFFFFFFF), //blanco
          //primaryColorDark: Color(0xbfbfbf),//Gris
          primaryColorDark: Colors.grey[400], //Gris
          backgroundColor: Color(0xFFb99eb7), //purpura
          textSelectionColor: Color(0xFF000000) //negro
          //brightness: Color(0xFFb99eb7)
          ),
      home: HomePageScaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}
