abstract class HomeEvent {}

class LoadTodayMatches extends HomeEvent {}

class LoadTomorrowMatches extends HomeEvent {}

class LoadYesterdayMatches extends HomeEvent {}

class SwitchTab extends HomeEvent {
  final int tabIndex;
  SwitchTab(this.tabIndex);
}
class UpdateMatchScore extends HomeEvent {
  final String matchId;
  final List<int> homeScore;
  final List<int> awayScore;

  UpdateMatchScore(this.matchId, this.homeScore, this.awayScore);
}