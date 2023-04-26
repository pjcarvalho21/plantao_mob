import 'package:flutter/material.dart';
import '../model/plantonista.dart';

class PlantonistaScreen extends StatelessWidget {
  const PlantonistaScreen({super.key, required this.plantonista});
  final Plantonista plantonista;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Color.fromARGB(255, 204, 201, 201))),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                plantonista.nome,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text("Local: ${plantonista.local}"),
            ),
            Row(
              children: [
                Text(
                  "    ${plantonista.tipoPlantonista} MPPA",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 141, 140, 140)),
                ),
              ],
            )
          ],
        ));
  }
}
