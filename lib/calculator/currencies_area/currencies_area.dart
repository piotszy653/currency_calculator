import 'package:currency_calculator/Storage/Storage.dart';
import 'package:currency_calculator/api/Currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './currence_row.dart';

class CurrenciesArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundLight =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighter;
    Color fontColorDark = storage.thems[storage.themIndex.toInt()].fonts.dark;

    Divider rowDivider = new Divider(
      height: 0,
      color: fontColorDark,
      thickness: 0.8,
      indent: 80,
    );

    Future<List<Currency>> allCurrencies = storage.internationalCurrencies + storage.cryptoCurrencies;

    return Container(
        color: backgroundLight,
        child: FutureBuilder<List<Currency>>(
            future: allCurrencies,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                // return: show loading widget
              }
              if (snapshot.hasError) {
                // return: show error widget
              }
              List<Currency> currencys = snapshot.data ?? [];
              return Container(
                  color: backgroundLight,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: currencys.map((currency) {
                        if (storage.actualShowCurrenciesShortcuts
                            .contains(currency.symbol)) {
                          return CurrenceRow(
                              shortcut: "GBP",
                              name: "Funt szterling",
                              value: 200.12,
                              id: 0,
                              top: true);
                        } else {
                          return null;
                        }
                      }).toList()));
            }));
  }
}

//Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// mainAxisSize: MainAxisSize.max,
// children:
//<Widget>[
// CurrenceRow(
//     shortcut: "GBP",
//     name: "Funt szterling",
//     value: 200.12,
//     id: 0,
//     top: true),
// rowDivider,
// CurrenceRow(
//     shortcut: "GBP", name: "Funt szterling", id: 1, value: 600.13),
// rowDivider,
// CurrenceRow(
//     shortcut: "GBP", name: "Funt szterling", id: 2, value: 76),
// rowDivider,
// CurrenceRow(
//     shortcut: "GBP", name: "Funt szterling", id: 3, value: 839.1),
// rowDivider,
// CurrenceRow(
//     shortcut: "GBP",
//     name: "Funt szterling",
//     value: 1600.50,
//     id: 4,
//     bottom: true)
//],
//)
