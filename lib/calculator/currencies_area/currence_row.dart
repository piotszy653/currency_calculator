import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrenceRow extends StatelessWidget {
  String name;
  String shortcut;
  String imageUrl;
  String value;
  int id;
  bool top, bottom;
  CurrenceRow(
      {this.shortcut,
      this.name,
      this.value,
      this.imageUrl,
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
    Color fontColorLight = storage.thems[storage.themIndex.toInt()].fonts.light;

    bool selected = storage.currency == shortcut;
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
        storage.calculationInput,
        style: TextStyle(fontSize: 11, color: fontColorDark),
        textAlign: TextAlign.right,
        overflow: TextOverflow.fade,
        maxLines: 1,
        softWrap: false,
      );
    }

    return GestureDetector(
        onTap: () {
          storage.currency = shortcut;
        },
        child: Dismissible(
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
                          child: Image.network(imageUrl, fit: BoxFit.cover),
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
                                  selected
                                      ? storage.calculatedValue
                                      : value.toString(),
                                  style: TextStyle(
                                      fontSize: 22, color: fontColorDark),
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
          ),
          onDismissed: (direction) {},
          confirmDismiss: (DismissDirection direction) async {
            if(direction == DismissDirection.startToEnd) {
              storage.actualChangingCurrencyIndex = storage.actualShowCurrenciesShortcuts.indexOf(shortcut);
            }
            storage.caclucatorPageController.animateToPage(
              direction == DismissDirection.startToEnd ? 0 : 2,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
            );
            return null;
          },
          background: Container(
              color: Colors.green,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 14.0),
                    child: Text(
                      "Change currency",
                      style: TextStyle(fontSize: 17, color: fontColorLight),
                    )),
              )),
          secondaryBackground: Container(
              color: Colors.blueAccent,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.only(right: 14.0),
                    child: Text(
                      "Currency information",
                      style: TextStyle(fontSize: 17, color: fontColorLight),
                    )),
              )),
          key: Key(id.toString()),
        ));
  }
}
