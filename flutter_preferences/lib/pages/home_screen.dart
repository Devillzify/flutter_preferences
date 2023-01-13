import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preferences/preferences/preferences.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  static final player = AudioPlayer();
  void initState() {
    super.initState();
    player.play(AssetSource("halloween.mp3"));
  }

  TextStyle style = new TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: Colors.cyan);
  TextStyle style2 = new TextStyle(
      fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Center(
            child: Text(
          'Clicker Stats',
          style: style2,
        )),
      ),
      body: Center(
        child: Column(children: [
          Container(
            width: 412,
            height: 200,
            color: Color.fromARGB(255, 66, 66, 66),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: reload, icon: Icon(Icons.auto_mode_outlined)),
                  Text(
                    "Damage per Click: ${Preferences.damagePerClick} ",
                    style: style,
                  ),
                  Divider(),
                  Text(
                    "Total Clicks: ${Preferences.totalClicks} ",
                    style: style,
                  ),
                  Divider(),
                  Text(
                    "Coins: ${Preferences.coins}",
                    style: style,
                  )
                ]),
          ),
          Container(
            width: 412,
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/robot.gif"), fit: BoxFit.cover)),
          ),
          InkWell(
            onTap: () {
              nextpage();
            }, // Handle your callback
            child: Ink(
              height: 75,
              width: 412,
              color: Colors.black,
              child: Center(
                  child: Text(
                "____PLAY____",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )),
            ),
          )
        ]),
      ),
    );
  }

  nextpage() {
    player.stop();
    Navigator.of(context).pushNamed("bossList");
  }

  reload() {
    setState(() {});
  }
}
