import 'package:flutter/material.dart';
import 'package:rg_soccer_app/src/detail_competitions/models/matches.dart';

class MatchesItem extends StatelessWidget {
  const MatchesItem({Key? key, required this.matches}) : super(key: key);

  final Matches matches;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: (MediaQuery.of(context).size.width / 2) - 40,
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(matches.homeTeam.name,
                  style: TextStyle(fontSize: 12)),
              Text(matches.awayTeam.name,
                  style: TextStyle(fontSize: 12)),
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: matches.status == 'FINISHED'
                      ? Colors.red
                      : matches.status == 'IN_PLAY'
                          ? Colors.green
                          : Colors.amber,
                ),
                child: Text(matches.status,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(matches.score.homeTeam.toString(),
                      style: TextStyle(fontSize: 12)),
                  Text(matches.score.awayTeam.toString(),
                      style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
