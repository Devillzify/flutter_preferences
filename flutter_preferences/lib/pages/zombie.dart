import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preferences/preferences/preferences.dart';

class Zombie extends StatefulWidget {
  static const String routeName = 'zombie';
  @override
  State<Zombie> createState() => _ZombieState();
}

class _ZombieState extends State<Zombie> {
  // pagina de Enemigo, al hacer click desde la pagina de bosses vamos a cada uno de estos
  static final playerzombie =
      AudioPlayer(); // estos tienen unos atributos que se guardan dentro del shared preferences
  final playerzombie2 =
      AudioPlayer(); // todas las paginas tienen la misma estructura, 2 containers, donde en uno se ven las caracteristicas y en el otro un InkWell
  final playerzombie3 = AudioPlayer();
  int vidaZombie = Preferences.vidaboss1;
  var snackBar = SnackBar(content: Text("El boss ya ha sido eliminado"));

  void initState() {
    super.initState();
    playerzombie.play(AssetSource("zombiefondo.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => playerzombie.stop(),
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
                            "Vida del Zombie \n ${Preferences.vidaRestanteZombie} / ${vidaZombie} \nDamage per Click ${Preferences.damagePerClick}\nCoins: ${Preferences.coins}",
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
    if (Preferences.vidaRestanteZombie <= 0) {
      Preferences.vidaRestanteZombie = 0;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      playerzombie.stop();
    } else {
      playerzombie2.play(AssetSource("zombiegolpe.mp3"));
      Preferences.vidaRestanteZombie =
          Preferences.vidaRestanteZombie - Preferences.damagePerClick;
      Preferences.totalClicks += 1;
      Preferences.coins += Preferences.damagePerClick;
      if (Preferences.vidaRestanteZombie <= 0) {
        playerzombie.stop();
        playerzombie3.play(AssetSource("zelda.mp3"));
        Preferences.derrotadoZombie = true;
      }
    }

    setState(() {});
  }
}
