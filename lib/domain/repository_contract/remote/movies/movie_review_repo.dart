import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movies/MovieReviewEntity.dart';

abstract class MovieReviewRepo {
  Future<Either<List<MovieReviewEntity>, String>> getMovieReview(
      {required num movieId});
}
