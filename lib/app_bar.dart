import 'package:flutter/material.dart';
import './Storage/Storage.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  MainAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color fontColorLight = storage.thems[storage.themIndex.toInt()].fonts.light;
    
    return AppBar(
      title: Text(storage.appName.toString(), style: TextStyle(color: fontColorLight)),
      elevation: 0.0,
      backgroundColor: storage.thems[storage.themIndex.toInt()].backgrounds.darker,
      iconTheme: new IconThemeData(color: fontColorLight),
    );
  }
}
