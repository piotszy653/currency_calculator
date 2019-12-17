import 'package:currency_calculator/api/dto/CryptoCurrencyRate.dart';

class CryptoCurrencyRateList{
  List<CryptoCurrencyRate> rates;

  CryptoCurrencyRateList({this.rates});

  factory CryptoCurrencyRateList.fromJson(List<dynamic> json, String base, int noOfCurrencies) {
    List<CryptoCurrencyRate> rateList = json.map((i) => CryptoCurrencyRate.fromJson(i, base)).toList();
    rateList = rateList.sublist(0, noOfCurrencies);
    return CryptoCurrencyRateList(rates: rateList);
  }
}