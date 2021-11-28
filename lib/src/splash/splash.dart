import 'package:flutter/material.dart';
import 'package:rg_soccer_app/src/competitions/competiotions.dart';
import 'package:rg_soccer_app/src/utils/assets.dart';
import 'package:rg_soccer_app/src/utils/rg_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(RGTransition(widget: CompetitionPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Assets.splash),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
