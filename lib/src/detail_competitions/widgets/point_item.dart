import 'package:flutter/material.dart';
import 'package:rg_soccer_app/src/utils/utils.dart';

class PointItem extends StatelessWidget {
  const PointItem({
    Key? key,
    required this.title,
    this.isOdd = true,
  }) : super(key: key);

  final String title;
  final bool isOdd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isOdd ? Colors.white : RGColor.primaryColor,
        ),
      ),
    );
  }
}
