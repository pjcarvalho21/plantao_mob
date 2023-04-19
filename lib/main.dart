import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plantao_mob/screen/plantao_realizado_screen.dart';
import 'components/plantao_list_previstos.dart';
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
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      routes: {'/plantao-lista': (context) => const PlantaoRealizadoScreen()},
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
    ),
    Plantao(
      id: 2,
      data: DateTime.now(),
      local: "DAP",
      plantonista: 'Paulo J. Carvalho',
      tipoPlantonista: 'Servidor DAP',
    ),
    Plantao(
      id: 2,
      data: DateTime.now().add(const Duration(days: -20)),
      local: "DAP",
      plantonista: 'Paulo J. Carvalho',
      tipoPlantonista: 'Servidor DAP',
    ),
    Plantao(
      id: 2,
      data: DateTime.now().add(const Duration(days: 2)),
      local: "DAP",
      plantonista: 'Paulo J. Carvalho',
      tipoPlantonista: 'Servidor DAP',
    ),
    Plantao(
      id: 2,
      data: DateTime.now().add(const Duration(days: -15)),
      local: "DAP",
      plantonista: 'Paulo J. Carvalho',
      tipoPlantonista: 'Servidor DAP',
    ),
    Plantao(
      id: 2,
      data: DateTime.now().add(const Duration(days: 15)),
      local: "DAP",
      plantonista: 'Paulo J. Carvalho',
      tipoPlantonista: 'Servidor DAP',
    ),
    Plantao(
      id: 2,
      data: DateTime.now().add(const Duration(days: 1)),
      local: "DAP",
      plantonista: 'Paulo J. Carvalho',
      tipoPlantonista: 'Servidor DAP',
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
              plantoes: _plantoes,
              tipoLista: "ver realizados",
            ),
            PlantaoListPrevistos(plantoes: _plantoes),
          ],
        ),
      ),
    );
  }
}
