import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rg_soccer_app/src/competitions/models/models.dart';
import 'package:rg_soccer_app/src/competitions/widgets/widgets.dart';
import 'package:rg_soccer_app/src/utils/rg_color.dart';

class CompetitionListItem extends StatelessWidget {
  const CompetitionListItem({Key? key, required this.competitions})
      : super(key: key);

  final Competitions competitions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 96,
      child: InkWell(
        onTap: () {
          print(competitions.id);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 90,
              child: SvgPicture.network(
                competitions.area.ensignUrl,
                height: 60,
                fit: BoxFit.cover,
                placeholderBuilder: (BuildContext context) => RGShimmer.show(),
              ),
            ),
            Container(
              width: 110,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    competitions.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: RGColor.primaryColor,
                    ),
                  ),
                  Text(competitions.area.name,
                      style: TextStyle(
                          fontSize: 12, color: RGColor.secondaryColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
