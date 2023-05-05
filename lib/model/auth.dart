import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plantao_mob/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  static const _url = 'https://www2.mppa.mp.br/ssomppa-api/oauth/token';
  String? _token;
  String? _refresh_token;
  String? _login;
  DateTime? _expiryDate;
  String? usuario;

  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get logining {
    return isAuth ? _login : null;
  }

  String? get refreshToken {
    return isAuth ? _refresh_token : null;
  }

  Future<void> _authenticate(String login, String password) async {
    Map params = {
      'grant_type': 'password',
      'username': login,
      'client_id': 'webApp.508a555.mppa.mp.br',
      'password': base64.encode(utf8.encode(password)),
    };

    final header = {
      "Authorization":
          "Basic d2ViQXBwLjUwOGE1NTUubXBwYS5tcC5icjo3QkZDNjdBNUUzQjU3MzZEQTgxNzdGODc1NDMzQg==",
      "Content-Type": "application/x-www-form-urlencoded",
    };
    final response =
        await http.post(Uri.parse(_url), headers: header, body: params);

    //print("Response Status: ${response.statusCode}");
    print("Response body:${response.body}");
    final body = jsonDecode(response.body);

    String _decodeBase64(String str) {
      String output = str.replaceAll('-', '+').replaceAll('_', '/');

      switch (output.length % 4) {
        case 0:
          break;
        case 2:
          output += '==';
          break;
        case 3:
          output += '=';
          break;
        default:
          throw Exception('Illegal base64url string!"');
      }

      return utf8.decode(base64Url.decode(output));
    }

    Map<String, dynamic> parseJwt(String token) {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('invalid token');
      }

      final payload = _decodeBase64(parts[1]);
      final payloadMap = json.decode(payload);
      if (payloadMap is! Map<String, dynamic>) {
        throw Exception('invalid payload');
      }

      return payloadMap;
    }

    if (body['error'] != null) {
      throw AuthException(body['error']);
    } else {
      _token = body['access_token'];
      Map<String, dynamic> decodedToken = parseJwt(_token!);
      usuario = decodedToken['sub']['name'];
      _refresh_token = body['refresh_token'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse('12587'),
        ),
      );
      notifyListeners();
    }
  }

  Future<void> login(String login, String password) async {
    return _authenticate(login, password);
  }

  void logout() {
    _token = null;
    _refresh_token = null;
    _login = null;
    _expiryDate = null;
    usuario = null;
    notifyListeners();
  }
}
