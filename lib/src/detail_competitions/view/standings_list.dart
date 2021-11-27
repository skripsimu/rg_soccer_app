import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rg_soccer_app/src/competitions/widgets/page_unavailable.dart';
import 'package:rg_soccer_app/src/detail_competitions/blocs/standing_bloc/standing_bloc.dart';
import 'package:rg_soccer_app/src/detail_competitions/widgets/widgets.dart';
import 'package:rg_soccer_app/src/utils/rg_color.dart';

class StandingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StandingBloc, StandingState>(
      builder: (context, state) {
        switch (state.status) {
          case StandingStatus.failure:
            return PageUnavailable(
              icon: Icons.signal_wifi_connected_no_internet_4,
              message: 'There is no internet connection',
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
