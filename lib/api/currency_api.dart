import 'package:currency_calculator/api/dto/crypto/CryptoCurrencyRateList.dart';
import 'package:http/http.dart' as http;
import './dto/ExchangeRate.dart';
import 'dart:convert';

String nomicsApiKey = "ddebe6a9bfa893b563248344e8c8028c";

Future<ExchangeRate> fetchLatestExchangeRate(String base) async {
  final response =
      await http.get('https://api.exchangeratesapi.io/latest?base='+base);

  if (response.statusCode == 200) {
    return ExchangeRate.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load exchange rate');
  }
}

Future<CryptoCurrencyRateList> fetchLatestCryptoCurrencyRate(String base, int numberOfCryptoCurrencies) async {
  final response =
      await http.get(
        'https://api.nomics.com/v1/currencies/ticker?key='+nomicsApiKey+'&convert='+base);

  if (response.statusCode == 200) {
    return CryptoCurrencyRateList.fromJson(json.decode(response.body), base, numberOfCryptoCurrencies);
  } else {
    throw Exception('Failed to load exchange rate');
  }
}


