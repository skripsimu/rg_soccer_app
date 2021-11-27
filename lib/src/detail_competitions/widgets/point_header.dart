import 'package:flutter/material.dart';
import 'package:rg_soccer_app/src/detail_competitions/widgets/widgets.dart';
import 'package:rg_soccer_app/src/utils/rg_color.dart';

class PointHeader extends StatelessWidget {
  const PointHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: RGColor.primaryColor,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PointItem(title: 'Pt'),
            PointItem(title: 'P'),
            PointItem(title: 'W'),
            PointItem(title: 'D'),
            PointItem(title: 'L'),
            PointItem(title: 'GF'),
            PointItem(title: 'GA'),
          ],
        ),
      ),
    );
  }
}
