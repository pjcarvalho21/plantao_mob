import 'package:flutter/material.dart';
import '../model/plantao.dart';
import 'package:intl/intl.dart';

class PlantaoList extends StatelessWidget {
  final List<Plantao> plantoes;
  const PlantaoList({super.key, required this.plantoes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
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
                      backgroundColor: tr.data.isAfter(DateTime.now())
                          ? Color.fromARGB(255, 177, 177, 177)
                          : Color.fromARGB(255, 3, 3, 3),
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            tr.data.isAfter(DateTime.now()) ? 'PRV' : 'RLZ',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      DateFormat("d 'de' MMMM 'de' y", "pt_BR").format(tr.data),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(DateFormat("EEEE", "pt_BR").format(tr.data)),
                  ),
                );
              }),
    );
  }
}
