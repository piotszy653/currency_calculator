import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorKeyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundDark =
        storage.thems[storage.themIndex.toInt()].backgrounds.darker;

    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomRight,
        child: Container(
          color: backgroundDark,
        ),
      ),
    );
  }
}
