import 'package:currency_calculator/Storage/Storage.dart';
import 'package:currency_calculator/api/Currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrenceRow extends StatelessWidget {
  String name;
  String shortcut;
  String imageUrl;
  String value;
  int id;
  bool top, bottom;
  Currency currency;
  CurrenceRow(int id, Currency currency,
      {this.value = "", this.top = false, this.bottom = false}) {
    shortcut = currency.symbol;
    imageUrl = currency.logoUrl;
    name = currency.name != null ? currency.name : "";
    this.currency = currency;
  }

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
                            width: 64.0,
                            height: 40.0,
                            padding: EdgeInsets.only(
                                left: 12.0, right: 12.0, top: 5, bottom: 5),
                            child: Container(
                                decoration: BoxDecoration(
                                    //shape: BoxShape.circle,
                                    boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            7.0) //         <--- border radius here
                                        ),
                                    border: Border.all(
                                      color: fontColorDark,
                                      width: 1,
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/images/" +
                                          currency.symbol.toLowerCase() +
                                          ".jpg"),
                                    )))),
                        // Container(
                        //     height: 45,
                        //     width: 65,
                        //     padding: EdgeInsets.only(
                        //         left: 12.0, right: 12.0, top: 5, bottom: 5),
                        //     child: Image(
                        //         image: AssetImage("assets/images/" +
                        //             currency.symbol.toLowerCase() +
                        //             ".jpg"),
                        //         fit: BoxFit.cover)),
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
            if (direction == DismissDirection.startToEnd) {
              storage.actualChangingCurrencyIndex =
                  storage.actualShowCurrenciesShortcuts.indexOf(shortcut);
            }
            if (direction == DismissDirection.endToStart) {
              storage.actualShowingInfo = this.currency;
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
