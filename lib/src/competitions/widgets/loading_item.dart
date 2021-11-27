import 'package:flutter/material.dart';
import 'package:rg_soccer_app/src/competitions/widgets/widgets.dart';
import 'package:rg_soccer_app/src/utils/rg_color.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 96,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RGShimmer.show(),
          Container(
            width: 110,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: RGShimmer.show(
              baseColor: RGColor.white,
              highlightColor: RGColor.whiteAccent,
              width: 110,
              height: 35,
              radius: 5,
            ),
          ),
        ],
      ),
    );
  }
}
