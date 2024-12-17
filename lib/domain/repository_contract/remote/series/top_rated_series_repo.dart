import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/series/TopRatedSeriesEntity.dart';

abstract class TopRatedSeriesRepo {
  Future<Either<List<TopRatedSeriesEntity>, String>> getTopRatedSeries();
}
