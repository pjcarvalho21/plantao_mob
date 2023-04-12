import 'package:flutter/material.dart';
import '../model/plantao.dart';
import 'package:intl/intl.dart';

class PlantaoList extends StatelessWidget {
  final List<Plantao> plantoes;
  const PlantaoList({super.key, required this.plantoes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430,
      child: plantoes.isEmpty
          ? Column()
          : ListView.builder(
              itemCount: plantoes.length,
              itemBuilder: (ctx, index) {
                final tr = plantoes[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: tr.status == 'R'
                          ? Color.fromARGB(255, 235, 2, 52)
                          : const Color.fromARGB(255, 14, 97, 165),
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '${tr.status}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      DateFormat('d MMM y').format(tr.data),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: const Text('Domingo'),
                  ),
                );
              }),
    );
  }
}
