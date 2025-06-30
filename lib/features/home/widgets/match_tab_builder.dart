import 'package:flutter/material.dart';
import 'package:sport_app/core/error/exceptions.dart';
import 'package:sport_app/features/home/bloc/home_state.dart';
import 'package:sport_app/features/home/data/model/home_model.dart';
import 'package:sport_app/features/home/widgets/competition_widget.dart';

class MatchesTabBuilder extends StatelessWidget {
  final HomeState state;
  final MatchTab tab;
  final Function(MatchTab) onRefresh;

  const MatchesTabBuilder({
    super.key,
    required this.state,
    required this.tab,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = _getLoadingState(state, tab);
    final matches = _getMatchesData(state, tab);
    final error = _getErrorState(state, tab);

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: ${error.toString()}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => onRefresh(tab),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (matches == null || matches.data.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No matches found'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => onRefresh(tab),
              child: const Text('Refresh'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => onRefresh(tab),
      child: ListView.builder(
        itemCount: matches.data.length,
        itemBuilder: (context, index) {
          final competition = matches.data[index];
          return CompetitionWidget(competition: competition);
        },
      ),
    );
  }

  bool _getLoadingState(HomeState state, MatchTab tab) {
    switch (tab) {
      case MatchTab.today:
        return state.isLoadingToday;
      case MatchTab.upcoming:
        return state.isLoadingTomorrow;
      case MatchTab.past:
        return state.isLoadingYesterday;
    }
  }

  MatchData? _getMatchesData(HomeState state, MatchTab tab) {
    switch (tab) {
      case MatchTab.today:
        return state.todayMatches;
      case MatchTab.upcoming:
        return state.tomorrowMatches;
      case MatchTab.past:
        return state.yesterdayMatches;
    }
  }

  AppException? _getErrorState(HomeState state, MatchTab tab) {
    switch (tab) {
      case MatchTab.today:
        return state.todayError;
      case MatchTab.upcoming:
        return state.tomorrowError;
      case MatchTab.past:
        return state.yesterdayError;
    }
  }
}
