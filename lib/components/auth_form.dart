import 'package:flutter/material.dart';
import 'package:plantao_mob/model/auth.dart';
import 'package:provider/provider.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> authData = {'login': '', 'password': ''};
    final deviceSize = MediaQuery.of(context).size;
    final formkey = GlobalKey<FormState>();
    bool isLoading = false;

    Future<void> submit() async {
      final isValid = formkey.currentState?.validate() ?? false;
      if (!isValid) {
        return;
      }
      setState(() => isLoading = true);
      formkey.currentState?.save();
      Auth auth = Provider.of(context, listen: false);
      await auth.login(authData['login']!, authData['password']!);
      setState(() => isLoading = false);
    }

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 300,
        width: deviceSize.width * 0.75,
        child: Form(
          key: formkey,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Login:'),
              keyboardType: TextInputType.name,
              onSaved: (login) => authData['login'] = login ?? '',
              validator: (isLogin) {
                final login = isLogin ?? '';
                if (login.trim().isEmpty) {
                  return 'Informe o login';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Senha:'),
              keyboardType: TextInputType.name,
              onSaved: (password) => authData['password'] = password!,
              validator: (isPassword) {
                final password = isPassword ?? '';
                if (password.isEmpty) {
                  return 'Informe a senha';
                }
                return null;
              },
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            if (isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: submit,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                ),
                child: const Text("ENTRAR"),
              ),
          ]),
        ),
      ),
    );
  }
}
