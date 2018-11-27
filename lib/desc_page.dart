import 'package:flutter/material.dart';

import 'package:gdk_flutter/model/team.dart';

class DescPage extends StatelessWidget {
  final Team team;

  DescPage(this.team);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(team.name),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Text(team.description)
          ],
        ),
      ),
    );
  }
}