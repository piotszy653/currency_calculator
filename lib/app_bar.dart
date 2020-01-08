import 'package:flutter/material.dart';
import './Storage/Storage.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool backButton;
  final VoidCallback returnCallback;
  final String title;
  MainAppBar(
      {Key key,
      bool backButton = false,
      VoidCallback returnCallback,
      String title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        this.backButton = backButton,
        this.returnCallback = returnCallback,
        this.title = title,
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _MainAppBarState createState() =>
      _MainAppBarState(this.backButton, this.returnCallback, this.title);
}

class _MainAppBarState extends State<MainAppBar> {
  _MainAppBarState(this.backButton, this.returnCallback, this.title);
  final bool backButton;
  final VoidCallback returnCallback;
  String title;

  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    Color fontColorLight = storage.thems[storage.themIndex.toInt()].fonts.light;
    List<Widget> actions = [];
    Widget leading;

    if (backButton) {
      actions = [
        new IconButton(
          icon: new Icon(
            Icons.keyboard_arrow_down,
            size: 33,
          ),
          onPressed: () => Navigator.of(context).pop(null),
        )
      ];
      leading = new Container();
    }

    if (returnCallback != null) {
      leading = new GestureDetector(
          onTap: returnCallback, child: new Icon(Icons.arrow_back));
    }

    return AppBar(
      title: Text(title != null ? title : storage.appName.toString(),
          style: TextStyle(color: fontColorLight)),
      elevation: 0.0,
      backgroundColor: storage.thems[storage.themIndex.toInt()].backgrounds.darker,
      iconTheme: new IconThemeData(color: fontColorLight),
      actions: actions,
      leading: leading,
    );
  }
}
