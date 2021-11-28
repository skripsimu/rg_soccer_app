import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rg_soccer_app/src/competitions/widgets/page_unavailable.dart';
import 'package:rg_soccer_app/src/detail_competitions/blocs/matches_bloc/matches_bloc.dart';
import 'package:rg_soccer_app/src/detail_competitions/widgets/header_matches_item.dart';

class MatchesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesBloc, MatchesState>(
      builder: (context, state) {
        switch (state.status) {
          case MatchesStatus.failure:
            return PageUnavailable(
              icon: Icons.error,
              message: 'Something when wrong, please try again later',
            );
          case MatchesStatus.success:
            if (state.matches.isEmpty) {
              return PageUnavailable(
                icon: Icons.hourglass_empty,
                message: 'No standings tables found',
              );
            }
            return HeaderMatchesItem(matches: state.matches);
          default:
            return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
        }
      },
    );
  }
}
