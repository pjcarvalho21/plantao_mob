import 'dart:math';

import 'package:flutter/material.dart';
import '../model/plantonista.dart';

class PlantonistaScreen extends StatelessWidget {
  const PlantonistaScreen({super.key, required this.plantonista});
  final Plantonista plantonista;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              plantonista.nome,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              plantonista.local,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              plantonista.tipoPlantonista,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ]),
    );
  }
}
