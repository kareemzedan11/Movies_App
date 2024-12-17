import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/movies/PopularEntitie.dart';

abstract class NowPlayingDatasource {
  Future<Either<List<PopularEntitie>, String>> getNowPlaying({required int page});
}
