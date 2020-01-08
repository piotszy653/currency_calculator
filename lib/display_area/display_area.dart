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
    Color fontColorLight = storage.thems[storage.themIndex.toInt()].fonts.light;
    void onPageChanged(int value) {
      storage.page = value;
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
                      // return: show loading widget
                    }
                    if (snapshot.hasError) {
                      // return: show error widget
                    }
                    List<Currency> currencys = snapshot.data ?? [];
                    return Container(
                      color: backgroundLight,
                        child: ListView.builder(
                            itemCount: currencys.length,
                            itemBuilder: (context, index) {
                              Currency currency = currencys[index];
                              return new ListTile(
                                contentPadding: EdgeInsets.fromLTRB(55.0, 0, 0, 0),
                                leading:
                                    Image.network(currency.logoUrl, height: 25),
                                // trailing: currency.icon,
                                title: new Text(currency.symbol,
                                    style: TextStyle(fontSize: 14, color: fontColorLight)),
                                // onTap: () {
                                //   Navigator.push(context,
                                //       new MaterialPageRoute(builder: (context) => new Home()));
                                // },
                              );
                            }));
                  }))
              .toList()),
    );
  }
}

// FutureBuilder<List<Currency>>(
//     future: storage.internationalCurrencies,
//     builder: (context, snapshot) {
//       if(snapshot.connectionState != ConnectionState.done) {
//         // return: show loading widget
//       }
//       if(snapshot.hasError) {
//         // return: show error widget
//       }
//       List<Currency> currencys = snapshot.data ?? [];
//       return ListView.builder(
//         itemCount: currencys.length,
//         itemBuilder: (context, index) {
//           Currency currency = currencys[index];
//           return new ListTile(
//             // leading: CircleAvatar(
//             //   backgroundImage: AssetImage(currency.profilePicture),
//             // ),
//             // trailing: currency.icon,
//             title: new Text(currency.symbol),
//             // onTap: () {
//             //   Navigator.push(context,
//             //       new MaterialPageRoute(builder: (context) => new Home()));
//             // },
//           );
//       });
//   })
