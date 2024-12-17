import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/firsbase_model/firebase_movie_model.dart';

abstract class FireStoreMovieRepository {
  Future<Either<Stream<List<FireBaseMovieModel>>, String>> getMovieAndSeries(
      {required String userId});
  Future<Either<Stream<List<FireBaseMovieModel>>, String>> getMovieOrSeries(
      {required String userId, required String type});
}
