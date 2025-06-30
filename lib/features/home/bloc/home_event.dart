abstract class HomeEvent {}

class LoadTodayMatches extends HomeEvent {}

class LoadTomorrowMatches extends HomeEvent {}

class LoadYesterdayMatches extends HomeEvent {}

class SwitchTab extends HomeEvent {
  final int tabIndex;
  SwitchTab(this.tabIndex);
}