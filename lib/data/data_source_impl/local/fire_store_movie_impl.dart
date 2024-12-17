import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/data/data_source_contract/local/fire_store_movie.dart';
import 'package:movies_app/data/models/firsbase_model/firebase_movie_model.dart';

@Injectable(as: FireStoreMovieDataSource)
class FireStoreMovieDateSourceImpl extends FireStoreMovieDataSource {
  FireStoreHelper fireStoreHelper;
  @factoryMethod
  FireStoreMovieDateSourceImpl(this.fireStoreHelper);
  @override
  Future<Either<Stream<List<FireBaseMovieModel>>, String>> getMovieAndSeries(
      {required String userId}) async {
    try {
      var response = fireStoreHelper.listenMoviesAndSeries(userid: userId);
      Stream<List<FireBaseMovieModel>> result = response;
      return Left(result);
    } catch (e) {
      return Right(e.toString());
    }
  }
  
  @override
  Future<Either<Stream<List<FireBaseMovieModel>>, String>> getMovieOrSeries({required String userId, required String type}) async{
   try {
      var response = fireStoreHelper.listenMoviesOrSeries(userid: userId, type: type);
      Stream<List<FireBaseMovieModel>> result = response;
      return Left(result);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
