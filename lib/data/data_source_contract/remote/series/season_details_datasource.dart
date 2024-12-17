import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/series/season_details/SeasonDetailsResponse.dart';

abstract class SeasonDetailsDatasource {
  Future<Either<SeasonDetailsResponse, String>> getSeasons(
      {required num seriesId, required num seasonNumber});
}
