import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'higher_app_bar.dart';
import '../display_area/display_area.dart';
import '../navigation/navigation.dart';

class ChangeCurrenciePage extends StatelessWidget {
  VoidCallback backCallback;
  ChangeCurrenciePage({this.backCallback});

  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundLightSoft =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighterSoft;

    return Column(children: <Widget>[
      HigherAppBar(title: "Change currency", returnCallback: backCallback),
      Expanded(child: Column(children: [Navigation(changeCurrency: true), DisplayArea(changeCurrency: true)]))
    ]);
  }
}
