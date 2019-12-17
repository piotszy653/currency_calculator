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

  int _themIndex = 0;
  int get themIndex => _themIndex;

  List<Them> _thems = [
    Them(Color(0xFFfe6f27), Color(0xFF2f2d29), Colors.orange, Colors.orange[50]),
    Them(Color(0xFF2a3251), Color(0xFFffd55b), Colors.black87, Colors.white70),
    Them(Color(0xFF761238), Color(0xFFed3561), Colors.pink[100], Colors.white70),
    Them(Color(0xFF28334f), Color(0xFFf93800), Colors.yellow[700], Colors.white70),
    Them(Color(0xFF30110e), Color(0xFFf2bd96), Colors.brown[700], Colors.brown[50])
    ];
  List<Them> get thems => _thems;

  PageController _controller = PageController(
    initialPage: 1,
  );
  PageController get controller => _controller;

  int _page = 1;
  int get page => _page;
  set page(int value) {
    _page = value;
    notifyListeners();
  }
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