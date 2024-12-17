import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/series/top_rated_top_rated_series/TopRatedSeriesResponse.dart';

abstract class TopRatedSeriesDataSource {
  Future<Either<TopRatedSeriesResponse, String>> getTopRatedSeries();
}
