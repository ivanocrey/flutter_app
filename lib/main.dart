import 'package:flutter/material.dart';
import './screen/ds_screen.dart';
import './screen/detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.black38,
      ),
      home: Dashboard(),
      routes: {
        Detail.routeName : (ctx) => Detail()
      },
    );
  }
}
