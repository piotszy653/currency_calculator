class Currency{
  final String base;
  final String name;
  final String symbol;
  final String logoUrl;
  final num price;

  Currency({this.base, this.name, this.symbol, this.logoUrl, this.price});

  factory Currency.fromJson(Map<String, dynamic> json, String base) {
    return Currency(
      base: base,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      logoUrl: json['logo_url'] as String,
      price: double.parse(json['price'])
    );
  }

  num rate(Currency to, {double amount = 1}){
  if(this.base != to.base)
  throw Exception("not same base in currencies:" + this.symbol+"-" + this.base +", " + to.symbol + "-" + to.base);
  return amount * this.price/to.price;
}
}