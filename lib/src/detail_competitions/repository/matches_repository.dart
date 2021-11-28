import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:rg_soccer_app/src/config/config.dart';
import 'package:rg_soccer_app/src/config/methods.dart';
import 'package:rg_soccer_app/src/detail_competitions/models/models.dart';
import 'package:rg_soccer_app/src/detail_competitions/models/score.dart';
import 'package:rg_soccer_app/src/detail_competitions/models/team.dart';

Future<List<Matches>> fetchMatches(http.Client httpClient, String id) async {
  final response = await httpClient.get(
    Uri.parse(Methods.leagues + '/$id' + Methods.matches).replace(
      queryParameters: {
        'dateFrom': DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: -14))),
        'dateTo': DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 14))),
      }
    ),
    headers: {'X-Auth-Token': Key.authToken},
  );
  if (response.statusCode == 200) {
    final body = json.decode(response.body)['matches'] as List;
    return body.map((dynamic json) {
      return Matches(
        status: json['status'] as String,
        utcDate: DateTime.parse(json['utcDate']),
        score: Score(
          homeTeam: (json['score']['fullTime']['homeTeam'] ?? 0) as int,
          awayTeam: (json['score']['fullTime']['awayTeam'] ?? 0) as int,
        ),
        homeTeam: Team(
          id: json['homeTeam']['id'] as int,
          name: json['homeTeam']['name'] as String,
          crestUrl: '',
        ),
        awayTeam: Team(
          id: json['awayTeam']['id'] as int,
          name: json['awayTeam']['name'] as String,
          crestUrl: '',
        ),
      );
    }).toList();
  }
  throw Exception('error fetching competitions');
}
