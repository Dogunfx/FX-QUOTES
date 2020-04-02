import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String mytitle;
  MyAppBar(this.mytitle);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.mytitle),
    );
  }
}
