import 'package:flutter/material.dart';
import 'package:wemodemo/Data.dart';

void main() {
  runApp(
    new HomePage(),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WEMO DEMO",
      home: new WemoApp()
    );
  }
}