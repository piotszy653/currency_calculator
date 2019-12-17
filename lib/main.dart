import 'package:currency_calculator/display_area/display_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './navigation/navigation.dart';
import './Storage/Storage.dart';
import './side_menu.dart';
import './app_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Storage>.value(
        value: Storage(),
        child: MaterialApp(
          home: Scaffold(
            appBar: MainAppBar(),
            drawer: SideMenu(),
            body: Column(children: [Navigation(), DisplayArea()]),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {},
            //   backgroundColor: _fontColor2,
            //   child: Icon(
            //     Icons.cached,
            //     color: _fontColor1,
            //     size: 33,
            //   ),
            // )
          ),
        ));
  }
}
