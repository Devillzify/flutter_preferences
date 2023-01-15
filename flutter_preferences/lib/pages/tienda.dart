import 'package:flutter/material.dart';

import '../preferences/preferences.dart';

class Tienda extends StatefulWidget {
  static const String routeName = "tienda";
  @override
  State<Tienda> createState() => _TiendaState();
}

class _TiendaState extends State<Tienda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text('\$\$ Shop \$\$ Coins: ${Preferences.coins}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow)),
        ),
      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Column(children: [
            Container(
              width: 412,
              height: 100,
              color: Colors.cyan,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 100,
                    color: Color.fromARGB(255, 172, 172, 172),
                    child: InkWell(
                      onTap: () {
                        comprarkatana();
                      }, // Handle your callback
                      child: Ink(
                        child: Center(
                            child: Container(
                          width: 412,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/katana.png"),
                                  fit: BoxFit.fitWidth)),
                        )),
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 100,
                    child: Center(
                        child: Text(
                      "Price: 100\nDamage: 3",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ),
            Container(
              width: 412,
              height: 100,
              color: Colors.cyan,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 100,
                    color: Color.fromARGB(255, 172, 172, 172),
                    child: InkWell(
                      onTap: () {
                        comprarmotosierra();
                      }, // Handle your callback
                      child: Ink(
                        child: Center(
                            child: Container(
                          width: 412,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/motosierra.png"),
                                  fit: BoxFit.contain)),
                        )),
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 100,
                    child: Center(
                        child: Text(
                      "Price: 200\nDamage: 5",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ),
            Container(
              width: 412,
              height: 100,
              color: Colors.cyan,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 100,
                    color: Color.fromARGB(255, 172, 172, 172),
                    child: InkWell(
                      onTap: () {
                        comprarrevolver();
                      }, // Handle your callback
                      child: Ink(
                        child: Center(
                            child: Container(
                          width: 412,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/revolver.png"),
                                  fit: BoxFit.fitWidth)),
                        )),
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 100,
                    child: Center(
                        child: Text(
                      "Price: 500\nDamage: 10",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ),
            Container(
              width: 412,
              height: 100,
              color: Colors.cyan,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 100,
                    color: Color.fromARGB(255, 172, 172, 172),
                    child: InkWell(
                      onTap: () {
                        comprarzoro();
                      }, // Handle your callback
                      child: Ink(
                        child: Center(
                            child: Container(
                          width: 412,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/zoro.png"),
                                  fit: BoxFit.fitWidth)),
                        )),
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 100,
                    child: Center(
                        child: Text(
                      "Price: 1500\nDamage: 20",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ),
            Container(
              width: 412,
              height: 100,
              color: Colors.cyan,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 100,
                    color: Color.fromARGB(255, 172, 172, 172),
                    child: InkWell(
                      onTap: () {
                        comprarluffy();
                      }, // Handle your callback
                      child: Ink(
                        child: Center(
                            child: Container(
                          width: 412,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/luffy.png"),
                                  fit: BoxFit.contain)),
                        )),
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 100,
                    child: Center(
                        child: Text(
                      "Price: 4000\nDamage: 150",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  comprarkatana() {
    if (Preferences.coins >= 100 && Preferences.arma1 == true) {
      Preferences.damagePerClick = 3;
      Preferences.armaUrl = 'assets/katana.png';
      Preferences.coins -= 100;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Katana equipada")));
      Preferences.arma1 = false;
      setState(() {});
    }
    if (Preferences.coins <= 100 && Preferences.arma1 == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No tienes saldo suficiente para la katana")));
    }
    if (Preferences.arma1 == false) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Ya has comprado la katana")));
    }
  }

  comprarmotosierra() {
    if (Preferences.coins >= 200 && Preferences.arma2 == true) {
      Preferences.damagePerClick = 5;
      Preferences.armaUrl = 'assets/motosierra.png';
      Preferences.coins -= 200;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Motosierra equipada")));
      Preferences.arma2 = false;
      setState(() {});
    }
    if (Preferences.coins <= 200 && Preferences.arma2 == true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No tienes saldo suficiente para la motosierra")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("La motosierra ya ha sido comprada")));
    }
  }

  comprarrevolver() {
    if (Preferences.coins >= 500 && Preferences.arma3 == true) {
      Preferences.damagePerClick = 10;
      Preferences.armaUrl = 'assets/revolver.png';
      Preferences.coins -= 500;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Revolver equipado")));
      Preferences.arma3 = false;
      setState(() {});
    }
    if (Preferences.coins <= 100 && Preferences.arma3 == true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("No tienes saldo suficiente para el revolver")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("El revolver ya ha sido comprado")));
    }
  }

  comprarzoro() {
    if (Preferences.coins >= 1500 && Preferences.arma4 == true) {
      Preferences.damagePerClick = 20;
      Preferences.armaUrl = 'assets/zoro.png';
      Preferences.coins -= 1500;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Zoro de ayuda ahora")));
      Preferences.arma1 = false;
      setState(() {});
    }
    if (Preferences.coins <= 1500 && Preferences.arma4 == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No tienes saldo suficiente para Zoro")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Zoro ha llegado")));
    }
  }

  comprarluffy() {
    if (Preferences.coins >= 4000 && Preferences.arma5 == true) {
      Preferences.damagePerClick = 150;
      Preferences.armaUrl = 'assets/luffy.png';
      Preferences.coins -= 4000;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Luffy te ayuda ahora")));
      Preferences.arma5 = false;
      setState(() {});
    }
    if (Preferences.coins <= 4000 && Preferences.arma5 == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No tienes saldo suficiente para Luffy")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Luffy ha llegado")));
    }
  }
}
