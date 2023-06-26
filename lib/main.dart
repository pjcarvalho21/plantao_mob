import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plantao_mob/model/device.dart';
import 'package:plantao_mob/model/plantao_list.dart';
import 'package:plantao_mob/pages/auth_or_home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'http/web.dart';
import 'utils/app_routes.dart';
import 'model/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('Autorizado.${settings.authorizationStatus}');
    _startPushNotificationHandler(messaging);
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('Concedido provisioriamente.${settings.authorizationStatus} ');
  } else {
    print('Não Autorizado.${settings.authorizationStatus} ');
    _startPushNotificationHandler(messaging);
  }

  runApp(PlantaoApp());
}

void _startPushNotificationHandler(FirebaseMessaging messaging) async {
  String? token = await messaging.getToken();
  print('TOKEN:$token');
  _setPushToken(token);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Dados da mensagem em background: ${message.notification}');
    if (message.notification != null) {
      print(
          'A mensagem contém uma notificação:${message.notification!.title},${message.notification!.body}');
    }
  });
  //Background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //Terminated
  var data = await FirebaseMessaging.instance.getInitialMessage();
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('${message.notification}');
}

void _setPushToken(String? token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? prefsToken = prefs.getString('pushToken');
  bool? prefSent = prefs.getBool('tokenSent');

  if (prefsToken != token || (prefsToken == token && prefSent == false)) {
    print('Enviando token par o servidor...');
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? brand;
    String? model;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('rodando no ${androidInfo.model}');
      model = androidInfo.model;
      brand = androidInfo.brand;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('rodando no ${iosInfo.model}');
      model = iosInfo.model;
      brand = 'Apple';
    }

    Device device = Device(
      brand: brand,
      model: model,
      token: token,
    );

    sendDevice(device);
  } else {
    print('Token já existente!');
  }
}

class PlantaoApp extends StatelessWidget {
  PlantaoApp({Key? key}) : super(key: key);
  final ThemeData tema = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, PlantaoList>(
          create: (_) => PlantaoList(""),
          update: (ctx, auth, previous) {
            return PlantaoList(auth.usuario ?? '');
          },
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
          AppRoutes.AUTH: (context) => const AuthOrHomePage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
