import 'package:dartz/dartz.dart';
import 'package:sport_app/core/error/exceptions.dart';
import 'package:sport_app/core/repository/repository_helper.dart';
import 'package:sport_app/features/home/data/home_provider/home_provider.dart';
import 'package:sport_app/features/home/data/model/home_model.dart';


class HomeRepo extends RepositoryHelper {
    final HomeProvider provider;

  HomeRepo({required this.provider});

  Future<Either<AppException,MatchData >> getTomorrowMatches() async {
    return request(body: () async {
      final response = await provider.getTomorrowMatches();
      return Right(response);
    });
  }
  Future<Either<AppException,MatchData >> getTodayMatches() async {
    return request(body: () async {
      final response = await provider.getTodayMatches();
      return Right(response);
    });
  }
  Future<Either<AppException,MatchData >> getYesterdayMatches() async {
    return request(body: () async {
      final response = await provider.getYesterdayMatches();
      return Right(response);
    });
  }
}