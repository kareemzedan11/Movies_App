import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movies/PopularEntitie.dart';

abstract class PopularRepository {
  Future<Either<List<PopularEntitie>, String>> getPopulerMovies({required int page});
}
