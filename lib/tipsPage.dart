import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_bar.dart';

class TipsPage {
  mainBottomSheet(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundDark =
        storage.thems[storage.themIndex.toInt()].backgrounds.darker;
    Color backgroundLight =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighter;
    Color fontColorDark = storage.thems[storage.themIndex.toInt()].fonts.dark;
    TextStyle recordTextStyle = TextStyle(
        fontSize: 14, color: fontColorDark, fontWeight: FontWeight.w300);

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
                MainAppBar(title: "Tips and Questions"),
              ],
            ),
            Expanded(
              child: Container(
                  color: backgroundLight,
                  child: Column(children: <Widget>[
                    ListTile(
                      title: Text('How to...', style: recordTextStyle)
                    ),
                    ListTile(
                      title: Text('Why....',
                          style: recordTextStyle),
                    ),
                  ])),
            )
          ]);
        });
  }
}
