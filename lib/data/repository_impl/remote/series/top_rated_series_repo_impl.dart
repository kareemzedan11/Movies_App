import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/series/top_rated_series_data_source.dart';
import 'package:movies_app/domain/entities/series/TopRatedSeriesEntity.dart';
import 'package:movies_app/domain/repository_contract/remote/series/top_rated_series_repo.dart';

@Injectable(as: TopRatedSeriesRepo)
class TopRatedSeriesRepoImpl extends TopRatedSeriesRepo {
  TopRatedSeriesDataSource topRatedSeriesDataSource;
  @factoryMethod
  TopRatedSeriesRepoImpl(this.topRatedSeriesDataSource);
  @override
  Future<Either<List<TopRatedSeriesEntity>, String>> getTopRatedSeries() async {
    var response = await topRatedSeriesDataSource.getTopRatedSeries();
    return response.fold((result) {
      List<TopRatedSeriesEntity> topRatedSeries = result.results
          ?.map(
            (e) => e.toTopRatedSeriesEntity(),
          )
          .toList() as List<TopRatedSeriesEntity>;
      return Left(topRatedSeries);
    }, (error) {
      return Right(error);
    });
  }
}
