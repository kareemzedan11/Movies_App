import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/movies/rating/RatingResponse.dart';

abstract class RatingDataSource {
  Future<Either<RatingResponse,String>>getRate({required num movieId});
}