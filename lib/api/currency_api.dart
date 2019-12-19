import 'package:currency_calculator/api/Currency.dart';
import 'package:currency_calculator/api/dto/crypto/CryptoCurrencyRateList.dart';
import 'package:http/http.dart' as http;
import './dto/ExchangeRate.dart';
import 'dart:convert';

String nomicsApiKey = "ddebe6a9bfa893b563248344e8c8028c";
String europeanUnionFlagUrl = 'https://upload.wikimedia.org/wikipedia/commons/b/b7/Flag_of_Europe.svg'; // XDDDDDD

Future<List<Currency>> fetchLatestCurrencyRate(String base) async {
  final response =
      await http.get('https://api.exchangeratesapi.io/latest?base='+base);

  if (response.statusCode == 200) {
    ExchangeRate rate = ExchangeRate.fromJson(json.decode(response.body));
    List<Currency> currencies = new List();
    List<String> keys = new List();
    rate.rates.keys.forEach((key) => {keys.add(key)});
    for(String key in keys){
      String currencyFlagUrl = await fetchFlagByCurrency(key);
      currencies.add(new Currency(
        base: rate.base,
        symbol: key,
        logoUrl: currencyFlagUrl,
        price: rate.rates.remove(key)
      ));
    }
    return currencies;
  } else {
    throw Exception('Failed to load currencies');
  }
}

Future<List<Currency>> fetchLatestCryptoCurrenciesRate(String base, int numberOfCryptoCurrencies) async {
  final response =
      await http.get(
        'https://api.nomics.com/v1/currencies/ticker?key='+nomicsApiKey+'&convert='+base);

  if (response.statusCode == 200) {
    return CryptoCurrencyRateList.fromJson(json.decode(response.body), base, numberOfCryptoCurrencies).rates;
  } else {
    throw Exception('Failed to load crypto currencies');
  }
}

Future<String> fetchFlagByCurrency(String currency) async{
  if(currency == 'EUR')
  return europeanUnionFlagUrl;
  final response = await http.get('https://restcountries.eu/rest/v2/currency/' + currency);

  if (response.statusCode == 200) {
    List<dynamic> countryResponse = json.decode(response.body);
    return countryResponse.map((json) => json['flag']).toList().first;
  } else if(response.statusCode == 400){
    throw Exception('wrong currency: '+ currency);
  }
  
  else {
    throw Exception('Failed to load flag for ' + currency);
  }
}


