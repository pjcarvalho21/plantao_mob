import 'package:flutter/material.dart';
import '../components/plantao_list_previstos.dart';
import '../model/plantao.dart';

// ignore: must_be_immutable
class PlantaoPrevistoScreen extends StatelessWidget {
  List<Plantao> plantoes = [];
  PlantaoPrevistoScreen({super.key, required this.plantoes});

  List<Plantao> _selectPlantoesRealizados(BuildContext context) {
    List<Plantao> plantoesPrevistos = [];
    plantoesPrevistos.addAll(plantoes);
    plantoesPrevistos.retainWhere((element) {
      return element.data.isAfter(DateTime.now());
    });
    return plantoesPrevistos;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PlantaoListPrevistos(plantoes: _selectPlantoesRealizados(context)),
        ],
      ),
    );
  }
}
