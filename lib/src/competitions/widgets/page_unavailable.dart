import 'package:flutter/material.dart';

class PageUnavailable extends StatelessWidget {
  const PageUnavailable({Key? key, required this.icon, required this.message})
      : super(key: key);

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity),
        Icon(
          icon,
          color: Colors.white,
          size: 36,
        ),
        SizedBox(height: 5),
        Text(
          message,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
