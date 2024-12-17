import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movies/TraillerEntity.dart';
import 'package:movies_app/domain/repository_contract/remote/movies/trailler_repository.dart';

@injectable
class TraillerUseCase {
  TraillerRepository traillerRepository;
  @factoryMethod
  TraillerUseCase(this.traillerRepository);
  Future<Either<List<TraillerEntity>, String>> call({required num movieId,required String mediaType}) =>
      traillerRepository.getTrailler(movieId: movieId, mediaType: mediaType);
}
