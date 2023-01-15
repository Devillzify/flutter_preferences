import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preferences/preferences/preferences.dart';

class Dragon extends StatefulWidget {
  static const String routeName = 'dragon';
  @override
  State<Dragon> createState() => _DragonState();
}

class _DragonState extends State<Dragon> {
  // pagina de personaje, explicacion en la pagian de zombie
  final playerdragon = AudioPlayer();
  final playerdragon2 = AudioPlayer();
  final playerdragon3 = AudioPlayer();
  int vidaDragon = Preferences.boss2;
  var snackBar = SnackBar(content: Text("El boss ya ha sido eliminado"));

  void initState() {
    super.initState();
    playerdragon.play(AssetSource("arcade.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => playerdragon.stop(),
              icon: Icon(Icons.music_note))
        ],
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
                            "Vida del Zombie \n ${Preferences.vidaRestanteDragon} / ${Preferences.vidaboss2} \nDamage per Click ${Preferences.damagePerClick}\nCoins: ${Preferences.coins}",
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
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/drake.gif"),
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
    if (Preferences.vidaRestanteDragon <= 0) {
      Preferences.vidaRestanteDragon = 0;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      playerdragon.stop();
    } else {
      playerdragon2.play(AssetSource("drake.mp3"));
      Preferences.vidaRestanteDragon =
          Preferences.vidaRestanteDragon - Preferences.damagePerClick;
      Preferences.totalClicks += 1;
      Preferences.coins += Preferences.damagePerClick;
      if (Preferences.vidaRestanteDragon <= 0) {
        playerdragon.stop();
        playerdragon3.play(AssetSource("zelda.mp3"));
        Preferences.derrotadoDragon = true;
      }
    }

    setState(() {});
  }
}
