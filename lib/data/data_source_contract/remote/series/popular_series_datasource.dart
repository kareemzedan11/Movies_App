import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/series/TopRatedSeriesEntity.dart';

abstract class PopularSeriesDatasource {
  Future<Either<List<TopRatedSeriesEntity>, String>> getPopularSeries({required int page});
}
