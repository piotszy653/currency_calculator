import 'package:currency_calculator/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Storage/Storage.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundDark =
        storage.thems[storage.themIndex.toInt()].backgrounds.darker;
    Color backgroundLight =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighter;
    Color fontColorLight = storage.thems[storage.themIndex.toInt()].fonts.light;
    Color fontColorDark = storage.thems[storage.themIndex.toInt()].fonts.dark;
    TextStyle recordTextStyle = TextStyle(fontSize: 13, color: fontColorDark);
    SettingsPage settingsPage = new SettingsPage();

    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: 200,
          color: backgroundDark,
          child: Text(storage.appName.toString(),
              style: TextStyle(
                  fontSize: 25,
                  color: fontColorLight,
                  fontWeight: FontWeight.w800)),
          alignment: Alignment(-0.6, 0.6),
        ),
        Expanded(
            child: Container(
                color: backgroundLight,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.help, color: fontColorDark),
                      title: Text('Tips and Questions', style: recordTextStyle),
                    ),
                    ListTile(
                      leading: Icon(Icons.chat, color: fontColorDark),
                      title: Text('Opinion', style: recordTextStyle),
                    ),
                    ListTile(
                      leading: Icon(Icons.thumb_up, color: fontColorDark),
                      title: Text('Like Us', style: recordTextStyle),
                    ),
                    Divider(),
                    Expanded(
                        child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: ListTile(
                        onTap: () {
                          settingsPage.mainBottomSheet(context);
                        },
                        leading: Icon(Icons.settings, color: fontColorDark),
                        title: Text('Settings', style: recordTextStyle),
                      ),
                    ))
                  ],
                )))
      ],
    ));
  }
}
