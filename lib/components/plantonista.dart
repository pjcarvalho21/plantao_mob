import 'package:flutter/material.dart';
import '../model/plantao.dart';

class Plantonista extends StatelessWidget {
  List<Plantao> plantoes = [];
  String tipoLista = "";
  Plantonista({super.key, required this.plantoes, required this.tipoLista});

  void _selectListPlantaoOff(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/plantao-lista',
      arguments: plantoes,
    );
  }

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
                plantoes[0].plantonista,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text("Local: ${plantoes[0].local}"),
            ),
            SizedBox(
              height: 29,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text(
                      tipoLista,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 70, 68, 68),
                      ),
                    ),
                    onPressed: () => _selectListPlantaoOff(context),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
