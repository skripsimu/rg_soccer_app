import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rg_soccer_app/rg_bloc_observer.dart';
import 'package:rg_soccer_app/src/app.dart';

void main() async {
  BlocOverrides.runZoned(() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    runApp(App());
  }, blocObserver: RGBlocObserver());
}
