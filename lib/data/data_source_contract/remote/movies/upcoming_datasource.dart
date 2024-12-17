import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/movies/upcoming_model/UpcomingResponse.dart';

abstract class UpcomingDataSorce {
  Future<Either<UpcomingResponse, String>> getUpcomingMovies();
}
