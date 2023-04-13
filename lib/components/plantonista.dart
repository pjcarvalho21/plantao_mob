import 'package:flutter/material.dart';

class Plantonista extends StatelessWidget {
  final String plantonista;
  final String local;

  const Plantonista(
      {super.key, required this.plantonista, required this.local});

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
                plantonista,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text("Local: " + local),
            ),
            SizedBox(
              height: 29,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text(
                      'Realizados',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 70, 68, 68),
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
