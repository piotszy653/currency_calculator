import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundLight =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighter;

    void onPageChanged(int value) {
      storage.page = value;
    }

    return Expanded(
      child: PageView(
        onPageChanged: onPageChanged,
        controller: storage.controller,
        children: storage.pages
            .map((page) => Container(
                  color: backgroundLight,
                  // child: Text(page, style: TextStyle(fontSize: 30)),
                ))
            .toList(),
      ),
    );
  }
}
