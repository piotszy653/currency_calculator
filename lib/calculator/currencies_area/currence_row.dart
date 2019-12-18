import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrenceRow extends StatelessWidget {
  String name;
  String shortcut;
  double value;
  int id;
  bool top, bottom;
  CurrenceRow(
      {this.shortcut,
      this.name,
      this.value,
      this.top = false,
      this.bottom = false,
      this.id});

  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color backgroundLight =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighter;
    Color backgroundlighterSoft =
        storage.thems[storage.themIndex.toInt()].backgrounds.lighterSoft;
    Color fontColorDark = storage.thems[storage.themIndex.toInt()].fonts.dark;

    bool selected = storage.currency == id;
    EdgeInsets topPadding = new EdgeInsets.only(right: 10.0);
    EdgeInsets bottomPadding = new EdgeInsets.only(right: 10.0);
    Text calculationText;
    if (top) {
      topPadding = new EdgeInsets.only(right: 10.0, top: 5);
    }

    if (bottom) {
      bottomPadding = new EdgeInsets.only(right: 10.0, bottom: 5);
    }

    if (selected) {
      calculationText = Text(
        "sdsd",
        style: TextStyle(fontSize: 11, color: fontColorDark),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        overflow: TextOverflow.fade,
        maxLines: 1,
        softWrap: false,
      );
    }

    return GestureDetector(
        onTap: () {
          storage.currency = id;
        },
        child: AnimatedContainer(
          height: selected ? 65 : 59,
          color: selected ? backgroundlighterSoft : backgroundLight,
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        height: 45,
                        padding: EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 5, bottom: 5),
                        child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/800px-Flag_of_Europe.svg.png',
                            fit: BoxFit.cover),
                      )
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      shortcut,
                      style: TextStyle(fontSize: 20, color: fontColorDark),
                    )
                  ],
                ),
                Expanded(
                    child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              padding: topPadding,
                              child: calculationText,
                            ),
                            Container(
                              padding: new EdgeInsets.only(right: 10.0),
                              child: Text(
                                value.toString(),
                                style: TextStyle(
                                    fontSize: 22, color: fontColorDark),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ),
                            Container(
                              padding: bottomPadding,
                              child: Text(
                                name,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 11, color: fontColorDark),
                                textDirection: TextDirection.rtl,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ),
                          ],
                        )))
              ],
            ),
          ]),
          duration: Duration(milliseconds: 400),
        ));
  }
}
