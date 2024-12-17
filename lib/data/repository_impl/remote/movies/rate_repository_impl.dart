import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/rating_datasource.dart';
import 'package:movies_app/data/models/movies/rating/Results.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/rating_repository.dart';

@Injectable(as: RatingRepository)
class RatingRepositoryImpl extends RatingRepository {
  RatingDataSource ratingDataSource;
  RatingRepositoryImpl(this.ratingDataSource);
  @override
  Future<Either<List<RateResults>, String>> getRate(
      {required num movieId}) async {
    var result = await ratingDataSource.getRate(movieId: movieId);
    return result.fold((response) {
      return Left(response.results ?? []);
    }, (error) {
      return Right(error);
    });
  }
}
