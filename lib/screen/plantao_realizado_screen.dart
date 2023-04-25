import 'package:flutter/material.dart';
import '../components/plantao_list_realizados.dart';
import '../model/plantao.dart';

// ignore: must_be_immutable
class PlantaoRealizadoScreen extends StatelessWidget {
    List<Plantao> plantoes = [];
    PlantaoRealizadoScreen({super.key, required this.plantoes});
 

  List<Plantao> _selectPlantoesRealizados(BuildContext context) {
   

    List<Plantao> plantoesRealizados = [];
    plantoesRealizados.addAll(plantoes);
    plantoesRealizados.retainWhere((element) {
      return element.data.isBefore(DateTime.now());
    });
    return plantoesRealizados;
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
            PlantaoListRealizados(plantoes: _selectPlantoesRealizados(context)),
          ],
        ),
      );
    
  }
}
