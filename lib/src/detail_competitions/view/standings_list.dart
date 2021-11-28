import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rg_soccer_app/src/competitions/competiotions.dart';
import 'package:rg_soccer_app/src/utils/utils.dart';

import '../detail_competitions.dart';

class StandingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StandingBloc, StandingState>(
      builder: (context, state) {
        switch (state.status) {
          case StandingStatus.failure:
            return PageUnavailable(
              icon: Icons.error,
              message: 'Something when wrong, please try again later',
            );
          case StandingStatus.success:
            if (state.standings.isEmpty) {
              return PageUnavailable(
                icon: Icons.hourglass_empty,
                message: 'No standings tables found',
              );
            }
            return Scaffold(
              backgroundColor: RGColor.secondaryColor,
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, 30),
                child: PointHeader(),
              ),
              body: ListView.builder(
                itemCount: state.standings.length,
                itemBuilder: (context, index) => StandingItem(
                  standings: state.standings[index],
                ),
              ),
            );
          default:
            return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
        }
      },
    );
  }
}
