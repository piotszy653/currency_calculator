class ExchangeRate {
  final String base;
  final String date;
  final Map rates;

  ExchangeRate({this.base, this.date, this.rates});

  factory ExchangeRate.fromJson(Map<String, dynamic> json) {
    return ExchangeRate(
      base: json['base'] as String,
      date: json['date'] as String,
      rates: json['rates'] as Map<String, dynamic>,
    );
  }

}
