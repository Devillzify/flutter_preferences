import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preferences/preferences/preferences.dart';

class Black extends StatefulWidget {
  static const String routeName = 'black';
  @override
  State<Black> createState() => _BlackState();
}

class _BlackState extends State<Black> {
  // personaje mas, explicacion en la pagina de zombies
  final playerblack = AudioPlayer();
  final playerblack2 = AudioPlayer();
  final playerblack3 = AudioPlayer();
  int vidaBlack = Preferences.vidaboss3;
  var snackBar = SnackBar(content: Text("El boss ya ha sido eliminado"));

  void initState() {
    super.initState();
    playerblack.play(AssetSource("tot.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => playerblack.stop(), icon: Icon(Icons.music_note))
        ],
        backgroundColor: Colors.black,
        title: Text(
          'Boss Teach -- Danger',
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
                color: Colors.grey,
                child: Row(
                  children: [
                    Container(
                      width: 205,
                      height: 150,
                      color: Colors.grey,
                      child: Column(
                        children: [
                          Text(
                            "Vida de Teach \n${Preferences.vidaRestanteBlack} / ${vidaBlack} \nDamage per Click ${Preferences.damagePerClick}\nCoins: ${Preferences.coins}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: 206,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(Preferences.armaUrl),
                          fit: BoxFit.contain,
                        ))),
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
                    width: 520,
                    height: 412,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/black2.gif"),
                            fit: BoxFit.cover)),
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
    if (Preferences.vidaRestanteBlack <= 0) {
      Preferences.vidaRestanteBlack = 0;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      playerblack.stop();
    } else {
      playerblack2.play(AssetSource("teach.mp3"));
      Preferences.vidaRestanteBlack =
          Preferences.vidaRestanteBlack - Preferences.damagePerClick;
      Preferences.totalClicks += 1;
      Preferences.coins += Preferences.damagePerClick;
      if (Preferences.vidaRestanteBlack <= 0) {
        playerblack.stop();
        playerblack3.play(AssetSource("zelda.mp3"));
        Preferences.derrotadoBlack = true;
      }
    }

    setState(() {});
  }
}
