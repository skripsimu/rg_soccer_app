import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:rg_soccer_app/src/config/config.dart';
import '../competiotions.dart';

Future<List<Competitions>> fetchCompetitions(http.Client httpClient) async {
  final response = await httpClient.get(
    Uri.parse(Methods.leagues).replace(queryParameters: {
      'plan': 'TIER_ONE',
      'areas': '2072,2224,2114,2081,2088,2163,2187',
    }),
    headers: {'X-Auth-Token': Key.authToken},
  );
  if (response.statusCode == 200) {
    final body = json.decode(response.body)['competitions'] as List;
    return body.map((dynamic json) {
      return Competitions(
        id: json['id'] as int,
        name: json['name'] as String,
        area: Area(
          name: json['area']['name'] as String,
          ensignUrl: json['area']['ensignUrl'] as String,
        ),
      );
    }).toList();
  }
  throw Exception('error fetching competitions');
}
