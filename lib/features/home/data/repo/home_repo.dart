import 'package:dartz/dartz.dart';
import 'package:sport_app/core/error/exceptions.dart';
import 'package:sport_app/core/repository/repository_helper.dart';
import 'package:sport_app/features/home/data/home_provider/home_provider.dart';
import 'package:sport_app/features/home/data/model/home_model.dart';


class HomeRepo extends RepositoryHelper {
    final HomeProvider provider;

  HomeRepo({required this.provider});
  Future<Either<AppException,MatchData >> getHome() async {
    return request(body: () async {
      final response = await provider.getTomorrowMatches();
      return Right(response);
    });
   
  }
}