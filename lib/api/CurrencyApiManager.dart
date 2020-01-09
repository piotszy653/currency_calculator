import 'package:currency_calculator/api/Currency.dart';
import 'package:currency_calculator/api/dto/crypto/CryptoCurrencyRateList.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import './dto/ExchangeRate.dart';
import 'dart:convert';

class CurrencyApiManager {

String nomicsApiKey = "ddebe6a9bfa893b563248344e8c8028c";
String europeanUnionFlagUrl = 'https://upload.wikimedia.org/wikipedia/commons/b/b7/Flag_of_Europe.svg'; // XDDDDDD

Future<String> fetchCurrencyInfo({String currency = 'EURO'}) async {

String request =  'https://en.wikipedia.org/w/api.php?action=query&format=json&titles='
    + currency.replaceAll(' ', '%20') 
    +'&prop=extracts&exintro&explaintext';
    print(request);
  final response = await http.get(request);

    if(response.statusCode == 200){
      Map<String, dynamic> infoResponse = jsonDecode(response.body);
      return infoResponse['query']['pages'].values.first['extract'];
    } else {
      throw Exception("Failed to load info for " + currency);
    }

}

// args in tuple: international, crypto
Tuple2<Future<List<Currency>>, Future<List<Currency>>> fetchRates({String base = 'EUR', int numberOfCryptoCurrencies = 40}) {

  return Tuple2<Future<List<Currency>>, Future<List<Currency>>>(
    fetchLatestCurrencyRate(base: base), 
    fetchLatestCryptoCurrenciesRate(base: base, numberOfCryptoCurrencies: numberOfCryptoCurrencies)
    );
}

Future<List<Currency>> fetchJoinedRates({String base = 'EUR', int numberOfCryptoCurrencies = 40}){
  return getJoinedRates(base: base, numberOfCryptoCurrencies: numberOfCryptoCurrencies);
}

Future<List<Currency>> getJoinedRates({String base = 'EUR', int numberOfCryptoCurrencies = 40}) async {
  List<Currency> international =  await fetchLatestCurrencyRate(base: base);
  List<Currency> crypto =  await fetchLatestCryptoCurrenciesRate(base: base, numberOfCryptoCurrencies: numberOfCryptoCurrencies);

  return new List.from(international)..addAll(crypto);
}

Future<List<Currency>> fetchLatestCurrencyRate({String base = 'EUR'}) async {
  final response =
      await http.get('https://api.exchangeratesapi.io/latest?base='+base);

  if (response.statusCode == 200) {
    ExchangeRate rate = ExchangeRate.fromJson(json.decode(response.body));

    List<Currency> currencies = new List();
    List<String> keys = new List();
    rate.rates.keys.forEach((key) => {keys.add(key)});

    for(String key in keys){
      Tuple2<String, String> tuple = await fetchFlagAndNameByCurrency(key);
      currencies.add(new Currency(
        base: rate.base,
        name: tuple.item2,
        symbol: key,
        logoUrl: tuple.item1,
        price: rate.rates.remove(key)
      ));
    }
    Tuple2<String, String> tuple = await fetchFlagAndNameByCurrency(rate.base);
    currencies.add(new Currency(
      base: rate.base,
      name: tuple.item2,
      symbol: rate.base,
      logoUrl: tuple.item1,
      price: 1.0
    ));
    return currencies;
  } else {
    throw Exception('Failed to load currencies');
  }
}

Future<List<Currency>> fetchLatestCryptoCurrenciesRate({String base = 'EUR', int numberOfCryptoCurrencies = 40}) async {
  final response =
      await http.get(
        'https://api.nomics.com/v1/currencies/ticker?key='+nomicsApiKey+'&convert='+base);

  if (response.statusCode == 200) {
    return CryptoCurrencyRateList.fromJson(json.decode(response.body), base, numberOfCryptoCurrencies).rates;
  } else {
    throw Exception('Failed to load crypto currencies');
  }
}

Future<Tuple2<String, String>> fetchFlagAndNameByCurrency(String currency) async{
  if(currency == 'EUR')
  return Tuple2<String, String>(europeanUnionFlagUrl, 'Euro');
  final response = await http.get('https://restcountries.eu/rest/v2/currency/' + currency);

  if (response.statusCode == 200) {
    List<dynamic> countryResponse = json.decode(response.body);
    String flagUrl = countryResponse.map((json) => json['flag']).toList().first;
    String name = countryResponse.map((json) => json['currencies']).toList().first.map((currencies) => currencies['name']).toList().first;
    return Tuple2<String, String>(flagUrl, name);
  } else if(response.statusCode == 400){
    throw Exception('wrong currency: '+ currency);
  }
  
  else {
    throw Exception('Failed to load flag for ' + currency);
  }
}
}

