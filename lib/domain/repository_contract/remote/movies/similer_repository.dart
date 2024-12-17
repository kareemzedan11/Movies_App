import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movies/SimilerEntitie.dart';

abstract class SimilerRepository {
  Future<Either<List<SimilerEntitie>, String>> getSimiler({required num movieId,required int page});
}
