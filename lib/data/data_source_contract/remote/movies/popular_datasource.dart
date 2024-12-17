import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/movies/popular_model/popular_response.dart';

abstract class PopularDataSource {
  Future<Either<PopularResponse, String>> getPopulerSeries({required int page});
}
