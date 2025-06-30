class MatchData {
  final List<CompetitionData> data;
  MatchData({required this.data});


  MatchData copyWith({
    List<CompetitionData>? data,
  }) {
    return MatchData(
      data: data ?? this.data,
    );
  }

  factory MatchData.fromJson(Map<String, dynamic> json) {
    return MatchData(
      data: (json['data'] as List)
          .map((e) => CompetitionData.fromJson(e))
          .toList(),
    );
  }
}

class CompetitionData {
  final Competition competition;
  final List<Match> matches;

  CompetitionData({required this.competition, required this.matches});

 CompetitionData copyWith({
    Competition? competition,
    List<Match>? matches,
  }) {
    return CompetitionData(
      competition: competition ?? this.competition,
      matches: matches ?? this.matches,
    );
  }
  factory CompetitionData.fromJson(Map<String, dynamic> json) {
    return CompetitionData(
      competition: Competition.fromJson(json['competition']),
      matches: (json['matches'] as List).map((e) => Match.fromJson(e)).toList(),
    );
  }
}

// Represents a competition with details and associated matches
class Competition {
  final String? id;
  final String? apiId;
  final String name;
  final String? logo;

  Competition({this.id, this.apiId, required this.name, this.logo});

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      id: json['id'],
      apiId: json['api_id'],
      name: json['name'],
      logo: json['logo'],
    );
  }
}

class Match {
  final String id;
  final String apiId;
  final Team homeTeam;
  final Team awayTeam;
  final int matchStatusId;
  final String matchStatusDescription;
  final String matchDay;
  final String matchTime;

  Match({
    required this.id,
    required this.apiId,
    required this.homeTeam,
    required this.awayTeam,
    required this.matchStatusId,
    required this.matchStatusDescription,
    required this.matchDay,
    required this.matchTime,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      apiId: json['api_id'],
      homeTeam: Team.fromJson(json['home_team']),
      awayTeam: Team.fromJson(json['away_team']),
      matchStatusId: json['match_status_id'],
      matchStatusDescription: json['match_status_description'],
      matchDay: json['match_day'],
      matchTime: json['match_time'],
    );
  }
  Match copyWith({
    Team? homeTeam,
    Team? awayTeam,
  }) {
    return Match(
      id: id,
      apiId: apiId,
      homeTeam: homeTeam ?? this.homeTeam,
      awayTeam: awayTeam ?? this.awayTeam,
      matchStatusId: matchStatusId,
      matchStatusDescription: matchStatusDescription,
      matchDay: matchDay,
      matchTime: matchTime,
    );
  }
}

class Team {
  final String id;
  final String apiId;
  final String name;
  final String shortName;
  final String? logo;
  final List<int> score;
  final String? shirt;
  final bool isDefaultShirt;
  final bool national;

  Team({
    required this.id,
    required this.apiId,
    required this.name,
    required this.shortName,
    this.logo,
    required this.score,
    this.shirt,
    required this.isDefaultShirt,
    required this.national,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      apiId: json['api_id'],
      name: json['name'],
      shortName: json['short_name'],
      logo: json['logo'],
      score: List<int>.from(json['score']),
      shirt: json['shirt'],
      isDefaultShirt: json['is_default_shirt'],
      national: json['national'],
    );
  }

  Team copyWith({
    List<int>? score,
  }) {
    return Team(
      id: id,
      apiId: apiId,
      name: name,
      shortName: shortName,
      logo: logo,
      score: score ?? this.score,
      shirt: shirt,
      isDefaultShirt: isDefaultShirt,
      national: national,
    );
  }
}
