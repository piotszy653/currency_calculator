import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _pages = [
    'International payments',
    'Cryptocurrencies',
    'Diagrams'
  ];
  final _controller = PageController(
    initialPage: 1,
  );
  int _page = 1;
  BoxDecoration _navigationBorder(int index) {
    if (_page == index) {
      return BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white, width: 4.0)));
    } else {
      return BoxDecoration();
    }
  }

  static int _darkThemColor = 0xFF222222;
  static int _softGray = 0x12344321;
  static String _appName = 'Math Currency';
  Color _themColor1 = Color(_darkThemColor);
  Color _themColor2 = Color(_softGray);
  Color _fontColor1 = Colors.white;
  Color _fontColor2 = Colors.black;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(_appName),
            elevation: 0.0,
            backgroundColor: _themColor1,
          ),
          drawer: Drawer(
              child: Column(
            children: <Widget>[
              Container(
                height: 200,
                color: _themColor1,
                child: Text(_appName,
                    style: TextStyle(fontSize: 25, color: _fontColor1)),
                alignment: Alignment(-0.6, 0.6),
              )
            ],
          )),
          body: Column(children: [
            Container(
                height: 36,
                color: _themColor1,
                child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: _pages
                      .map((page) => GestureDetector(
                          onTap: () {
                            _controller.animateToPage(
                              _pages.indexOf(page),
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            height: 50.0,
                            padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                            decoration: _navigationBorder(_pages.indexOf(page)),
                            child: Text(page,
                                style: TextStyle(
                                    fontSize: 14, color: _fontColor1)),
                          )))
                      .toList(),
                )),
            Expanded(
              child: PageView(
                onPageChanged: onPageChanged,
                controller: _controller,
                children: _pages
                    .map((page) => Container(
                          color: _themColor2,
                          child: Text(page, style: TextStyle(fontSize: 30)),
                        ))
                    .toList(),
              ),
            )
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add_circle, color: Colors.black),
            backgroundColor: _themColor1,
          )),
    );
  }

  void onPageChanged(int value) {
    setState(() {
      this._page = value;
    });
  }
}
