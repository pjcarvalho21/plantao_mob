import 'package:flutter/material.dart';

class PlantaoOffListScreen extends StatelessWidget {
  const PlantaoOffListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previstos'),
      ),
      body: const Center(
        child: Text('Plantões Já realizados'),
      ),
    );
  }
}
