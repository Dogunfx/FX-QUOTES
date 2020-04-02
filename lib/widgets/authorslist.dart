import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my/widgets/authorsscreen.dart';
import '../models/authors.dart';

class Authors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Top Authors",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
              children: authors.asMap().entries.map((MapEntry map) {
            return Card(
              child: GestureDetector(
                onTap: () {
                  return Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Author(
                                author: authors[map.key],
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Hero(
                      tag: authors[map.key].name,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image(
                          width: 60,
                          height: 60,
                          image: AssetImage('${authors[map.key].imgSRC}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text("${authors[map.key].name}"),
                    trailing: Icon(
                      FontAwesomeIcons.quora,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
            );
          }).toList()),
        ],
      ),
    );
  }
}
