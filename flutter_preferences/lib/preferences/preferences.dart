import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static int _boss1 = 100;
  static int _boss2 = 1000;
  static int _boss3 = 10000;
  static int _vidaboss1 = 100;
  static int _vidaboss2 = 1000;
  static int _vidaboss3 =
      10000; // estos atributos van ligados a las paginas de black, zombie y dragon
  static int _coins = 0;
  static int _totalClicks = 0;
  static int _damagePerClick = 1;
  static String _armaUrl = "assets/sarten.png";
  static bool _arma1 = true;
  static bool _arma2 = true; // estos atributos de armas van ligados a la tienda
  static bool _arma3 = true;
  static bool _arma4 = true;
  static bool _arma5 = true;
  static bool _derrotadoZombie = false;
  static bool _derrotadoDragon =
      false; // estados para poder acceder entre paginas
  static bool _derrotadoBlack = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get derrotadoBlack {
    return _prefs.getBool('black') ?? _derrotadoBlack;
  }

  static set derrotadoBlack(bool zombie) {
    _derrotadoBlack = zombie;
    _prefs.setBool('zombie', _derrotadoBlack);
  }

  static int get vidaRestanteBlack {
    return _prefs.getInt("vidaRestanteBlack") ?? _boss3;
  }

  static set vidaRestanteBlack(int clicks) {
    _boss3 = clicks;
    _prefs.setInt('vidaRestanteBlack', clicks);
  }

  static int get vidaRestanteDragon {
    return _prefs.getInt("vidaRestanteDragon") ?? _boss2;
  }

  static set vidaRestanteDragon(int clicks) {
    _boss2 = clicks;
    _prefs.setInt('vidaRestanteDragon', clicks);
  }

  static int get vidaboss1 {
    return _prefs.getInt("vidaboss1") ?? _vidaboss1;
  }

  static set vidaboss1(int clicks) {
    _vidaboss2 = clicks;
    _prefs.setInt('vidaboss1', clicks);
  }

  static int get vidaboss2 {
    return _prefs.getInt("vidaboss2") ?? _vidaboss2;
  }

  static set vidaboss2(int clicks) {
    _vidaboss2 = clicks;
    _prefs.setInt('vidaboss2', clicks);
  }

  static int get vidaboss3 {
    return _prefs.getInt("vidaboss3") ?? _vidaboss3;
  }

  static set vidaboss3(int clicks) {
    _vidaboss3 = clicks;
    _prefs.setInt('vidaboss3', clicks);
  }

  static bool get derrotadoZombie {
    return _prefs.getBool('zombie') ?? _derrotadoZombie;
  }

  static set derrotadoZombie(bool zombie) {
    _derrotadoZombie = zombie;
    _prefs.setBool('zombie', _derrotadoZombie);
  }

  static bool get derrotadoDragon {
    return _prefs.getBool('dragon') ?? _derrotadoDragon;
  }

  static set derrotadoDragon(bool dragon) {
    _derrotadoDragon = dragon;
    _prefs.setBool('dragon', _derrotadoDragon);
  }

  static bool get arma1 {
    return _prefs.getBool('arma1') ?? _arma1;
  }

  static set arma1(bool arma) {
    _arma1 = arma;
    _prefs.setBool('arma1', _arma1);
  }

  static bool get arma2 {
    return _prefs.getBool('arma2') ?? _arma2;
  }

  static set arma2(bool arma) {
    _arma2 = arma;
    _prefs.setBool('arma2', _arma2);
  }

  static bool get arma3 {
    return _prefs.getBool('arma3') ?? _arma3;
  }

  static set arma3(bool arma) {
    _arma3 = arma;
    _prefs.setBool('arma3', _arma3);
  }

  static bool get arma4 {
    return _prefs.getBool('arma4') ?? _arma4;
  }

  static set arma4(bool arma) {
    _arma4 = arma;
    _prefs.setBool('arma4', _arma4);
  }

  static bool get arma5 {
    return _prefs.getBool('arma5') ?? _arma5;
  }

  static set arma5(bool arma) {
    _arma2 = arma;
    _prefs.setBool('arma5', _arma5);
  }

  static int get boss1 {
    return _prefs.getInt("boss1") ?? _boss1;
  }

  static set boss1(int clicks) {
    _boss1 = clicks;
    _prefs.setInt('boss1', clicks);
  }

  static int get boss2 {
    return _prefs.getInt("boss2") ?? _boss2;
  }

  static set boss2(int clicks) {
    _boss1 = clicks;
    _prefs.setInt('boss2', clicks);
  }

  static int get boss3 {
    return _prefs.getInt("boss3") ?? _boss3;
  }

  static set boss3(int clicks) {
    _boss1 = clicks;
    _prefs.setInt('boss3', clicks);
  }

  static int get coins {
    return _prefs.getInt("coins") ?? _coins;
  }

  static set coins(int clicks) {
    _boss1 = clicks;
    _prefs.setInt('coins', clicks);
  }

  static int get totalClicks {
    return _prefs.getInt("totalClicks") ?? _totalClicks;
  }

  static set totalClicks(int clicks) {
    _boss1 = clicks;
    _prefs.setInt('totalClicks', clicks);
  }

  static int get damagePerClick {
    return _prefs.getInt("damagePerClick") ?? _damagePerClick;
  }

  static set damagePerClick(int clicks) {
    _boss1 = clicks;
    _prefs.setInt('damagePerClick', clicks);
  }

  static int get vidaRestanteZombie {
    return _prefs.getInt("vidaRestanteZombie") ?? _boss1;
  }

  static set vidaRestanteZombie(int clicks) {
    _boss1 = clicks;
    _prefs.setInt('vidaRestanteZombie', clicks);
  }

  static String get armaUrl {
    return _prefs.getString('arma') ?? _armaUrl;
  }

  static set armaUrl(String arma) {
    _armaUrl = arma;
    _prefs.setString('arma', arma);
  }
}
