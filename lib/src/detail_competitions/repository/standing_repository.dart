import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:rg_soccer_app/src/config/config.dart';
import 'package:rg_soccer_app/src/config/methods.dart';
import 'package:rg_soccer_app/src/detail_competitions/models/models.dart';
import 'package:rg_soccer_app/src/detail_competitions/models/team.dart';

Future<List<Standings>> fetchStandings(
    http.Client httpClient, String id) async {
  final response = await httpClient.get(
    Uri.parse(Methods.leagues + '/$id' + Methods.standings),
    headers: {'X-Auth-Token': Key.authToken},
  );
  if (response.statusCode == 200) {
    final body = json.decode(response.body)['standings'][0]['table'] as List;
    return body.map((dynamic json) {
      return Standings(
        position: json['position'] as int,
        draw: json['draw'] as int,
        goalDifference: json['goalDifference'] as int,
        goalsAgainst: json['goalsAgainst'] as int,
        goalsFor: json['goalsFor'] as int,
        lost: json['lost'] as int,
        playedGames: json['playedGames'] as int,
        points: json['points'] as int,
        won: json['won'] as int,
        team: Team(
          id: json['team']['id'] as int,
          name: json['team']['name'] as String,
          crestUrl: (json['team']['crestUrl'] ?? 'https://e7.pngegg.com/pngimages/710/859/png-clipart-logo-football-team-football-logo-design-free-logo-design-template-label-thumbnail.png') as String,
        ),
      );
    }).toList();
  }
  throw Exception('error fetching competitions');
}
