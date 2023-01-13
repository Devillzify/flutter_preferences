import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static int _boss1 = 100;
  static int _boss2 = 200;
  static int _boss3 = 500;
  static int _coins = 0;
  static int _totalClicks = 0;
  static int _damagePerClick = 1;
  static String _arma = "assets/axe.png";
  static int _vidaRestanteZombie = 100;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
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
}
