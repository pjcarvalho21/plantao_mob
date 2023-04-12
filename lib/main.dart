import 'package:flutter/material.dart';
import 'components/plantao_list.dart';
import 'components/plantonista.dart';
import 'model/plantao.dart';

main() => runApp(PlantaoApp());

class PlantaoApp extends StatelessWidget {
  PlantaoApp({Key? key}) : super(key: key);
  final ThemeData tema = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: const Color.fromARGB(255, 10, 60, 100),
          secondary: const Color.fromARGB(255, 65, 63, 59),
        ),
        textTheme: tema.textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
          ),
          button: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpensSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final List<Plantao> _plantoes = [];

  final _plantoes = [
    Plantao(
      id: 1,
      data: DateTime.now().add(const Duration(days: 5)),
      local: "DAP",
      plantonista: 'Paulo J. Carvalho',
      tipoPlantonista: 'Servidor DAP',
      status: 'R',
    ),
    Plantao(
      id: 2,
      data: DateTime.now(),
      local: "DAP",
      plantonista: 'Paulo J. Carvalho',
      tipoPlantonista: 'Servidor DAP',
      status: 'P',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Plantões'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Plantonista(
                plantonista: _plantoes[0].plantonista,
                local: _plantoes[0].local),
            PlantaoList(plantoes: _plantoes),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
