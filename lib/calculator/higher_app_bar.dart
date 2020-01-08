import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_bar.dart';

class HigherAppBar extends StatelessWidget {
  HigherAppBar({this.backButton = false, this.returnCallback, this.title});
  final bool backButton;
  final VoidCallback returnCallback;
  String title;

  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundDark =
        storage.thems[storage.themIndex.toInt()].backgrounds.darker;

    return Container(
      padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 30.0, bottom: 0.0),
      color: backgroundDark,
      child: MainAppBar(
          backButton: backButton, returnCallback: returnCallback, title: title),
    );
  }
}
