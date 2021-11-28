import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../competiotions.dart';

class CompetitionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitionBloc, CompetitionState>(
      builder: (context, state) {
        switch (state.status) {
          case CompetitionStatus.failure:
            return PageUnavailable(
              icon: Icons.error,
              message: 'Something when wrong, please try again later',
            );
          case CompetitionStatus.success:
            if (state.competitions.isEmpty) {
              return PageUnavailable(
                icon: Icons.hourglass_empty, 
                message: 'No competitions found',
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: 8,
                  spacing: 8,
                  children: List.generate(
                    state.competitions.length,
                    (index) => CompetitionListItem(
                      competitions: state.competitions[index],
                    ),
                  ),
                ),
              ),
            );
          default:
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                direction: Axis.horizontal,
                runSpacing: 8,
                spacing: 8,
                children: List.generate(
                  10,
                  (index) => LoadingItem(),
                ),
              ),
            );
        }
      },
    );
  }
}
