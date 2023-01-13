import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preferences/preferences/preferences.dart';

class Zombie extends StatefulWidget {
  static const String route = 'zombie';
  @override
  State<Zombie> createState() => _ZombieState();
}

class _ZombieState extends State<Zombie> {
  final playerzombie = AudioPlayer();
  final playerzombie2 = AudioPlayer();
  int vidaZombie = 100;

  void initState() {
    super.initState();
    playerzombie.play(AssetSource("zombiefondo.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Boss Zombie -- Danger',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            children: [
              Container(
                width: 412,
                height: 150,
                color: Colors.red,
                child: Row(
                  children: [
                    Container(
                      width: 205,
                      height: 150,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Text(
                            "Vida del Zombie: ${Preferences.vidaRestanteZombie} / ${vidaZombie}",
                            style: TextStyle(color: Colors.cyan, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 206,
                      height: 150,
                      color: Colors.cyan,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  calcularVida();
                }, // Handle your callback
                child: Ink(
                  height: 520,
                  width: 412,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Center(
                      child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/zombie.gif"),
                            fit: BoxFit.contain)),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  calcularVida() {
    print("hola");
    Preferences.vidaRestanteZombie =
        Preferences.vidaRestanteZombie - Preferences.damagePerClick;
    Preferences.totalClicks += 1;
    Preferences.coins += Preferences.damagePerClick;
    setState(() {});
  }
}
