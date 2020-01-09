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
    Color backgroundLight =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighter;
    Color fontLight = storage.thems[storage.themIndex.toInt()].fonts.light;
    Currency currency = storage.actualShowingInfo;
    Future<String> information = currency.getInfo();
    double c_width = MediaQuery.of(context).size.width * 0.9;

    return Container(
      color: backgroundLight,
      child: SingleChildScrollView(
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
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    width: c_width,
                    child: FutureBuilder<String>(
                      future: information,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(0.0, 40, 0.0, 40.0),
                              child: Text(snapshot.data,
                                  style: TextStyle(color: fontLight)));
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      color: backgroundLight,
                                      height: 300.0,
                                      child: CircularProgressIndicator()))
                            ]);
                      },
                    ))
              ]),
        ],
      )),
    );
  }
}
