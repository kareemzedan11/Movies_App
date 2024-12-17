import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movies/MovieReviewEntity.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/movie_review_repo.dart';

@injectable
class MovieReviewUsecase {
  MovieReviewRepo movieReviewRepo;
  @factoryMethod
  MovieReviewUsecase(this.movieReviewRepo);
  Future<Either<List<MovieReviewEntity>, String>> call(
          {required int movieId}) =>
      movieReviewRepo.getMovieReview(movieId: movieId);
}
