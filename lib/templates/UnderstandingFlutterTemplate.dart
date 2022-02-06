import 'package:flutter/material.dart';


void main() => runApp(MyApp());


/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Text(
      'Hello',
      style: TextStyle(
        fontSize: 30,
        color: Colors.red
      ),
    );

    
    TextView text =  TextView();
    text.setColor("red");
    text.setFontsize(50);
    text.setText("Hello");
    return Text('nothing');


  }
}

class TextView {
  late String _color;
  late String _text;
  late int _fontsize;

  void setColor(String value) {
    _color = value;
  }

  void setText(String value) {
    _text = value;
  }

  void setFontsize(int value) {
    _fontsize = value;
  }

}