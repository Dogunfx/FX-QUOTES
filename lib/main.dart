import 'package:flutter/material.dart';
import 'package:my/widgets/authorslist.dart';
import 'package:my/widgets/categorycarousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:font_awesome_flutter';
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.heart,
    FontAwesomeIcons.bookmark,
    Icons.bubble_chart,
    Icons.cake,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(index);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          color: _selectedIndex == index
              ? Colors.white
              : Theme.of(context).accentColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar("QUOTES"),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              "What Category of quotes are you looking for?",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map(
                  (MapEntry map) => _buildIcon(map.key),
                )
                .toList(),
          ),
          SizedBox(
            height: 30,
          ),
          CategoryCarousel(),
          Authors(),
        ],
      )),
    );
  }
}
