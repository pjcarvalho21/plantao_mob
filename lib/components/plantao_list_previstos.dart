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
      height: 750,
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
                    leading: PhysicalModel(
                      color: Colors.black,
                      elevation: 12.0,
                      shape: BoxShape.circle,
                      child: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 71, 134, 185),
                        radius: 25,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor:
                              const Color.fromARGB(255, 10, 60, 100),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: FittedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.alarm_add,
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
