import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/movie_review_datasource.dart';
import 'package:movies_app/domain/entities/movies/MovieReviewEntity.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/movie_review_repo.dart';
@Injectable(as: MovieReviewRepo)
class MovieReviewRepoImpl extends MovieReviewRepo {
  MovieReviewDataSource movieReviewDataSource;
  @factoryMethod
  MovieReviewRepoImpl({required this.movieReviewDataSource});
  @override
  Future<Either<List<MovieReviewEntity>, String>> getMovieReview(
      {required num movieId}) async {
    var response = await movieReviewDataSource.getMovieReview(movieId: movieId);
    return response.fold((result) {
    List<MovieReviewEntity>? movieReview =  result.results?.map(
        (e) => e.toMovieReviewEntity(),
      ).toList();
      return Left(movieReview ?? []);
    }, (error) {
      return Right(error);
    });
  }
}
