import 'package:currency_calculator/Storage/Storage.dart';
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
    return Column(children: <Widget>[
      HigherAppBar(title: "Currency information", returnCallback: backCallback),
      Expanded(child: Container(color: backgroundLightSoft))
    ]);
  }
}
