import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movies/MovieDetailsEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/movie_details_repository.dart';

@injectable
class MovieDetailsUseCase {
  MovieDetailsReposityory movieDetailsReposityory;
  @factoryMethod
  MovieDetailsUseCase(this.movieDetailsReposityory);
  Future<Either<MovieDetailsEntitie, String>> call({required num movieId}) {
   return movieDetailsReposityory.getMovieDetails(movieId: movieId);
  }
}
