import 'package:flutter/material.dart';
import 'package:flutter_preferences/pages/black.dart';
import 'package:flutter_preferences/pages/boss_list.dart';
import 'package:flutter_preferences/pages/dragon.dart';

import 'package:flutter_preferences/pages/home_screen.dart';
import 'package:flutter_preferences/pages/tienda.dart';
import 'package:flutter_preferences/pages/zombie.dart';
import 'package:flutter_preferences/preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
      routes: {
        Boss_List.routeName: (context) => Boss_List(),
        Zombie.routeName: (context) => Zombie(), // rutas de las paginas
        Tienda.routeName: (context) => Tienda(),
        Dragon.routeName: (context) => Dragon(),
        Black.routeName: (context) => Black(),
      },
    );
  }
}
