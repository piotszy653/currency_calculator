import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_bar.dart';
import 'change_them.dart';

class SettingsPage {
  mainBottomSheet(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundDark =
        storage.thems[storage.themIndex.toInt()].backgrounds.darker;
    Color backgroundLight =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighter;
    Color fontColorDark = storage.thems[storage.themIndex.toInt()].fonts.dark;
    TextStyle recordTextStyle = TextStyle(fontSize: 14, color: fontColorDark, fontWeight: FontWeight.w300);
    ChangeThemDialog changeThemDialog = new ChangeThemDialog();

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
                MainAppBar(),
              ],
            ),
            Expanded(
              child: Container(
                  color: backgroundLight,
                  child: Column(children: <Widget>[
                    ListTile(
                      title: Text('Change Them', style: recordTextStyle),
                      onTap: () {
                        changeThemDialog.openDialog(context);
                      },
                    ),
                  ])),
            )
          ]);
        });
  }
}
