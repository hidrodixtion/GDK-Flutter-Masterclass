import 'package:flutter/material.dart';

import 'package:gdk_flutter/service.dart';

import 'package:gdk_flutter/model/team.dart';

import 'package:gdk_flutter/desc_page.dart';

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() {
    return new SecondPageState();
  }
}

class SecondPageState extends State<SecondPage> {
  var teams = List<Team>();

  @override
  void initState() {
    super.initState();

    _getData();
  }

  void _getData() async {
    var listTeam = await Service().getTeams();
    print(listTeam);
    setState(() {
      teams = listTeam;
    });
  }

  void _openDescription(Team team) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DescPage(team),
      ),
    );
  }

  Widget _createList() {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () => _openDescription(teams[position]),
            leading: Image.network(
              teams[position].badge,
              width: 48,
              height: 48,
              fit: BoxFit.scaleDown,
            ),
            title: Text(teams[position].name),
          ),
        );
      },
      itemCount: teams.length,
    );
  }

  Widget _networkWidget() {
    if (teams.length == 0) {
      return Center(child: CircularProgressIndicator());
    } else {
      return _createList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
        ),
        body: _networkWidget());
  }
}
