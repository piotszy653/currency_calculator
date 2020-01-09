import 'package:currency_calculator/Storage/Storage.dart';
import 'package:currency_calculator/api/Currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'higher_app_bar.dart';

class CurrencieInformationPage extends StatelessWidget {
  VoidCallback backCallback;
  CurrencieInformationPage({this.backCallback});

  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundLightSoft =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighterSoft;
    Color fontLight = storage.thems[storage.themIndex.toInt()].fonts.light;
    Currency currency = storage.actualShowingInfo;

    return Column(children: <Widget>[
      HigherAppBar(title: "Currency information", returnCallback: backCallback),
      Container(
        color: backgroundLightSoft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                  child: Text(currency.symbol,
                      style: TextStyle(fontSize: 45, color: fontLight)))
            ]),
            Image.network(currency.logoUrl, fit: BoxFit.cover)
          ],
        ),
      )
    ]);
  }
}
