import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/series/TopRatedSeriesEntity.dart';
import 'package:movies_app/domain/repository_contract/remote/series/top_rated_series_repo.dart';
@injectable
class TopRatedSeriesUseCase {
  TopRatedSeriesRepo topRatedSeriesRepo;
  TopRatedSeriesUseCase({required this.topRatedSeriesRepo});
  Future<Either<List<TopRatedSeriesEntity>, String>> call() =>
      topRatedSeriesRepo.getTopRatedSeries();
}
