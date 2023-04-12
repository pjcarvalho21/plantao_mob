import 'package:flutter/material.dart';

class Plantonista extends StatelessWidget {
  final String plantonista;
  final String local;

  const Plantonista(
      {super.key, required this.plantonista, required this.local});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        child: ListTile(
          title: Text(
            plantonista,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(local),
        ));
  }
}
