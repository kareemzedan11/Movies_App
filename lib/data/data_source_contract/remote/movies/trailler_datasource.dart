import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/movies/trailler/TraillerResponse.dart';

abstract class TraillerDataSource {
  Future<Either<TraillerResponse, String>> getTrailler({required num movieId,required String mediaType});
}
