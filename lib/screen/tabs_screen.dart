import 'package:flutter/material.dart';
import 'package:plantao_mob/model/plantao_list.dart';
import 'package:plantao_mob/model/plantonista.dart';
import 'package:provider/provider.dart';
import 'plantao_previsto_screan.dart';
import 'plantao_realizado_screen.dart';
import '../model/plantao.dart';
import 'package:plantao_mob/components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  Plantonista plantonista = new Plantonista("", "", "");
  @override
  void initState() {
    super.initState();
    Provider.of<PlantaoList>(context, listen: false).loadPlantoes();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlantaoList>(context);
    List<Plantao> carregarPlantoes = provider.items;
    if (carregarPlantoes.isNotEmpty) {
      plantonista = Plantonista(carregarPlantoes[0].nome,
          carregarPlantoes[0].local, carregarPlantoes[0].tipoPlantonista);
    }

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
            PlantaoPrevistoScreen(plantoes: carregarPlantoes),
            PlantaoRealizadoScreen(plantoes: carregarPlantoes)
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
