import 'package:currency_calculator/api/Currency.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../api/CurrencyApiManager.dart';

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
  set themIndex(int value) {
    _themIndex = value;
    notifyListeners();
  }

  List<Them> _thems = [
    Them(Color(0xFFfe6f27), Color(0xFF2f2d29), Color(0xFF3b3834), Colors.orange,
        Colors.orange[50]),
    Them(Color(0xFF2a3251), Color(0xFFffd55b), Color(0xFFffda70),
        Colors.black87, Colors.white70),
    Them(Color(0xFF761238), Color(0xFFed3561), Color(0xFFf25077),
        Colors.pink[100], Colors.white70),
    Them(Color(0xFF28334f), Color(0xFFf93800), Color(0xFFfc5626),
        Colors.yellow[700], Colors.white70),
    Them(Color(0xFF30110e), Color(0xFFf2bd96), Color(0xFFf5c8a6),
        Colors.brown[700], Colors.brown[50])
  ];
  List<Them> get thems => _thems;

  PageController _controller = PageController(
    initialPage: 1,
  );
  PageController get controller => _controller;

  PageController _caclucatorPageController = PageController(
    initialPage: 1,
  );
  PageController get caclucatorPageController => _caclucatorPageController;

  int _page = 1;
  int get page => _page;
  set page(int value) {
    _page = value;
    notifyListeners();
  }

  int _caclucatorPage = 1;
  int get caclucatorPage => _caclucatorPage;
  set caclucatorPage(int value) {
    _caclucatorPage = value;
    notifyListeners();
  }

  int _currency = 0;
  int get currency => _currency;
  set currency(int value) {
    _currency = value;
    notifyListeners();
  }

  int _defaultCurrencyValue = 100;
  int get defaultCurrencyValue => _defaultCurrencyValue;
  set defaultCurrencyValue(int value) {
    _defaultCurrencyValue = value;
    notifyListeners();
  }

  String _calculationInput = "";
  String _calculatedValue = '0';
  Parser p = new Parser();
  get calculationInput => _calculationInput;
  get calculatedValue => _calculatedValue;
  set calculationInput(String value) {
    _calculationInput = value;
    try {
      Expression exp = p.parse(value.replaceAll('[', '(').replaceAll(']', ')'));
      _calculatedValue = exp.evaluate(EvaluationType.REAL, null).toString();
      print(_calculatedValue);
    } catch (e) {
      print(e.toString());
    }
    if(value == "") {
      _calculatedValue = _defaultCurrencyValue.toString();
    }
    notifyListeners();
  }

  static CurrencyApiManager currencyApiManager = new CurrencyApiManager();
  static Future<List<Currency>> internationalCurrencies =
      currencyApiManager.fetchLatestCurrencyRate();
  Future<List<Currency>> cryptoCurrencies =
      currencyApiManager.fetchLatestCryptoCurrenciesRate();
  //List<Currency> actualShowCurrencies = [internationalCurrencies]
}

class Them {
  ThemBackgrounds backgrounds;
  ThemFonts fonts;

  Them(Color backgroundDark, Color backgroundLight, Color backgroundLightSoft,
      Color fontDark, Color fontLight) {
    this.backgrounds =
        ThemBackgrounds(backgroundDark, backgroundLight, backgroundLightSoft);
    this.fonts = ThemFonts(fontDark, fontLight);
  }
}

class ThemBackgrounds {
  Color darker;
  Color lighter;
  Color lighterSoft;

  ThemBackgrounds(Color darker, Color lighter, Color lighterSoft) {
    this.darker = darker;
    this.lighter = lighter;
    this.lighterSoft = lighterSoft;
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
