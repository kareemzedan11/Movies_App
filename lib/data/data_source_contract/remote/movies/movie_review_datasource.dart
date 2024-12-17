import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/movies/movie_review/MoviesReviewResponse.dart';

abstract class MovieReviewDataSource {
  Future<Either<MoviesReviewResponse,String>> getMovieReview({required num movieId});
}