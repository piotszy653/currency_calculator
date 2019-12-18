import 'package:currency_calculator/calculator/currencies_area/currencies_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './calculator_keyboard.dart';
import '../Storage/Storage.dart';
import '../app_bar.dart';

class Calculator {
  mainBottomSheet(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundDark =
        storage.thems[storage.themIndex.toInt()].backgrounds.darker;
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Column(children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 24,
                  color: backgroundDark,
                ),
                MainAppBar(backButton: true),
              ],
            ),
            CurrenciesArea(),
            CalculatorKeyboard(),
          ]);
        });
  }
}
