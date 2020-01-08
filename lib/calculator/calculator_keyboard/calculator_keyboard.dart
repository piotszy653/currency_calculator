import 'package:currency_calculator/Storage/Storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'keyboard_tile.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  KayboardTile(title: "("),
                  KayboardTile(
                    title: ")",
                  ),
                  KayboardTile(
                    title: "[",
                  ),
                  KayboardTile(
                    title: "]",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  KayboardTile(
                    title: "7",
                  ),
                  KayboardTile(
                    title: "8",
                  ),
                  KayboardTile(
                    title: "9",
                  ),
                  KayboardTile(
                    title: "+",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  KayboardTile(
                    title: "4",
                  ),
                  KayboardTile(
                    title: "5",
                  ),
                  KayboardTile(
                    title: "6",
                  ),
                  KayboardTile(
                    title: "-",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  KayboardTile(
                    title: "1",
                  ),
                  KayboardTile(
                    title: "2",
                  ),
                  KayboardTile(
                    title: "3",
                  ),
                  KayboardTile(
                    title: "*",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  KayboardTile(
                    title: ",",
                  ),
                  KayboardTile(
                    title: "0",
                  ),
                  KayboardTile(
                      title: "del",
                      callback: () {
                        String calcInput = storage.calculationInput;
                        if (calcInput.length - 1 >= 0) {
                          storage.calculationInput = calcInput.substring(
                              0, calcInput.length - 1);
                        }
                      }),
                  KayboardTile(title: "/"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
