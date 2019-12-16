import 'package:flutter/material.dart';

class Storage extends ChangeNotifier {
  List<String> _pages = [
    'International payments',
    'Cryptocurrencies',
    'Diagrams'
  ];
  List<String> get pages => _pages;
  set pages(List<String> value) {
    _pages = value;
    notifyListeners();
  }

  String _appName = 'Math Currency';
  String get appName => _appName;
  set appName(String value) {
    _appName = value;
    notifyListeners();
  }

  int _themIndex = 0;
  int get themIndex => _themIndex;

  List<Them> _thems = [Them(Color(0xFF222222), Color(0x12344321), Colors.black, Colors.white)];
  List<Them> get thems => _thems;
  set thems(List<Them> value) {
    _thems = value;
    notifyListeners();
  }
  // PageController _controller = PageController(
  //   initialPage: 1,
  // );

  // int _page = 1;
}

class Them {
  ThemBackgrounds backgrounds;
  ThemFonts fonts;

  Them(Color backgroundDark, Color backgroundLight, Color fontDark, Color fontLight) {
    this.backgrounds = ThemBackgrounds(backgroundDark,backgroundLight);
    this.fonts = ThemFonts(fontDark, fontLight);
  }
}
  
class ThemBackgrounds {
  Color darker;
  Color lighter;
  
  ThemBackgrounds(Color darker, Color lighter) {
    this.darker = darker;
    this.lighter = lighter;
  }
}

class ThemFonts {
  Color dark;
  Color light;
  
  ThemFonts(Color dark, Color light) {
    this.dark = dark;
    this.light = light;
  }
}