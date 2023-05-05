import 'package:flutter/widgets.dart';
import 'package:plantao_mob/model/auth.dart';
import 'package:plantao_mob/pages/auth_page.dart';
import 'package:provider/provider.dart';

import '../screen/tabs_screen.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? const TabsScreen() : const AuthPage();
  }
}
