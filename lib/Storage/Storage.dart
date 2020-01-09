import 'package:currency_calculator/api/Currency.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../api/CurrencyApiManager.dart';

class Storage extends ChangeNotifier {
  List<String> _pages = ['International payments', 'Cryptocurrencies'];
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
    Them(Color(0xFF357eff), Color(0xFF404040), Color(0xFF545454),
        Colors.blue[600], Colors.white),
    Them(Color(0xFFfe6f27), Color(0xFF2f2d29), Color(0xFF3b3834), Colors.orange,
        Colors.orange[50]),
    Them(Color(0xFF2a3251), Color(0xFFffd55b), Color(0xFFffda70),
        Colors.black87, Colors.white70),
    Them(Color(0xFF761238), Color(0xFFed3561), Color(0xFFf25077),
        Colors.pink[100], Colors.white70),
    Them(Color(0xFF28334f), Color(0xFFf93800), Color(0xFFfc5626),
        Colors.yellow[700], Colors.white70),
    Them(Color(0xFF30110e), Color(0xFFf2bd96), Color(0xFFf5c8a6),
        Colors.brown[700], Colors.brown[50]),
  ];
  List<Them> get thems => _thems;

  PageController _controller = PageController(
    initialPage: 0,
  );
  PageController get controller => _controller;

  PageController _caclucatorPageController = PageController(
    initialPage: 1,
  );
  PageController get caclucatorPageController => _caclucatorPageController;

  PageController _changeCurrencyPageController = PageController(
    initialPage: 0,
  );
  PageController get changeCurrencyPageController =>
      _changeCurrencyPageController;

  int _page = 0;
  int get page => _page;
  set page(int value) {
    _page = value;
    notifyListeners();
  }

  int _changeCurrencyPage = 0;
  int get changeCurrencyPage => _changeCurrencyPage;
  set changeCurrencyPage(int value) {
    _changeCurrencyPage = value;
    notifyListeners();
  }

  int _caclucatorPage = 1;
  int get caclucatorPage => _caclucatorPage;
  set caclucatorPage(int value) {
    _caclucatorPage = value;
    notifyListeners();
  }

  String _currency = "PLN";
  String get currency => _currency;
  set currency(String value) {
    _currency = value;
    notifyListeners();
  }

  int _defaultCurrencyValue = 1;
  int get defaultCurrencyValue => _defaultCurrencyValue;
  set defaultCurrencyValue(int value) {
    _defaultCurrencyValue = value;
    notifyListeners();
  }

  int _afterTheDecimalPoint = 2;
  int get afterTheDecimalPoint => _afterTheDecimalPoint;
  set afterTheDecimalPoint(int value) {
    _afterTheDecimalPoint = value;
    notifyListeners();
  }

  String _calculationInput = "";
  String _calculatedValue = '1';
  Parser p = new Parser();
  get calculationInput => _calculationInput;
  get calculatedValue => _calculatedValue;
  set calculationInput(String value) {
    _calculationInput = value;
    try {
      Expression exp = p.parse(
          value.replaceAll('[', '(').replaceAll(']', ')').replaceAll(',', '.'));
      _calculatedValue = exp.evaluate(EvaluationType.REAL, null).toString();
    } catch (e) {
      print(e.toString());
    }
    if (value == "") {
      _calculatedValue = _defaultCurrencyValue.toString();
    }
    notifyListeners();
  }

  static CurrencyApiManager _currencyApiManager = new CurrencyApiManager();
  get currencyApiManager => _currencyApiManager;

  Future<List<Currency>> _internationalCurrencies =
      _currencyApiManager.fetchLatestCurrencyRate();
  get internationalCurrencies => _internationalCurrencies;

  Future<List<Currency>> _cryptoCurrencies =
      _currencyApiManager.fetchLatestCryptoCurrenciesRate();
  get cryptoCurrencies => _cryptoCurrencies;

  Future<List<Currency>> _allCurrencies =
      _currencyApiManager.fetchJoinedRates();
  get allCurrencies => _allCurrencies;

  int _actualChangingCurrencyIndex = 0;
  get actualChangingCurrencyIndex => _actualChangingCurrencyIndex;
  set actualChangingCurrencyIndex(int value) {
    _actualChangingCurrencyIndex = value;
    notifyListeners();
  }

  Currency _actualShowingInfo =
      new Currency(base: "", symbol: "", logoUrl: "", price: 0);
  get actualShowingInfo => _actualShowingInfo;
  set actualShowingInfo(Currency value) {
    _actualShowingInfo = value;
    notifyListeners();
  }

  List<String> _actualShowCurrenciesShortcuts = [
    "EUR",
    "HUF",
    "PLN",
    "USD",
    "CHF"
  ];
  get actualShowCurrenciesShortcuts => _actualShowCurrenciesShortcuts;
  set actualShowCurrenciesShortcuts(String value) {
    _actualShowCurrenciesShortcuts[_actualChangingCurrencyIndex] = value;
    notifyListeners();
  }
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
