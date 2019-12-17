import 'package:http/http.dart' as http;
import './dto/ExchangeRate.dart';
import 'dart:convert';

Future<ExchangeRate> fetchLatestExchangeRate() async {
  final response =
      await http.get('https://api.exchangeratesapi.io/latest');

  if (response.statusCode == 200) {
    return ExchangeRate.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load exchange rate');
  }
}


