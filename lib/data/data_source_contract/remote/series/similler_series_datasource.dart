import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/series/series_similler/SeriesSimillerResponse.dart';

abstract class SimillerSeriesDatasource {
  Future<Either<SeriesSimillerResponse, String>> getSimilerSeries(
      {required num seriesId,required int page});
}
