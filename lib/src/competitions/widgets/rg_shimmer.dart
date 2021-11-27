import 'package:flutter/material.dart';
import 'package:rg_soccer_app/src/utils/rg_color.dart';
import 'package:shimmer/shimmer.dart';

class RGShimmer {
  static show({
    double? width,
    double? height,
    double? radius,
    Color? baseColor,
    Color? highlightColor,
  }) {
    return SizedBox(
      width: width ?? 90,
      height: height ?? 60,
      child: Shimmer.fromColors(
        baseColor: baseColor ?? RGColor.primaryColor,
        highlightColor: highlightColor ?? RGColor.secondaryColor,
        child: Container(
          width: width ?? 90,
          height: height ?? 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius ?? 0),
          ),
        ),
      ),
    );
  }
}
