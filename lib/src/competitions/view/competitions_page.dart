import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:rg_soccer_app/src/competitions/blocs/competition_bloc.dart';
import 'package:rg_soccer_app/src/competitions/view/competitions_list.dart';
import 'package:rg_soccer_app/src/utils/assets.dart';
import 'package:rg_soccer_app/src/utils/rg_color.dart';

class CompetitionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RGColor.secondaryColor,
      appBar: AppBar(
        backgroundColor: RGColor.primaryColor,
        elevation: 0,
        title: Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SvgPicture.asset(Assets.logo, height: 20, color: Colors.white),
            SizedBox(width: 5),
            Text('RG Soccer', style: TextStyle(fontSize: 14),),
          ],
        ),
      ),
      body: BlocProvider(
        create: (_) => CompetitionBloc(httpClient: http.Client())
          ..add(CompetitionFetched()),
        child: CompetitionList(),
      ),
    );
  }
}
