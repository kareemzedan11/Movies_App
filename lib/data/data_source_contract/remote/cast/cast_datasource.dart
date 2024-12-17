import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/movies/movie_cast/MovieCastResponse.dart';

abstract class CastDatasource {
  Future<Either<CastResponse, String>> getCast({required num mediaId});
}
