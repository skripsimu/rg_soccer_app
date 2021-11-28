import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rg_soccer_app/src/detail_competitions/models/models.dart';
import "package:collection/collection.dart";

import 'matches_item.dart';

class HeaderMatchesItem extends StatelessWidget {
  const HeaderMatchesItem({Key? key, required this.matches}) : super(key: key);

  final List<Matches> matches;

  @override
  Widget build(BuildContext context) {
    var groupByDate = groupBy(matches, (Matches match) => match.utcDate.toString().substring(0, 10));
    return ListView(
        children: groupByDate.entries.map((entry) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(Icons.calendar_today, color: Colors.white, size: 18),
                SizedBox(width: 6),
                Text(
                  DateFormat('yyyy-MM-dd').format(
                    DateTime.parse(
                      entry.key.toString(),
                    ),
                  ),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Wrap(
            children: List.generate(
              entry.value.length,
              (index) => MatchesItem(
                matches: entry.value[index],
              ),
            ),
          )
        ],
      );
    }).toList());
  }
}
