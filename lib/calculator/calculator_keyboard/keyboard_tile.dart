import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class KayboardTile extends StatelessWidget {
  String title;
  Function callback;
  KayboardTile({this.title, this.callback});

  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color fontColorDark = storage.thems[storage.themIndex.toInt()].fonts.light;
    TextStyle textStyle = TextStyle(
        fontWeight: FontWeight.w300, fontSize: 19, color: fontColorDark);

    return Expanded(
        child: GestureDetector(
            onTap: callback == null
                ? () {
                    String calcInput = storage.calculationInput;
                    storage.calculationInput = '$calcInput$title';
                  }
                : callback,
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: textStyle,
              ),
            )));
  }
}
