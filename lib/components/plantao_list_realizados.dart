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
      height: 750,
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
                    leading: PhysicalModel(
                      color: Colors.black,
                      elevation: 12,
                      shape: BoxShape.circle,
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 20, 121, 10),
                        radius: 25,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 36, 141, 15),
                          radius: 22,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: FittedBox(
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                ],
                              ),
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
