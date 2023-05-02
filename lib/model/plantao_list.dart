import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:plantao_mob/data/dummy_data.dart';
import 'package:plantao_mob/model/plantao.dart';

class PlantaoList with ChangeNotifier {
  // O provider usar o changeNotifier para a questão de reatividade
  final _url =
      'https://www2.mppa.mp.br/plantao-api/api/v1/listaplantao/consulta?token=d2ViQXBwLjUwOGE1NTUubXBwYS5tcC5icjo3QkZDNjdBNUUzQjU3MzZEQTgxNzdGODc1NDMzQg&page=0&size=10&grupo=GERAL&nome=CARLOS HENRIQUE';
  final List<Plantao> _items = [];
  List<Plantao> get items => [..._items]; //clone dos itens

  Future<void> loadPlantoes() async {
    final response = await http.get(Uri.parse(_url));
    Map<String, dynamic> data = jsonDecode(response.body);
    for (var element in data['content']) {
      DateTime date = DateFormat("dd/MM/yyyy").parse(element['data']);
      print(date);

      _items.add(Plantao(id: element['id'], data: date));
    }
    ;
    notifyListeners();
  }
}
