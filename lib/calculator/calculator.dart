import 'package:currency_calculator/calculator/currencies_area/currencies_area.dart';
import 'package:currency_calculator/calculator/higher_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Storage/Storage.dart';
import './higher_app_bar.dart';
import 'calculator_keyboard/calculator_keyboard.dart';
import 'change_currencie.dart';
import 'currencie_information.dart';

class Calculator {
  mainBottomSheet(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    
    void onPageChanged(int value) {
      storage.caclucatorPage = value;
    }

    void backToCalculatorPage() {
      storage.caclucatorPage = 1;
      storage.caclucatorPageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    }

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return PageView(
              physics: new NeverScrollableScrollPhysics(),
              onPageChanged: onPageChanged,
              controller: storage.caclucatorPageController,
              children: <Widget>[
                ChangeCurrenciePage(backCallback: backToCalculatorPage),
                Container(
                  child: Column(children: <Widget>[
                    HigherAppBar(backButton: true),
                    CurrenciesArea(),
                    CalculatorKeyboard()
                  ]),
                ),
                CurrencieInformationPage(backCallback: backToCalculatorPage)
              ]);
        });
  }
}
