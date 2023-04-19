import 'package:flutter/material.dart';
import '../model/plantao.dart';
import 'package:intl/intl.dart';

class PlantaoListPrevistos extends StatelessWidget {
  final List<Plantao> plantoes;

  const PlantaoListPrevistos({super.key, required this.plantoes});

  @override
  Widget build(BuildContext context) {
    List<Plantao> plantoesPrevistos = [];
    plantoesPrevistos.addAll(plantoes);
    plantoesPrevistos.retainWhere((plt) {
      return plt.data.isAfter(DateTime.now());
    });
    return SizedBox(
      height: 600,
      child: plantoesPrevistos.isEmpty
          ? Column()
          : ListView.builder(
              itemCount: plantoesPrevistos.length,
              itemBuilder: (ctx, index) {
                final tr = plantoesPrevistos[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 41, 51, 104),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            'PRV',
                            style: TextStyle(
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
