import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plantao_mob/model/plantao_list.dart';
import 'package:plantao_mob/pages/auth_page.dart';
import 'package:provider/provider.dart';
import 'utils/app_routes.dart';
import 'screen/tabs_screen.dart';
import 'model/auth.dart';

main() => runApp(PlantaoApp());

class PlantaoApp extends StatelessWidget {
  PlantaoApp({Key? key}) : super(key: key);
  final ThemeData tema = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PlantaoList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: const Color.fromARGB(255, 10, 60, 100),
            secondary: const Color.fromARGB(255, 65, 63, 59),
          ),
          textTheme: tema.textTheme.copyWith(
            headline6: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            button: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'OpensSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        routes: {
          AppRoutes.AUTH: (context) => const AuthPage(),
          AppRoutes.HOME: (context) => const TabsScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
