import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preferences/pages/home_screen.dart';
import 'package:flutter_preferences/pages/zombie.dart';
import 'package:flutter_preferences/preferences/preferences.dart';

class Boss_List extends StatefulWidget {
  static const String routeName = 'bossList';
  @override
  State<Boss_List> createState() => _Boss_ListState();
}

class _Boss_ListState extends State<Boss_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 211, 80),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, 'tienda'),
              icon: Icon(Icons.monetization_on_rounded),
              iconSize: 40,
            ),
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.auto_mode_outlined))
          ],
          title: const Text(
            'Boss List  //  Shop  -->',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
            child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'zombie').then((value) => {});
                }, // Handle your callback
                child: Ink(
                  height: 75,
                  width: 412,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Center(
                      child: Container(
                    width: 412,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/zombiewallp.gif"),
                            fit: BoxFit.cover)),
                  )),
                ),
              ),
              Container(
                width: 412,
                height: 30,
                color: Colors.grey,
                child: Center(
                  child: Text("Estado: ${estadoZombie()}"),
                ),
              ),
              InkWell(
                onTap: () {
                  if (Preferences.derrotadoZombie == true) {
                    Navigator.pushNamed(context, 'dragon').then((value) => {});
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Aun no puede derrotar a esta criatura")));
                  }
                }, // Handle your callback
                child: Ink(
                  height: 75,
                  width: 412,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Center(
                      child: Container(
                    width: 412,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/dragon.gif"),
                            fit: BoxFit.cover)),
                  )),
                ),
              ),
              Container(
                width: 412,
                height: 30,
                color: Colors.grey,
                child: Center(
                  child: Text("Estado: ${estadoDragon()}"),
                ),
              ),
              InkWell(
                onTap: () {
                  if (Preferences.derrotadoDragon == true) {
                    Navigator.pushNamed(context, 'black').then((value) => {});
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Aun no puede derrotar a esta criatura")));
                  }
                }, // Handle your callback
                child: Ink(
                  height: 75,
                  width: 412,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Center(
                      child: Container(
                    width: 412,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/black.gif"),
                            fit: BoxFit.cover)),
                  )),
                ),
              ),
              Container(
                width: 412,
                height: 30,
                color: Colors.grey,
                child: Center(
                  child: Text("Estado: ${estadoBlack()}"),
                ),
              ),
            ],
          ),
        )));
  }

  estadoZombie() {
    String zombieEstado;
    if (Preferences.derrotadoZombie == true) {
      zombieEstado = "Derrotado";
    } else {
      zombieEstado = "Vivo";
    }
    return zombieEstado;
  }

  estadoDragon() {
    String dragonEstado;
    if (Preferences.derrotadoZombie == true) {
      dragonEstado = "Derrotado";
    } else {
      dragonEstado = "Vivo";
    }
    return dragonEstado;
  }

  estadoBlack() {
    String blackEstado;
    if (Preferences.derrotadoBlack == true) {
      blackEstado = "Derrotado";
    } else {
      blackEstado = "Vivo";
    }
    return blackEstado;
  }
}
