class AuthException implements Exception {
  static const Map<String, String> erros = {
    "access_denied": "Usuário não registrado!",
    "INVALID_PASSWORD": "Senha informada não confere.",
    "USER_DISABLED": "Login desabilitado.",
  };
  final String key;
  AuthException(this.key);

  @override
  String toString() {
    return erros[key] ?? 'Ocorreu um erro no processo de autenticação!';
  }
}
