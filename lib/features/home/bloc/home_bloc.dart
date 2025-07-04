import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/core/constants/api_constants.dart';
import 'package:sport_app/core/services/web_socket_service.dart';
import 'package:sport_app/features/home/bloc/home_event.dart';
import 'package:sport_app/features/home/bloc/home_state.dart';
import 'package:sport_app/features/home/data/model/home_model.dart';
import 'package:sport_app/features/home/data/repo/home_repo.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;
  final WebSocketService webSocketService;
  late StreamSubscription _webSocketSubscription;

  HomeBloc({required this.homeRepo, required this.webSocketService,}) : super(const HomeState()) {
    on<LoadTodayMatches>(_onLoadTodayMatches);
    on<LoadTomorrowMatches>(_onLoadTomorrowMatches);
    on<LoadYesterdayMatches>(_onLoadYesterdayMatches);
    on<SwitchTab>(_onSwitchTab);
    on<UpdateMatchScore>(_onUpdateMatchScore);

    _initWebSocket();

  }
  void _initWebSocket() {
    webSocketService.connect();
    webSocketService.subscribe(ApiConstants.websocketChannel);
    
    _webSocketSubscription = webSocketService.stream.listen((data) {
      try {
        final json = jsonDecode(data);
        if (json['event'] == ApiConstants.scoreEvent) {
          final payload = jsonDecode(json['data']) as List;
          final matchId = payload[0][0] as String;
          final homeScore = List<int>.from(payload[0][2]);
          final awayScore = List<int>.from(payload[0][3]);
          
          add(UpdateMatchScore(matchId, homeScore, awayScore));
        }
      } catch (e) {
        print('WebSocket error: $e');
      }
    });
  }

  void _onUpdateMatchScore(
    UpdateMatchScore event,
    Emitter<HomeState> emit,
  ) {
    MatchData? updateMatches(MatchData? data) {
      if (data == null) return null;
      
      return data.copyWith(
        data: data.data.map((competition) {
          return competition.copyWith(
            matches: competition.matches.map((match) {
              if (match.id == event.matchId) {
                return match.copyWith(
                  homeTeam: match.homeTeam.copyWith(score: event.homeScore),
                  awayTeam: match.awayTeam.copyWith(score: event.awayScore),
                );
              }
              return match;
            }).toList(),
          );
        }).toList(),
      );
    }

    emit(state.copyWith(
      todayMatches: updateMatches(state.todayMatches),
      tomorrowMatches: updateMatches(state.tomorrowMatches),
      yesterdayMatches: updateMatches(state.yesterdayMatches),
    ));
  }

  @override
  Future<void> close() {
    _webSocketSubscription.cancel();
    webSocketService.disconnect();
    return super.close();
  }


  Future<void> _onLoadTodayMatches(
    LoadTodayMatches event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingToday: true, clearTodayError: true));

    final result = await homeRepo.getTodayMatches();
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingToday: false,
        todayError: failure,
      )),
      (matches) => emit(state.copyWith(
        isLoadingToday: false,
        todayMatches: matches,
      )),
    );
  }

  Future<void> _onLoadTomorrowMatches(
    LoadTomorrowMatches event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingTomorrow: true, clearTomorrowError: true));

    final result = await homeRepo.getTomorrowMatches();
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingTomorrow: false,
        tomorrowError: failure,
      )),
      (matches) => emit(state.copyWith(
        isLoadingTomorrow: false,
        tomorrowMatches: matches,
      )),
    );
  }

  Future<void> _onLoadYesterdayMatches(
    LoadYesterdayMatches event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoadingYesterday: true, clearYesterdayError: true));

    final result = await homeRepo.getYesterdayMatches();
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingYesterday: false,
        yesterdayError: failure,
      )),
      (matches) => emit(state.copyWith(
        isLoadingYesterday: false,
        yesterdayMatches: matches,
      )),
    );
  }

  void _onSwitchTab(
    SwitchTab event,
    Emitter<HomeState> emit,
  ) {
    final newTab = MatchTab.values[event.tabIndex];
    emit(state.copyWith(currentTab: newTab));

    // Auto-load data if not already loaded
    switch (newTab) {
      case MatchTab.today:
        if (state.todayMatches == null && !state.isLoadingToday) {
          add(LoadTodayMatches());
        }
        break;
      case MatchTab.upcoming:
        if (state.tomorrowMatches == null && !state.isLoadingTomorrow) {
          add(LoadTomorrowMatches());
        }
        break;
      case MatchTab.past:
        if (state.yesterdayMatches == null && !state.isLoadingYesterday) {
          add(LoadYesterdayMatches());
        }
        break;
    }
  }

  // Convenience method to load initial data
  void loadInitialData() {
    add(LoadTodayMatches());
  }

  // Convenience method to refresh current tab data
  void refreshCurrentTab() {
    switch (state.currentTab) {
      case MatchTab.today:
        add(LoadTodayMatches());
        break;
      case MatchTab.upcoming:
        add(LoadTomorrowMatches());
        break;
      case MatchTab.past:
        add(LoadYesterdayMatches());
        break;
    }
  }
}