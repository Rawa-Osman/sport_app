import 'package:flutter/material.dart';
import 'package:sport_app/core/constants/app_colors.dart';
import 'package:sport_app/core/constants/app_dimentions.dart';
import 'package:sport_app/core/constants/app_images.dart';
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
      // return const Center(child: CircularLoader());  
      return const Center(child: CircularProgressIndicator()); // i prefer this one because of the backroud color
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

    if (matches == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No matches found',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => onRefresh(tab),
              child: const Text('Refresh'),
            ),
          ],
        ),
      );
    }
    if (matches.data.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppDimentions.padding),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: const Image(
                  image: AssetImage(AppImages.empty),
                ),
              ),
            ),
            const Text(
              'No matches are scheduled.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      backgroundColor: AppColors.green,
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
