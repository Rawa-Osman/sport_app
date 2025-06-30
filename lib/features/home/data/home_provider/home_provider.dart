
import 'package:sport_app/core/constants/api_constants.dart';
import 'package:sport_app/core/di/di_config.dart';
import 'package:sport_app/core/network/dio_config.dart';
import 'package:sport_app/features/home/data/model/home_model.dart';

class HomeProvider {
    final dio = getIt<DioConfig>().dio;

  Future<MatchData> getTomorrowMatches () async {
    final response = await dio.get(ApiConstants.tomorrowMatches);
    return MatchData.fromJson(response.data);
  }

  Future<MatchData> getTodayMatches () async {
    final response = await dio.get(ApiConstants.todayMatches);
    return MatchData.fromJson(response.data);
  }

  Future<MatchData> getYesterdayMatches () async {
    final response = await dio.get(ApiConstants.yesterdayMatches);
    return MatchData.fromJson(response.data);
  }
}