import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url = 'https://www2.mppa.mp.br/ssomppa-api/oauth/token';

  Future<void> _authenticate(String login, String password) async {
    Map params = {
      'grant_type': 'password',
      'username': login,
      'client_id': 'webApp.508a555.mppa.mp.br',
      'password': base64.encode(utf8.encode(password)),
    };

    //var _body = jsonEncode(params);
    // print("Json enviado ${_body}");
    final header = {
      "Authorization":
          "Basic d2ViQXBwLjUwOGE1NTUubXBwYS5tcC5icjo3QkZDNjdBNUUzQjU3MzZEQTgxNzdGODc1NDMzQg==",
      "Content-Type": "application/x-www-form-urlencoded",
    };
    final response =
        await http.post(Uri.parse(_url), headers: header, body: params);

    print("Response Status: ${response.statusCode}");
    print("Response body:${response.body}");
    //   body: jsonEncode({
    //     'login': login,
    //     'password': password,
    //     'returnSecureToken': true,
    //   }),
    // );
    // print(jsonDecode(response.body));
  }

  Future<void> login(String login, String password) async {
    _authenticate(login, password);
  }
}
