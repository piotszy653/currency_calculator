import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
              child: Column(
            children: <Widget>[
              Container(
                height: 200,
                color: _themColor1,
                child: Text(_appName,
                    style: TextStyle(fontSize: 25, color: _fontColor1)),
                alignment: Alignment(-0.6, 0.6),
              ),
              ListTile(
                leading: Icon(Icons.help, color: _fontColor2),
                title: Text('Tips and Questions'),
              ),
              ListTile(
                leading: Icon(Icons.chat, color: _fontColor2),
                title: Text('Opinion'),
              ),
              ListTile(
                leading: Icon(Icons.thumb_up, color: _fontColor2),
                title: Text('Like Us'),
              ),
              Divider(),
              Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomRight,
                child: ListTile(
                  leading: Icon(Icons.settings, color: _fontColor2),
                  title: Text('Settings'),
                ),
              ))
            ],
          ))
  }
}
