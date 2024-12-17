import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/firsbase_model/firebase_movie_model.dart';
import 'package:movies_app/domain/repository_contract/local/fire_store_movie_repository.dart';

@injectable
class FireStoreMovieUseCase {
  FireStoreMovieRepository fireStoreMovieRepository;
  @factoryMethod
  FireStoreMovieUseCase(this.fireStoreMovieRepository);
  Future<Either<Stream<List<FireBaseMovieModel>>, String>>
      callGetMovieAndSeries({required String userId}) =>
          fireStoreMovieRepository.getMovieAndSeries(userId: userId);
  Future<Either<Stream<List<FireBaseMovieModel>>, String>> callGetMovieOrSeries(
          {required String userId, required String type}) =>
      fireStoreMovieRepository.getMovieOrSeries(userId: userId, type: type);
}
