import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/movies/toprated_model/TopRatedResponse.dart';

abstract class TopRatedDataSource {
  Future<Either<TopRatedResponse, String>> getTopRated();
}
