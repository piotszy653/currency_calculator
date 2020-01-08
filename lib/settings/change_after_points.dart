import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeAfterPointsDialog {
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
          title: new Text("Set number of decimal places.", style: textStyle),
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
                  groupValue: storage.afterTheDecimalPoint,
                  onChanged: (int value) {
                    handleOnChange(1, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("2", style: textStyle),
                onTap: () {
                  handleOnChange(2, context, storage);
                },
                leading: Radio(
                  value: 2,
                  activeColor: backgroundDark,
                  groupValue: storage.afterTheDecimalPoint,
                  onChanged: (int value) {
                    handleOnChange(2, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("3", style: textStyle),
                onTap: () {
                  handleOnChange(3, context, storage);
                },
                leading: Radio(
                  value: 3,
                  activeColor: backgroundDark,
                  groupValue: storage.afterTheDecimalPoint,
                  onChanged: (int value) {
                    handleOnChange(3, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("4", style: textStyle),
                onTap: () {
                  handleOnChange(4, context, storage);
                },
                leading: Radio(
                  value: 4,
                  activeColor: backgroundDark,
                  groupValue: storage.afterTheDecimalPoint,
                  onChanged: (int value) {
                    handleOnChange(4, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("5", style: textStyle),
                onTap: () {
                  handleOnChange(5, context, storage);
                },
                leading: Radio(
                  value: 5,
                  activeColor: backgroundDark,
                  groupValue: storage.afterTheDecimalPoint,
                  onChanged: (int value) {
                    handleOnChange(5, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("6", style: textStyle),
                onTap: () {
                  handleOnChange(6, context, storage);
                },
                leading: Radio(
                  value: 6,
                  activeColor: backgroundDark,
                  groupValue: storage.afterTheDecimalPoint,
                  onChanged: (int value) {
                    handleOnChange(6, context, storage);
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
    storage.afterTheDecimalPoint = value;
    Navigator.of(context).pop();
  }
}