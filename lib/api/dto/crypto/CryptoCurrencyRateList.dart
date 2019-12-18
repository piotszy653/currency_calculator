import 'package:currency_calculator/api/Currency.dart';

class CryptoCurrencyRateList{
  List<Currency> rates;

  CryptoCurrencyRateList({this.rates});

  factory CryptoCurrencyRateList.fromJson(List<dynamic> json, String base, int noOfCurrencies) {
    List<Currency> rateList = json.map((i) => Currency.fromJson(i, base)).toList();
    rateList = rateList.sublist(0, noOfCurrencies);
    return CryptoCurrencyRateList(rates: rateList);
  }
}