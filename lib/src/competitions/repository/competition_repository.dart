import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:rg_soccer_app/src/competitions/models/models.dart';
import 'package:rg_soccer_app/src/config/config.dart';
import 'package:rg_soccer_app/src/config/methods.dart';

Future<List<Competitions>> fetchCompetitions(http.Client httpClient) async {
  final response = await httpClient.get(
    Uri.parse(Methods.leagues).replace(queryParameters: {
      'plan': 'TIER_ONE',
      'areas': '2072,2224,2114,2081,2088,2163,2187',
    }),
    headers: {'X-Auth-Token': Config.authToken},
  );
  if (response.statusCode == 200) {
    final body = json.decode(response.body)['competitions'] as List;
    return body.map((dynamic json) {
      return Competitions(
        id: json['id'] as int,
        name: json['name'] as String,
        code: json['plan'] as String,
        area: Area(
          id: json['area']['id'] as int,
          name: json['area']['name'] as String,
          countryCode: json['area']['countryCode'] as String,
          ensignUrl: json['area']['ensignUrl'] as String,
        ),
      );
    }).toList();
  }
  throw Exception('error fetching competitions');
}