class Currency{
  final String base;
  final String symbol;
  final String logoUrl;
  final num price;

  Currency({this.base, this.symbol, this.logoUrl, this.price});

  factory Currency.fromJson(Map<String, dynamic> json, String base) {
    return Currency(
      base: base,
      symbol: json['symbol'] as String,
      logoUrl: json['logo_url'] as String,
      price: double.parse(json['price'])
    );
  }
}