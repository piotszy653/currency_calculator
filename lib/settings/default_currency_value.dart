import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeDefaultCurrencyValueDialog {
  void openDialog(context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundLight =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighter;
    Color backgroundDark =
        storage.thems[storage.themIndex.toInt()].backgrounds.darker;
    Color fontColorDark = storage.thems[storage.themIndex.toInt()].fonts.dark;
    TextStyle textStyle = TextStyle(color: fontColorDark);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundLight,
          title: new Text("Set Them", style: textStyle),
          content: new Column(
            children: <Widget>[
              ListTile(
                title: Text("1", style: textStyle),
                onTap: () {
                  handleOnChange(1, context, storage);
                },
                leading: Radio(
                  value: 1,
                  activeColor: backgroundDark,
                  groupValue: storage.defaultCurrencyValue,
                  onChanged: (int value) {
                    handleOnChange(1, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("10", style: textStyle),
                onTap: () {
                  handleOnChange(10, context, storage);
                },
                leading: Radio(
                  value: 10,
                  activeColor: backgroundDark,
                  groupValue: storage.defaultCurrencyValue,
                  onChanged: (int value) {
                    handleOnChange(10, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("100", style: textStyle),
                onTap: () {
                  handleOnChange(100, context, storage);
                },
                leading: Radio(
                  value: 100,
                  activeColor: backgroundDark,
                  groupValue: storage.defaultCurrencyValue,
                  onChanged: (int value) {
                    handleOnChange(100, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("1000", style: textStyle),
                onTap: () {
                  handleOnChange(1000, context, storage);
                },
                leading: Radio(
                  value: 1000,
                  activeColor: backgroundDark,
                  groupValue: storage.defaultCurrencyValue,
                  onChanged: (int value) {
                    handleOnChange(1000, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("10 000", style: textStyle),
                onTap: () {
                  handleOnChange(10000, context, storage);
                },
                leading: Radio(
                  value: 10000,
                  activeColor: backgroundDark,
                  groupValue: storage.defaultCurrencyValue,
                  onChanged: (int value) {
                    handleOnChange(10000, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("100 000", style: textStyle),
                onTap: () {
                  handleOnChange(100000, context, storage);
                },
                leading: Radio(
                  value: 100000,
                  activeColor: backgroundDark,
                  groupValue: storage.defaultCurrencyValue,
                  onChanged: (int value) {
                    handleOnChange(100000, context, storage);
                  },
                ),
              )
            ],
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close", style: textStyle),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  handleOnChange(int value, BuildContext context, Storage storage) {
    storage.defaultCurrencyValue = value;
    Navigator.of(context).pop();
  }
}