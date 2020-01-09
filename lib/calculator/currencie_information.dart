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

    return Container(
      color: backgroundLightSoft,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          HigherAppBar(
              title: "Currency information", returnCallback: backCallback),
          Container(
            height: 15,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(currency.symbol,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35, color: fontLight))
              ]),
          Container(
            height: 35,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    height: 100,
                    child: Image.network(currency.logoUrl, fit: BoxFit.cover))
              ]),
        ],
      ),
    );
  }
}
