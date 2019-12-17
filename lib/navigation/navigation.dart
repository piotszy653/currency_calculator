import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundDarker =
        storage.thems[storage.themIndex.toInt()].backgrounds.darker;
    Color backgroundLighter =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighter;
    Color fontColorLight = storage.thems[storage.themIndex.toInt()].fonts.light;

    BoxDecoration _navigationBorder(int index) {
      if (storage.page == index) {
        return BoxDecoration(
            border: Border(
                bottom: BorderSide(color: backgroundLighter, width: 4.0)));
      } else {
        return BoxDecoration();
      }
    }

    return Container(
        height: 36,
        color: backgroundDarker,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: storage.pages
              .map((page) => GestureDetector(
                  onTap: () {
                    storage.controller.animateToPage(
                      storage.pages.indexOf(page),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    height: 50.0,
                    padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                    decoration: _navigationBorder(storage.pages.indexOf(page)),
                    child: Text(page,
                        style: TextStyle(fontSize: 14, color: fontColorLight)),
                  )))
              .toList(),
        ));
  }
}
