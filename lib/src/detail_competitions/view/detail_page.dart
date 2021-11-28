import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rg_soccer_app/src/competitions/models/competitions.dart';
import 'package:http/http.dart' as http;
import 'package:rg_soccer_app/src/utils/utils.dart';

import '../detail_competitions.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.competitions}) : super(key: key);

  final Competitions competitions;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RGColor.secondaryColor,
      appBar: AppBar(
        backgroundColor: RGColor.primaryColor,
        elevation: 0,
        title: Text(
          widget.competitions.name,
          style: TextStyle(fontSize: 14),
        ),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: 'Standings'),
            Tab(text: 'Matches'),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          BlocProvider(
            create: (_) => StandingBloc(
              httpClient: http.Client(),
              id: '${widget.competitions.id}',
            )..add(StandingFetched()),
            child: StandingList(),
          ),
          BlocProvider(
            create: (_) => MatchesBloc(
              httpClient: http.Client(),
              id: '${widget.competitions.id}',
            )..add(MatchesFetched()),
            child: MatchesList(),
          ),
        ],
      ),
    );
  }
}
