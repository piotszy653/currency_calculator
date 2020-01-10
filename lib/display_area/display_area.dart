import 'package:currency_calculator/Storage/Storage.dart';
import 'package:currency_calculator/api/Currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayArea extends StatelessWidget {
  bool changeCurrency;
  DisplayArea({this.changeCurrency});

  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundLight =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighter;
    Color backgroundDark =
        storage.thems[storage.themIndex.toInt()].backgrounds.darker;
    Color fontColorLight = storage.thems[storage.themIndex.toInt()].fonts.light;
    Color fontColorDark = storage.thems[storage.themIndex.toInt()].fonts.dark;

    void onPageChanged(int value) {
      if (changeCurrency != null && changeCurrency) {
        storage.changeCurrencyPage = value;
      } else {
        storage.page = value;
      }
    }

    return Expanded(
      child: PageView(
          onPageChanged: onPageChanged,
          controller: changeCurrency != null && changeCurrency
              ? storage.changeCurrencyPageController
              : storage.controller,
          children: storage.pages
              .map((page) => FutureBuilder<List<Currency>>(
                  future: page == "Cryptocurrencies"
                      ? storage.cryptoCurrencies
                      : storage.internationalCurrencies,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Container(
                          alignment: Alignment.center,
                          color: backgroundLight,
                          width: 200.0,
                          height: 200.0,
                          child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    List<Currency> currencys = snapshot.data ?? [];
                    currencys.sort((a, b) => a.symbol.compareTo(b.symbol));
                    String firstGroupLetter = ";";
                    bool firstAppeard = false;

                    return Container(
                        color: backgroundLight,
                        child: ListView.builder(
                            itemCount: currencys.length,
                            itemBuilder: (context, index) {
                              Currency currency = currencys[index];
                              bool selected = storage
                                  .actualShowCurrenciesShortcuts
                                  .contains(currency.symbol);
                              firstAppeard = false;
                              if (firstGroupLetter !=
                                  currency.symbol.toUpperCase()[0]) {
                                firstGroupLetter =
                                    currency.symbol.toUpperCase()[0];
                                firstAppeard = true;
                              }
                              return new ListTile(
                                contentPadding:
                                    EdgeInsets.fromLTRB(35.0, 0, 17.0, 0),
                                leading: Text(
                                    firstAppeard ? firstGroupLetter : "",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: fontColorDark,
                                        fontWeight: FontWeight.w400)),
                                trailing: selected
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.green[300],
                                        size: 22.0,
                                      )
                                    : Text(""),
                                title: Row(
                                  children: <Widget>[
                                    Container(
                                        width: 25.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                            //shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                spreadRadius: 1,
                                                blurRadius: 3,
                                                offset: Offset(1,
                                                    1), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    7.0) //         <--- border radius here
                                                ),
                                            border: Border.all(
                                              color: fontColorDark,
                                              width: 1,
                                            ),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/images/" +
                                                      currency.symbol
                                                          .toLowerCase() +
                                                      ".jpg"),
                                            ))),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          7.0, 00, 0.0, 00.0),
                                      child: Container(
                                        width: 45,
                                        child: Text(currency.symbol,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: fontColorLight)),
                                      ),
                                    ),
                                    Text(currency.name,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: fontColorDark)),
                                  ],
                                ),
                                onTap: () {
                                  if (!changeCurrency) {
                                    return;
                                  }
                                  if (!storage.actualShowCurrenciesShortcuts
                                      .contains(currency.symbol)) {
                                    if (storage.actualShowCurrenciesShortcuts[
                                            storage
                                                .actualChangingCurrencyIndex] ==
                                        storage.currency) {
                                      storage.currency = currency.symbol;
                                    }
                                    storage.actualShowCurrenciesShortcuts[
                                            storage
                                                .actualChangingCurrencyIndex] =
                                        currency.symbol;
                                  }
                                  storage.changeCurrencyPage = 0;
                                  storage.caclucatorPageController
                                      .animateToPage(
                                    1,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              );
                            }));
                  }))
              .toList()),
    );
  }
}
