import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BoxDecoration _navigationBorder(int index) {
      if (_page == index) {
        return BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white, width: 4.0)));
      } else {
        return BoxDecoration();
      }
    }

    return Container(
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
  }
}