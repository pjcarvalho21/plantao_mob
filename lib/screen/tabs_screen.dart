

import 'package:flutter/material.dart';
import 'plantao_previsto_screan.dart';
import 'plantao_realizado_screen.dart';
import '../model/plantao.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
      List<Plantao> plantoes = [
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
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title:const Text("Meus Plantões"),
          bottom:  TabBar(
            indicatorColor: Theme.of(context).colorScheme.secondary,
            tabs: const [
              Tab(
                icon: Icon(Icons.access_alarm),
                text: "Previstos",
                ),
              Tab(
                icon: Icon(Icons.remove_circle_sharp),
                text: "Realizados",
                ),
            ],
            ),
           ),
           body:TabBarView(
            children: [
               PlantaoPrevistoScreen(plantoes: plantoes),
               PlantaoRealizadoScreen(plantoes: plantoes)
            ],),
            ),
      
      
      );
  }
}