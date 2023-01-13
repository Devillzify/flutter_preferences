import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preferences/pages/home_screen.dart';
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
            )
          ],
          title: const Text(
            'Boss List  //  Shop  -->',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
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
                  Navigator.pushNamed(context, 'zombie');
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
              )
            ],
          ),
        )));
  }
}
