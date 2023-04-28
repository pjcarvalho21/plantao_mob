import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plantao_mob/data/dummy_data.dart';
import 'package:plantao_mob/model/plantao.dart';

class PlantaoList with ChangeNotifier {
  // O provider usar o changeNotifier para a questão de reatividade
  final _url =
      'https://www2.mppa.mp.br/plantao-api/api/v1/listaplantao/consulta?token=d2ViQXBwLjUwOGE1NTUubXBwYS5tcC5icjo3QkZDNjdBNUUzQjU3MzZEQTgxNzdGODc1NDMzQg&page=0&size=10&inicio=01/02/2023&fim=28/02/2023&grupo=GERAL';
  final List<Plantao> _items = dummyPlantoes;
  List<Plantao> get items => [..._items]; //clone dos itens

  Future<void> loadPlantoes() async {
    final response = await http.get(Uri.parse(_url));
    print(jsonDecode(response.body));
  }
}
