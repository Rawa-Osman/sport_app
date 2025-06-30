import 'package:sport_app/core/error/exceptions.dart';
import 'package:sport_app/features/home/data/model/home_model.dart';

enum MatchTab { today, upcoming, past }

class HomeState {
  final MatchTab currentTab;
  final MatchData? todayMatches;
  final MatchData? tomorrowMatches;
  final MatchData? yesterdayMatches;
  final bool isLoadingToday;
  final bool isLoadingTomorrow;
  final bool isLoadingYesterday;
  final AppException? todayError;
  final AppException? tomorrowError;
  final AppException? yesterdayError;

  const HomeState({
    this.currentTab = MatchTab.today,
    this.todayMatches,
    this.tomorrowMatches,
    this.yesterdayMatches,
    this.isLoadingToday = false,
    this.isLoadingTomorrow = false,
    this.isLoadingYesterday = false,
    this.todayError,
    this.tomorrowError,
    this.yesterdayError,
  });

  HomeState copyWith({
    MatchTab? currentTab,
    MatchData? todayMatches,
    MatchData? tomorrowMatches,
    MatchData? yesterdayMatches,
    bool? isLoadingToday,
    bool? isLoadingTomorrow,
    bool? isLoadingYesterday,
    AppException? todayError,
    AppException? tomorrowError,
    AppException? yesterdayError,
    bool clearTodayError = false,
    bool clearTomorrowError = false,
    bool clearYesterdayError = false,
  }) {
    return HomeState(
      currentTab: currentTab ?? this.currentTab,
      todayMatches: todayMatches ?? this.todayMatches,
      tomorrowMatches: tomorrowMatches ?? this.tomorrowMatches,
      yesterdayMatches: yesterdayMatches ?? this.yesterdayMatches,
      isLoadingToday: isLoadingToday ?? this.isLoadingToday,
      isLoadingTomorrow: isLoadingTomorrow ?? this.isLoadingTomorrow,
      isLoadingYesterday: isLoadingYesterday ?? this.isLoadingYesterday,
      todayError: clearTodayError ? null : (todayError ?? this.todayError),
      tomorrowError: clearTomorrowError ? null : (tomorrowError ?? this.tomorrowError),
      yesterdayError: clearYesterdayError ? null : (yesterdayError ?? this.yesterdayError),
    );
  }

  // Helper getters for current tab data
  MatchData? get currentMatches {
    switch (currentTab) {
      case MatchTab.today:
        return todayMatches;
      case MatchTab.upcoming:
        return tomorrowMatches;
      case MatchTab.past:
        return yesterdayMatches;
    }
  }

  bool get isCurrentTabLoading {
    switch (currentTab) {
      case MatchTab.today:
        return isLoadingToday;
      case MatchTab.upcoming:
        return isLoadingTomorrow;
      case MatchTab.past:
        return isLoadingYesterday;
    }
  }

  AppException? get currentTabError {
    switch (currentTab) {
      case MatchTab.today:
        return todayError;
      case MatchTab.upcoming:
        return tomorrowError;
      case MatchTab.past:
        return yesterdayError;
    }
  }
}
