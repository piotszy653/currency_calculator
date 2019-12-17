class CryptoCurrencyRate{
  final String base;
  final String symbol;
  final String name;
  final String logoUrl;
  final num price;

  CryptoCurrencyRate({this.base, this.symbol, this.name, this.logoUrl, this.price});

  factory CryptoCurrencyRate.fromJson(Map<String, dynamic> json, String base) {
    return CryptoCurrencyRate(
      base: base,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      logoUrl: json['logo_url'] as String,
      price: double.parse(json['price'])
    );
  }
}