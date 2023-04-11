import 'package:flutter/material.dart';

main()=>runApp(const PlantaoApp());

class PlantaoApp extends StatelessWidget {
  const PlantaoApp({Key? key}) : super(key: key);  
  
  @override
   Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
}
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  
}

