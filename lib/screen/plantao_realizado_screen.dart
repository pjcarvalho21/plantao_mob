import 'package:flutter/material.dart';
import '../components/plantao_list_realizados.dart';
import '../components/plantonista.dart';
import '../model/plantao.dart';

class PlantaoRealizadoScreen extends StatelessWidget {
  const PlantaoRealizadoScreen({super.key});

  List<Plantao> _selectPlantoesRealizados(BuildContext context) {
    final List<Plantao> plantoes =
        ModalRoute.of(context)!.settings.arguments as List<Plantao>;

    List<Plantao> plantoesRealizados = [];
    plantoesRealizados.addAll(plantoes);
    plantoesRealizados.retainWhere((element) {
      return element.data.isBefore(DateTime.now());
    });
    return plantoesRealizados;
  }

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
                plantoes: _selectPlantoesRealizados(context), tipoLista: ""),
            PlantaoListRealizados(plantoes: _selectPlantoesRealizados(context)),
          ],
        ),
      ),
    );
  }
}
