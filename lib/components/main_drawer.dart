import 'package:flutter/material.dart';
import 'package:plantao_mob/model/plantonista.dart';
import 'package:plantao_mob/screen/plantonista_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.plantonista});
  final Plantonista plantonista;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: const Color.fromARGB(255, 10, 60, 100),
          alignment: Alignment.bottomCenter,
          child: const Text(
            'Plantões',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        PlantonistaScreen(plantonista: plantonista),
      ]),
    );
  }
}
