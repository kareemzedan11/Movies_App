import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/movies/similer_model/similar_response.dart';

abstract class SimilerDataSource {
  Future<Either<SimilarResponse, String>> getSimiler({required movieId,required int page});
}