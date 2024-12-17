import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movies/MovieDetailsEntitie.dart';

abstract class MovieDetailsReposityory {
  Future<Either<MovieDetailsEntitie, String>> getMovieDetails({required num movieId});
}
