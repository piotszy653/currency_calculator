import 'package:flutter/material.dart';

class DisplayArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
