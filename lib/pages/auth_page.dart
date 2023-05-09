import 'package:flutter/material.dart';
import 'package:plantao_mob/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 14, 98, 172),
              Color.fromRGBO(11, 80, 114, 0.482),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 2,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 152, 150, 155),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black26,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  '     Meus Plantões     ',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Anton',
                      color:
                          Theme.of(context).accentTextTheme.headline6?.color),
                ),
              ),
              const AuthForm(),
              Image.asset("assets/images/logo_mppa.png"),
            ],
          ),
        ),
      ]),
    );
  }
}
