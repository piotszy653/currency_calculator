import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemDialog {
  void openDialog(context) {
    final Storage storage = Provider.of<Storage>(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Set Them"),
          content: new Column(
            children: <Widget>[
              ListTile(
                title: Text("Dark orange"),
                onTap: () {
                  handleOnChange(0, context, storage);
                },
                leading: Radio(
                  value: 0,
                  groupValue: storage.themIndex,
                  onChanged: (int value) {
                    handleOnChange(0, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("Yellow"),
                onTap: () {
                  handleOnChange(1, context, storage);
                },
                leading: Radio(
                  value: 1,
                  groupValue: storage.themIndex,
                  onChanged: (int value) {
                    handleOnChange(1, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("Pink"),
                onTap: () {
                  handleOnChange(2, context, storage);
                },
                leading: Radio(
                  value: 2,
                  groupValue: storage.themIndex,
                  onChanged: (int value) {
                    handleOnChange(2, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("Agresive Red"),
                onTap: () {
                  handleOnChange(3, context, storage);
                },
                leading: Radio(
                  value: 3,
                  groupValue: storage.themIndex,
                  onChanged: (int value) {
                    handleOnChange(3, context, storage);
                  },
                ),
              ),
              ListTile(
                title: Text("Brown"),
                onTap: () {
                  handleOnChange(4, context, storage);
                },
                leading: Radio(
                  value: 4,
                  groupValue: storage.themIndex,
                  onChanged: (int value) {
                    handleOnChange(4, context, storage);
                  },
                ),
              )
            ],
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

  handleOnChange(int value, BuildContext context, Storage storage) {
    storage.themIndex = value;
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}
