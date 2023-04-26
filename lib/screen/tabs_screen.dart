import 'package:flutter/material.dart';
import 'package:plantao_mob/model/plantonista.dart';
import 'plantao_previsto_screan.dart';
import 'plantao_realizado_screen.dart';
import '../model/plantao.dart';
import 'package:plantao_mob/components/main_drawer.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Plantonista plantonista =
        Plantonista(1, 'DAP', 'Paulo J. Carvalho', 'Servidor');
    List<Plantao> plantoes = [
      Plantao(
        id: 1,
        data: DateTime.now().add(const Duration(days: 5)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now(),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: -20)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 2)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: -15)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 15)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 1)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 2)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: -15)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 15)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 1)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 2)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: -15)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 15)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 1)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 1)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 2)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: -15)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 15)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 1)),
      ),
      Plantao(
        id: 1,
        data: DateTime.now().add(const Duration(days: 5)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now(),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: -20)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 2)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: -15)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 15)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 1)),
      ),
      Plantao(
        id: 2,
        data: DateTime.now().add(const Duration(days: 2)),
      ),
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meus Plantões"),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Theme.of(context).colorScheme.secondary,
            tabs: const [
              Tab(
                icon: Icon(Icons.alarm_add),
                text: "Previstos",
              ),
              Tab(
                icon: Icon(Icons.check_box),
                text: "Realizados",
              ),
            ],
          ),
        ),
        drawer: MainDrawer(
          plantonista: plantonista,
        ),
        body: TabBarView(
          children: [
            PlantaoPrevistoScreen(plantoes: plantoes),
            PlantaoRealizadoScreen(plantoes: plantoes)
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.black12,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.alarm,
                    color: Theme.of(context).accentColor,
                  ),
                  const Text('Ministério Público do Estado do Pará'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
