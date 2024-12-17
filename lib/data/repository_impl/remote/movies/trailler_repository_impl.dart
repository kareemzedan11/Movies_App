import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/movies/trailler_datasource.dart';
import 'package:movies_app/domain/entities/movies/TraillerEntity.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/trailler_repository.dart';

@Injectable(as: TraillerRepository)
class TraillerRepositoryImpl extends TraillerRepository {
  TraillerDataSource traillerDataSource;
  @factoryMethod
  TraillerRepositoryImpl(this.traillerDataSource);
  @override
  Future<Either<List<TraillerEntity>, String>> getTrailler(
      {required num movieId,required String mediaType}) async {
    var response = await traillerDataSource.getTrailler(movieId: movieId, mediaType: mediaType);
    return response.fold((trailler) {
      List<TraillerEntity> videoKey =
          trailler.results?.map((key) => key.toTraillerEntity()).toList() ?? [];

      return Left(videoKey);
    }, (error) {
      return Right(error);
    });
  }
}
