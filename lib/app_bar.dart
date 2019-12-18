import 'package:flutter/material.dart';
import './Storage/Storage.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool backButton;
  MainAppBar({Key key, bool backButton = false})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        this.backButton = backButton,
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _MainAppBarState createState() => _MainAppBarState(this.backButton);
}

class _MainAppBarState extends State<MainAppBar> {
  _MainAppBarState(this.backButton);
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color fontColorLight = storage.thems[storage.themIndex.toInt()].fonts.light;
    List<Widget> actions = [];
    Widget leading;

    if (backButton) {
      actions = [
        new IconButton(
          icon: new Icon(Icons.keyboard_arrow_down, size: 33,),
          onPressed: () => Navigator.of(context).pop(null),
        )
      ];
      leading = new Container();
    }

    return AppBar(
      title: Text(storage.appName.toString(),
          style: TextStyle(color: fontColorLight)),
      elevation: 0.0,
      backgroundColor:
          storage.thems[storage.themIndex.toInt()].backgrounds.darker,
      iconTheme: new IconThemeData(color: fontColorLight),
      actions: actions,
      leading: leading,
    );
  }
}
