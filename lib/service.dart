import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:gdk_flutter/model/team.dart';

class Service {
  Future<List<Team>> getTeams() async {
    var response = await http.get("https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=English%20Premier%20League");

    var body = response.body;
    var json = jsonDecode(body);

    var list = (json["teams"] as List).map((team) {
      return Team(team["strTeam"], team["strTeamBadge"], team["strDescriptionEN"]);
    }).toList();

    return list;
  }
}