import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movies/UpcomingEntitie.dart';

abstract class UpcomingRepository {
  Future<Either<List<UpcomingEntitie>, String>> getUpcomingMovies();
}
