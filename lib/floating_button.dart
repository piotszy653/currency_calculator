import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Storage/Storage.dart';
import './calculator/calculator.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color fontColorLight = storage.thems[storage.themIndex.toInt()].fonts.light;
    Color fontColorDark = storage.thems[storage.themIndex.toInt()].fonts.dark;
    Calculator calculator = new Calculator();

    return FloatingActionButton(
      onPressed: () => calculator.mainBottomSheet(context),
      backgroundColor: fontColorDark,
      child: Icon(
        Icons.cached,
        color: fontColorLight,
        size: 33,
      ),
    );
  }
}
