import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:plantao_mob/model/plantao.dart';

class PlantaoList with ChangeNotifier {
  // O provider usar o changeNotifier para a questão de reatividade

  final List<Plantao> _items = [];
  List<Plantao> get items => [..._items]; //clone dos itens
  String? _usuario;

  PlantaoList(this._usuario);

  Future<void> loadPlantoes() async {
    String url =
        "https://www2.mppa.mp.br/plantao-api/api/v1/listaplantao/consulta?token=d2ViQXBwLjUwOGE1NTUubXBwYS5tcC5icjo3QkZDNjdBNUUzQjU3MzZEQTgxNzdGODc1NDMzQg&page=0&size=10&grupo=GERAL&nome=${_usuario}";
    //print(_usuario);
    final response = await http.get(Uri.parse(url));
    Map<String, dynamic> data = jsonDecode(response.body);
    for (var element in data['content']) {
      DateTime date = DateFormat("dd/MM/yyyy").parse(element['data']);
      _items.add(Plantao(
          id: element['id'],
          nome: element['nome'],
          tipoPlantonista: element['tipoPlantonista'],
          local: element['local'],
          data: date));
    }
    ;
    notifyListeners();
  }
}
