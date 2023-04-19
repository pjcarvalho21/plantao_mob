import 'package:flutter/material.dart';
import '../model/plantao.dart';
import 'package:intl/intl.dart';

class PlantaoListRealizados extends StatelessWidget {
  final List<Plantao> plantoes;

  const PlantaoListRealizados({super.key, required this.plantoes});

  @override
  Widget build(BuildContext context) {
    List<Plantao> plantoesRealizados = [];
    plantoesRealizados.addAll(plantoes);
    plantoesRealizados.retainWhere((plt) {
      return plt.data.isBefore(DateTime.now());
    });
    return SizedBox(
      height: 600,
      child: plantoesRealizados.isEmpty
          ? Column()
          : ListView.builder(
              itemCount: plantoesRealizados.length,
              itemBuilder: (ctx, index) {
                final tr = plantoesRealizados[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 129, 126, 126),
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            'RLZ',
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
