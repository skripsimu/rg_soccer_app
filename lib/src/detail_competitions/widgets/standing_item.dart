import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mime/mime.dart';
import 'package:rg_soccer_app/src/detail_competitions/models/models.dart';
import 'package:rg_soccer_app/src/utils/rg_color.dart';

import 'point_item.dart';

class StandingItem extends StatelessWidget {
  const StandingItem({Key? key, required this.standings}) : super(key: key);

  final Standings standings;

  @override
  Widget build(BuildContext context) {
    final mimeType = lookupMimeType(standings.team.crestUrl);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      color: standings.position.isOdd
          ? Colors.white.withOpacity(0.5)
          : Colors.white.withOpacity(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: [
              SizedBox(
                width: 22,
                child: Text(
                  standings.position.toString(),
                  style: TextStyle(
                      color: standings.position.isOdd
                          ? Colors.white
                          : RGColor.primaryColor),
                ),
              ),
              SizedBox(
                width: 22,
                height: 22,
                child: mimeType.toString().contains('svg')
                    ? SvgPicture.network(
                        standings.team.crestUrl,
                        width: 22,
                        height: 22,
                      )
                    : Image.network(
                        standings.team.crestUrl,
                        width: 22,
                        height: 22,
                      ),
              ),
              SizedBox(width: 10),
              Text(
                standings.team.name,
                style: TextStyle(
                    color: standings.position.isOdd
                        ? Colors.white
                        : RGColor.primaryColor),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PointItem(
                  title: '${standings.points}',
                  isOdd: standings.position.isOdd,
                ),
                PointItem(
                  title: '${standings.playedGames}',
                  isOdd: standings.position.isOdd,
                ),
                PointItem(
                  title: '${standings.won}',
                  isOdd: standings.position.isOdd,
                ),
                PointItem(
                  title: '${standings.draw}',
                  isOdd: standings.position.isOdd,
                ),
                PointItem(
                  title: '${standings.lost}',
                  isOdd: standings.position.isOdd,
                ),
                PointItem(
                  title: '${standings.goalsFor}',
                  isOdd: standings.position.isOdd,
                ),
                PointItem(
                  title: '${standings.goalsAgainst}',
                  isOdd: standings.position.isOdd,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
